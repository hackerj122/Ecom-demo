package com.eoss.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.eoss.entities.User;

import ecom.helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse responce)
		throws ServletException,IOException{
		responce.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out=responce.getWriter()){
			try{
				
				
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userPhone = request.getParameter("user_phone");
				String userAddress = request.getParameter("user_address");
				
				//testing user objet
				
				User user= new User(userName, userEmail, userPassword, userPhone,"default.jpg", userAddress,"normal");
				
				Session hiberneteSession = FactoryProvider.getFactory().openSession();
				
				Transaction tx= hiberneteSession.beginTransaction();
					
					int userId=(int)hiberneteSession.save(user);
					
				tx.commit();
				hiberneteSession.close();
				
				HttpSession httpSession= request.getSession();
				
				httpSession.setAttribute("message","Regsitration Successful!! User Id is "+userId);
				
				responce.sendRedirect("login.jsp");
				return;
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
