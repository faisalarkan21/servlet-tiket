package com.faisalarkan.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.faisalarkan.dao.AdminDao;
import com.faisalarkan.dao.UserDao;
import com.faisalarkan.model.Admin;
import com.faisalarkan.model.Gabungan;
import com.faisalarkan.model.User;

@WebServlet("/AdminController")
public class AdminController extends HttpServlet {

	private AdminDao dao;
	private static final long serialVersionUID = 1L;
	public static final String lIST_STUDENT = "/listStudent.jsp";
	public static final String INSERT_OR_EDIT = "/student.jsp";

	public AdminController() {
		dao = new AdminDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter( "action" );
		//
		//		if( action.equalsIgnoreCase( "getBandaraHarga" ) ) {
		//			forward = "";
		//			int idBandara = Integer.parseInt( request.getParameter("idBandara") );
		//			double harga = dao.getIdBandara(idBandara);
		//			//			System.out.print(harga);
		//			response.getWriter().print(harga);
		//
		//
		//		}
		//
		//
		//		else if( action.equalsIgnoreCase( "data-pembeli" ) ) {
		//			forward = "user/data-pembeli.jsp";
		//
		//
		//			System.out.println(request.getParameter("userId"));
		//
		//			int idUser = Integer.parseInt(request.getParameter("userId"));
		//			Gabungan pembeli = dao.getUserById(idUser);			
		//
		//			request.setAttribute("dataPembeli", pembeli );
		//
		//
		//			RequestDispatcher view = request.getRequestDispatcher( forward );
		//			view.forward(request, response);
		//
		//		} 	else if( action.equalsIgnoreCase( "validasi-tiket" ) ) {
		//			forward = "user/validasi-tiket.jsp";
		//
		//
		//			System.out.println(request.getParameter("userId"));
		//
		//			int idUser = Integer.parseInt(request.getParameter("userId"));
		//			Gabungan pembeli = dao.getUserById(idUser);			
		//
		//			double uangTransfer =  pembeli.getUang_transfer_validasi();
		//			boolean isSend;
		//			
		//			
		//			
		//			if (uangTransfer == 0) {
		//				isSend = false;
		//			}else {
		//				isSend = true;
		//			}
		//			
		//		
		//		
		//			request.setAttribute("dataPembeli", pembeli );
		//			request.setAttribute("isSend", isSend);
		//
		//			RequestDispatcher view = request.getRequestDispatcher( forward );
		//			view.forward(request, response);
		//
		//		}


		//		else if( action.equalsIgnoreCase( "insert" ) ) {
		//			forward = INSERT_OR_EDIT;
		//		}
		//		else {
		//			forward = lIST_STUDENT;
		//			request.setAttribute("students", dao.getAllStudents() );
		//		}
		//		RequestDispatcher view = request.getRequestDispatcher( forward );
		//		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//		student.setFirstName( request.getParameter( "firstName" ) );
		//		student.setLastName( request.getParameter( "lastName" ) );
		//
		//
		//		String studentId = request.getParameter("studentId");
		//

		String forward = "";
		String action = request.getParameter( "action" );
		if ( action.equalsIgnoreCase( "login-admin" ) ) {



			System.out.println(request.getParameter("email"));


			Admin admin = dao.loginAdmin(request.getParameter("email"));

			String email = request.getParameter("email") ;
			String password = request.getParameter("password");


			System.out.println(admin.getNm_admin());
			System.out.println(admin.getEmail_admin());


			if (email.equalsIgnoreCase(admin.getEmail_admin())  && password.equalsIgnoreCase(admin.getPass_admin())) {

				System.out.println("Email Sama");
				HttpSession session = request.getSession(true);				
				session.setAttribute("user", admin.getNm_admin());
				session.setAttribute("email", admin.getEmail_admin());
				forward = "halaman-user/admin/dashboard-admin.jsp";

			}else {

				System.out.println("Email tidak sama");

			}

			RequestDispatcher view = request.getRequestDispatcher( forward );
			view.forward(request, response);
		}

		//		} else if  ( action.equalsIgnoreCase( "data-pembeli" )) {
		//
		//
		//			int idUser = Integer.parseInt(request.getParameter("userId"));
		//			System.out.println(idUser);
		//
		//			Gabungan pembeli = new Gabungan ();
		//
		//			pembeli.setNm_pembeli(request.getParameter("nama"));
		//			pembeli.setEmail_pembeli(request.getParameter("email"));
		//			pembeli.setHp_pembeli(request.getParameter("hp"));
		//			pembeli.setIdUser(idUser);
		//
		//			dao.updatePembeli(pembeli);		
		//
		//			response.sendRedirect("UserController?action=data-pembeli&userId="+idUser);
		//
		//
		//		}
		//
		//		else if  ( action.equalsIgnoreCase( "validasi-tiket" )) {
		//
		//
		//			int idUser = Integer.parseInt(request.getParameter("userId"));
		//
		//			Gabungan pembeli = new Gabungan ();
		//
		//			pembeli.setUang_transfer_validasi(Double.parseDouble(request.getParameter("hargaTiketTotal")));
		//			pembeli.setIdUser(idUser);
		//
		//			System.out.println("asas");
		//			System.out.println(pembeli.getUang_transfer_validasi());
		//			dao.updateValidasi(pembeli);		
		//
		//			response.sendRedirect("UserController?action=validasi-tiket&userId="+idUser);
		//
		//
		//		}









		//		request.setAttribute("students", dao.getAllStudents());
		//		view.forward(request, response);






	}
}
