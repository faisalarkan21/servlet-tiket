package com.faisalarkan.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.faisalarkan.dao.UserDao;
import com.faisalarkan.encryption.AES;
import com.faisalarkan.helper.ConvertCurrency;
import com.faisalarkan.model.Gabungan;
import com.faisalarkan.model.User;



@WebServlet("/UserController")
public class UserController extends HttpServlet {

	private UserDao dao;
	private static final long serialVersionUID = 1L;
	public static final String lIST_STUDENT = "/listStudent.jsp";
	public static final String INSERT_OR_EDIT = "/student.jsp";
	final String secretKey = "433D9113B5206ED18C6D9F31D991CCCD00CA3803";

	public UserController() {
		dao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter( "action" );

		ConvertCurrency convertCurrency = new ConvertCurrency();

		if( action.equalsIgnoreCase( "getBandaraHarga" ) ) {
			forward = "";
			int idBandara = Integer.parseInt( request.getParameter("idBandara") );
			double harga = dao.getIdBandara(idBandara);
			//			System.out.print(harga);
			response.getWriter().print(harga);


		}else if( action.equalsIgnoreCase( "logout" ) ) {

			HttpSession session = request.getSession();

			session.removeAttribute("id");
			session.removeAttribute("user");
			session.removeAttribute("email");
			response.sendRedirect(request.getContextPath());


		}
  

		else if( action.equalsIgnoreCase( "data-pembeli" ) ) {
			forward = "halaman-user/user/data-pembeli.jsp";


			System.out.println(request.getParameter("userId"));

			int idUser = Integer.parseInt(request.getParameter("userId"));
			Gabungan pembeli = dao.getUserById(idUser);			

			System.out.println(pembeli.getNm_berangkat());
			request.setAttribute("dataPembeli", pembeli );

			request.setAttribute("hargaBerangkatRp", convertCurrency.toRp(pembeli.getHargaBerangkat()));
			request.setAttribute("hargaTujuanRp", convertCurrency.toRp(pembeli.getHargaTujuan()));
			request.setAttribute("hargaTotalRp", convertCurrency.toRp(pembeli.getHarga_tiket()));


			double uangTransfer =  pembeli.getTotal_transfer();  
			boolean hasPaid;


			if (uangTransfer == 0) {
				hasPaid = false;
			}else {
				hasPaid = true;
			}

			request.setAttribute("hasPaid", hasPaid);


			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		} 	else if( action.equalsIgnoreCase( "validasi-tiket" ) ) {
			forward = "halaman-user/user/validasi-tiket.jsp";


			System.out.println(request.getParameter("userId"));

			int idUser = Integer.parseInt(request.getParameter("userId"));
			Gabungan pembeli = dao.getUserById(idUser);			

			double uangTransfer =  pembeli.getUang_transfer_validasi();
			boolean isSend;





			if (uangTransfer == 0) {
				isSend = false;
			}else {
				isSend = true;
			}



			request.setAttribute("hargaBerangkatRp", convertCurrency.toRp(pembeli.getHargaBerangkat()));
			request.setAttribute("hargaTujuanRp", convertCurrency.toRp(pembeli.getHargaTujuan()));
			request.setAttribute("hargaTotalRp", convertCurrency.toRp(pembeli.getHarga_tiket()));



			request.setAttribute("dataPembeli", pembeli );
			request.setAttribute("isSend", isSend);

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		}	else if( action.equalsIgnoreCase( "statistik" ) ) {
			forward = "halaman-user/admin/dashboard-admin.jsp";


			System.out.println(request.getParameter("userId"));

			int idUser = Integer.parseInt(request.getParameter("userId"));
			Gabungan pembeli = dao.getUserById(idUser);			

			double uangTransfer =  pembeli.getUang_transfer_validasi();
			boolean isSend;



			if (uangTransfer == 0) {
				isSend = false;
			}else {
				isSend = true;
			}



			request.setAttribute("dataPembeli", pembeli );
			request.setAttribute("isSend", isSend);

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);

		}


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		ConvertCurrency convert = new ConvertCurrency();

		String forward = "";
		String action = request.getParameter( "action" );
		if( action.equalsIgnoreCase( "daftar" ) ) {

			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();




			forward = "login-user.jsp";
			System.out.println(request.getParameter("totalHargaTiket"));
			Gabungan pembeli = new Gabungan();


			if (request.getParameter("password_conf").equals(request.getParameter("password")) ) {

				String encryptedString = AES.encrypt(request.getParameter("password"), secretKey) ;
				System.out.println(encryptedString);	
  
				pembeli.setNm_pembeli(request.getParameter("nama"));
				pembeli.setEmail_pembeli(request.getParameter("email"));
				pembeli.setPassword(encryptedString);
				pembeli.setHp_pembeli(request.getParameter("hp"));
				pembeli.setGd_pembeli(request.getParameter("gd"));
				pembeli.setBandara_berangkat(Integer.parseInt(request.getParameter("berangkatBandara")));
				pembeli.setBandara_tujuan(Integer.parseInt(request.getParameter("tujuanBandara")));

				try {
					pembeli.setHarga_tiket(convert.UnformatRp(request.getParameter("totalHargaTiket")));
				} catch (ParseException e) {

					e.printStackTrace();
				}

				pembeli.setUang_transfer_validasi(0);
				pembeli.setPilihan_bank(request.getParameter("bank"));
				pembeli.setTgl_order(dateFormat.format(date));
				dao.addPembeli(pembeli);

				RequestDispatcher view = request.getRequestDispatcher( forward );
				view.forward(request, response);

			}else {

				request.setAttribute("error-html", "has-error" );
				request.setAttribute("error-message", "Konfirmasi password tidak sama." );				

				forward = "daftar.jsp";   
				RequestDispatcher view = request.getRequestDispatcher( forward );
				view.forward(request, response);  

			}
		} else if ( action.equalsIgnoreCase( "login-user" ) ) {



			System.out.println(request.getParameter("email"));


			User pembeli = dao.loginUser(request.getParameter("email"));

			String email = request.getParameter("email") ;
			String password = request.getParameter("password");


			System.out.println(pembeli.getEmail_pembeli());
			System.out.println(pembeli.getPassword());
			System.out.println(pembeli.getNm_pembeli());

			String decryptedString = AES.decrypt(pembeli.getPassword(), secretKey) ;
			System.out.println(decryptedString);

			if (email.equalsIgnoreCase(pembeli.getEmail_pembeli())  && password.equalsIgnoreCase(decryptedString)) {

				System.out.println("Email Sama");
				HttpSession session = request.getSession(true); 
				session.setAttribute("id", pembeli.getIdPembeli());
				session.setAttribute("user", pembeli.getNm_pembeli());
				session.setAttribute("email", pembeli.getEmail_pembeli());
				forward = "halaman-user/user/dashboard.jsp";
				response.sendRedirect(forward);

			}else {
				request.setAttribute("error-html", "has-error" );
				request.setAttribute("error-message", "Username atau password anda salah." );

				forward = "login-user.jsp";
				RequestDispatcher view = request.getRequestDispatcher( forward );
				view.forward(request, response);
			}

		} else if  ( action.equalsIgnoreCase( "data-pembeli" )) {


			int idUser = Integer.parseInt(request.getParameter("userId"));
			System.out.println(idUser);

			Gabungan pembeli = new Gabungan ();

			pembeli.setNm_pembeli(request.getParameter("nama"));
			pembeli.setEmail_pembeli(request.getParameter("email"));
			pembeli.setHp_pembeli(request.getParameter("hp"));
			pembeli.setIdUser(idUser);

			dao.updatePembeli(pembeli);		

			response.sendRedirect("UserController?action=data-pembeli&userId="+idUser);


		} else if  ( action.equalsIgnoreCase( "validasi-tiket" )) {

			int idUser = Integer.parseInt(request.getParameter("userId"));

			Gabungan pembeli = new Gabungan ();

			try {
				pembeli.setUang_transfer_validasi(convert.UnformatRp(request.getParameter("hargaTiketTotal")));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pembeli.setPilihan_bank(request.getParameter("pilihanBank"));
			pembeli.setIdUser(idUser);

			System.out.println("asas");
			System.out.println(pembeli.getUang_transfer_validasi());
			dao.updateValidasi(pembeli);		

			response.sendRedirect("UserController?action=validasi-tiket&userId="+idUser);


		}









		//		request.setAttribute("students", dao.getAllStudents());
		//		view.forward(request, response);



	}

}
