<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%

	String message = (String)session.getAttribute("message");
	if(message!=null){
		//prints
	//	out.println(message);
%>
	<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%= message %></strong> <br>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<%
		session.removeAttribute("message");
	}

%>