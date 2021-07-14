package com.eoss.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,HttpServletResponse responce)
			   throws ServletException,IOException{
		responce.setContentType("text/html;charset=utf-8");
		   try(PrintWriter out = responce.getWriter()) {
			   
			  HttpSession httpSession= request.getSession();
			  
			  httpSession.removeAttribute("current-user");
			  responce.sendRedirect("login.jsp");
			   
		   }
		
	}
				   

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
