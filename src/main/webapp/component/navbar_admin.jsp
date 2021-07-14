<%@page import="com.eoss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="ecom.helper.FactoryProvider"%>
<%@page import="com.eoss.dao.CategoryDao"%>
<%@page import="com.eoss.entities.User"%>
<%
	
	User user1 = (User)session.getAttribute("current-user");
	CategoryDao cat12=new CategoryDao(FactoryProvider.getFactory());
	List<Category> clist1= cat12.getCategories();
%>
<link rel="stylesheet" type="text/css" href="css/Navbar_admin.css">

<nav class="navbar navbar-expand-lg navbar-dark justify-content-between bg vari">
  <div class="container text-center">
	  	<a class="navbar-brand" href="index.jsp"><img style="max-height:60px;"alt="" src="img/freeLogo.png" >DealsHUT</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
	      </li>
	      
	    	<%
	    		if(user1==null){
	    	%>
	    	
	    	<li class="nav-item  active">
	        <a class="nav-link" href="login.jsp">Login </a>
	      </li>
	      <li class="nav-item md-5 active">
	        <a class="nav-link" href="register.jsp">Register</a>
	      </li>
	    	
	    	<%
	    		}
	    	
	    		else{
	    		%>
	    		
	    		
	    	<li class="nav-item active">
	        <a class="nav-link bbtn btn" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=user1.getUserName() %> </a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link bbtn btn btn-outline-danger" href="LogoutServlet">Logout</a>
	      </li>
	    		
	    		<%
	    		}
	    	%>
	    
	    
	    </ul>
	    
	  </div>
  </div>
</nav>