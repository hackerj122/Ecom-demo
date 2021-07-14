package com.eoss.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.eoss.dao.UserDao;
import com.eoss.entities.User;

import ecom.helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.http.*;
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   protected void processRequest(HttpServletRequest request,HttpServletResponse responce)
   throws ServletException,IOException{
	   responce.setContentType("text/html;charset=utf-8");
	   try(PrintWriter out = responce.getWriter()) {
		   
		   String email=request.getParameter("email");
		   String password=request.getParameter("password");
		   //validations
		   //auth user
		   
		   UserDao userDao = new UserDao(FactoryProvider.getFactory());
		   
		   User user=userDao.getUserByEmailAndPassword(email, password);
		   //System.out.println(user);
		   HttpSession httpSession= request.getSession();
			
		   if(user==null) {
			   httpSession.setAttribute("message","Invalid Username or Password");
				responce.sendRedirect("login.jsp");
				return;
		   }
		   else {
			   //out.println("<h1>welcome"+user.getUserName()+"</h1>");
			   //login
			   httpSession.setAttribute("current-user", user);
			   
			   //Admin=admin.jsp
			   if(user.getUserType().equals("admin")) {
				 
				   responce.sendRedirect("admin.jsp");
			   }//Normal=normal.jsp
			   else if(user.getUserType().equals("normal")){
				   
				   responce.sendRedirect("index.jsp");
			   }
			   else {
				   out.println("we hanve not identified user type");
			   }
			   
			   
			   
		   }
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
