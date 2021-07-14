<%@page import="com.eoss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="ecom.helper.FactoryProvider"%>
<%@page import="com.eoss.dao.CategoryDao"%>
<%@page import="com.eoss.entities.User"%>
<%
	
	User user1 = (User)session.getAttribute("current-user");
	CategoryDao cat12= new CategoryDao(FactoryProvider.getFactory());
	List<Category> clist1= cat12.getCategories();
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-bg">
  <div class="container">
	  	<a class="navbar-brand" href="index.jsp"><img style="max-height:60px;"alt="" src="img/freeLogo.png" >DealsHut</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          Category
	        </a>
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	        <%
				for(Category c1:clist1)
				{
					%>
	          <a class="dropdown-item" href="index.jsp?category=<%= c1.getCategoryId() %>"><%= c1.getCategouryTitle() %></a>
	          
	          <%} %>
	        </div>
	      </li>
	      
	    </ul >
	    <ul class="navbar-nav md">
		    <li class="nav-item active">
		        <a class="nav-link arrow" data-toggle="modal" data-target="#cart"><i class="fa fa-shopping-cart" Style="font-size:15px;"></i>
		        	<span class="cart-items">(0)</span>
		        </a>
		      </li>
	    
	    	<%
	    		if(user1==null){
	    	%>
	    	
	    	<li class="nav-item active">
	        <a class="nav-link" href="login.jsp">Login </a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="register.jsp">Register</a>
	      </li>
	    	
	    	<%
	    		}
	    	
	    		else{
	    		%>
	    		
	    		
	    	<li class="nav-item active">
	        <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"><%=user1.getUserName() %> </a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="LogoutServlet">Logout</a>
	      </li>
	    		
	    		<%
	    		}
	    	%>
	    
	    
	    </ul>
	    
	  </div>
  </div>
</nav>