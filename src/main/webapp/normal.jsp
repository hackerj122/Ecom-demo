<%@page import="com.eoss.entities.User"%>
<%
	
	User user=(User)session.getAttribute("current-user");

	if(user==null)
	{
		session.setAttribute("message","you are not logged in !! login First");
		response.sendRedirect("login.jsp");
		return;
	}
	else{
		
		if(user.getUserType().equals("admin")){
			session.setAttribute("message","You ARe ADmin! don not access customer page");
			response.sendRedirect("login.jsp");
			return;
		}
	}
	

%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>this is normal user panal</h1>
</body>
</html>