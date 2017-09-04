package com.faisalarkan.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.faisalarkan.dao.AdminDao;
import com.faisalarkan.encryption.AES;
import com.faisalarkan.helper.ConvertCurrency;
import com.faisalarkan.model.Admin;
import com.faisalarkan.model.Gabungan;
import com.faisalarkan.model.Statistik;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

	private AdminDao dao;
	private static final long serialVersionUID = 1L;
	public static final String lIST_STUDENT = "/listStudent.jsp";
	public static final String INSERT_OR_EDIT = "/student.jsp";
	final String secretKey = "433D9113B5206ED18C6D9F31D991CCCD00CA3803";

	public AdminController() {    
		dao = new AdminDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter( "action" );
		ConvertCurrency convert = new ConvertCurrency();

		if( action.equalsIgnoreCase( "statistik" ) ) {
			forward = "halaman-user/admin/dashboard-admin.jsp";		
			Statistik statistik = dao.statistikUser();

			String uangEstimasi = convert.toRp(statistik.getTotalEstimasiUang());
			String uangDiterima = convert.toRp(statistik.getTotalUangDiterima());
			String sisaBelumDibayar = convert.toRp(statistik.getTotalEstimasiUang() - statistik.getTotalUangDiterima()); 

			request.setAttribute("dataStatistik", statistik );		
			request.setAttribute("uangEstimasi", uangEstimasi);
			request.setAttribute("uangDiterima", uangDiterima);
			request.setAttribute("uangSisa", sisaBelumDibayar);
			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		} else if( action.equalsIgnoreCase( "getAllPembeli" ) ) {

			forward = "halaman-user/admin/semua-pembeli.jsp";		
			List <Gabungan> gabungan = dao.getAllPembeli();
			request.setAttribute("dataAllPembeli", gabungan );	

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		}else if( action.equalsIgnoreCase( "userDetail" ) ) {

			forward = "halaman-user/admin/detail-user.jsp";		
			int userId = Integer.parseInt(request.getParameter("userId"));		

			Gabungan pembeli = dao.getUserById(userId);			

			String hargaTiket = convert.toRp(pembeli.getHarga_tiket());
			String totalTransfer = convert.toRp(pembeli.getTotal_transfer());

			request.setAttribute("dataPembeli", pembeli );
			request.setAttribute("hargaTiket", hargaTiket);
			request.setAttribute("totalTransfer", totalTransfer);

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		} else if( action.equalsIgnoreCase( "getPembeliLunas" ) ) {

			forward = "halaman-user/admin/pembeli-lunas.jsp";		
			List <Gabungan> gabungan = dao.getPembeliLunas();
			request.setAttribute("dataPembeliLunas", gabungan );	

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		} 
		
		
		
		
		else if( action.equalsIgnoreCase( "getPembeliBelumLunas" ) ) {

			forward = "halaman-user/admin/pembeli-belum-lunas.jsp";		
			List <Gabungan> gabungan = dao.getPembeliBelumLunas();
			request.setAttribute("dataPembeliBelumLunas", gabungan );	

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		}	else if( action.equalsIgnoreCase( "getKotakValidasi" ) ) {

			forward = "halaman-user/admin/kotak-validasi.jsp";		
			List <Gabungan> gabungan = dao.getKotakValidasi();
			request.setAttribute("dataKotakValidasi", gabungan );	

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		} 
		
		
		
		
		else if( action.equalsIgnoreCase( "logout" ) ) {

			HttpSession session = request.getSession();
			session.removeAttribute("admin");
			session.removeAttribute("email");
			response.sendRedirect(request.getContextPath());


		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



		String forward = "";
		String action = request.getParameter( "action" );
		ConvertCurrency convert = new ConvertCurrency();

		if ( action.equalsIgnoreCase( "login-admin" ) ) {



			System.out.println(request.getParameter("email"));


			Admin admin = dao.loginAdmin(request.getParameter("email"));

			String email = request.getParameter("email") ;
			String password = request.getParameter("password");


			System.out.println(admin.getNm_admin());
			System.out.println(admin.getEmail_admin());

			String decryptedString = AES.decrypt(admin.getPass_admin(), secretKey) ;

			if (email.equalsIgnoreCase(admin.getEmail_admin())  && password.equalsIgnoreCase(decryptedString)) {

				forward = request.getContextPath() + "/AdminController?action=statistik";
				System.out.println("Email Sama");
				HttpSession session = request.getSession(true);				
				session.setAttribute("admin", admin.getNm_admin());
				session.setAttribute("email", admin.getEmail_admin());

				response.sendRedirect(forward);

			}

			else { 				

				request.setAttribute("error-html", "has-error" );
				request.setAttribute("error-message", "Username atau password anda salah." );				
				forward = "login-admin.jsp";
				RequestDispatcher view = request.getRequestDispatcher( forward );
				view.forward(request, response);	

			}

		} else if( action.equalsIgnoreCase( "updateDetail" ) ) {
			try {
				forward = "halaman-user/admin/detail-user.jsp";		

				int userId = Integer.parseInt(request.getParameter("userId"));	

				double unFormatRpTrasnfer= 0;

				System.out.println(request.getParameter("uangTotalTransfer").getClass().getName());

				if (request.getParameter("uangTotalTransfer").equals("0")) {

					unFormatRpTrasnfer = Double.parseDouble(request.getParameter("uangTotalTransfer")) ;

				}else {

					unFormatRpTrasnfer = convert.UnformatRp(request.getParameter("uangTotalTransfer")) ;


				}

				double unFormatRpHarga = convert.UnformatRp(request.getParameter("hargaTiket"));

				Gabungan pembeli = new Gabungan ();
				pembeli.setTotal_transfer(unFormatRpTrasnfer);
				pembeli.setIdUser(userId);
				pembeli.setNm_pembeli(request.getParameter("nama"));
				pembeli.setEmail_pembeli(request.getParameter("email"));
				pembeli.setHp_pembeli(request.getParameter("no_hp"));					

				if (unFormatRpTrasnfer  != unFormatRpHarga) {

					pembeli.setStatus(0);

				}else {				

					pembeli.setStatus(1);
				}

				dao.updatePembeliLunas(pembeli);	
				response.sendRedirect("AdminController?action=getAllPembeli");

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


		}	else if( action.equalsIgnoreCase( "deleteDetail" ) ) {	

			int userId = Integer.parseInt(request.getParameter("userId"));	
			dao.deleteUser(userId);				


		}









	}
}
