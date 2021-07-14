    
 <%
 	 User user=(User)session.getAttribute("current-user");
 	if(user==null){
 		session.setAttribute("message","you are not logged in !! login first to your account to access checkout");
 		response.sendRedirect("login.jsp");
 		return;
 	}
 	
 %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="component/common_css_js.jsp" %>
<meta charset="ISO-8859-1">
<title>Product Checkout</title>
<link rel="stylesheet" type="text/css" href="css/checkout.css">
</head>
<body >
<%@include file="component/navbar.jsp" %>
<div class="container-checkout100" style="background-image: url('img/pexel1.jpg');">
	<div class="row">
		<div class="col-md-6">
			<!-- cart detail -->
			<div class="card mx-5 mb-5 cart-form">
				<div class="card-header">
					<h3 class="text-center"> Your Selected Item </h3>
				</div>
				<div class="card-body">
					<div class="cart-table">
				
					<!-- table comming from js file -->
					</div>
				</div>
				
			</div>
			
		</div>
		
		<div class="col-md-6">
			<!-- checkout details -->
			<div class="card mx-5 mb-5 details-form">
				<div class="card-header">
					<h3 class="text-center"> Your Details For Order </h3>
					</div>
					
					<div class="card-body">
					<form action="demo.jsp" method="post">
					 <div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">Email address</label>
					  <input value="<%= user.getUserEmail()%>"type="email" name="email" class="form-control" id="exampleFormControlInput1" placeholder="Enter Email">
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">Name </label>
					  <input value="<%= user.getUserName()%>"type="text" name="user_name"class="form-control" id="exampleFormControlInput1" placeholder="Name">
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlInput1" class="form-label">Your Contact </label>
					  <input value="<%= user.getUserPhone()%>"type="tel" pattern="[0-9]{10}" name="phone"class="form-control" id="exampleFormControlInput1" placeholder="Enter Contact Number">
					</div>
					<div class="mb-3">
					  <label for="exampleFormControlTextarea1" class="form-label">Enter Address</label>
					  <textarea class="form-control" name="shippingAddress" id="exampleFormControlTextarea1" placeholder="Enter shipping Address" rows="3">
					  <%=user.getUserAddress()%></textarea>
					</div>
					<div class="contaier text-center">
					<button class="btn btn-success" type="submit" >Order Now</button>
					<a type="button" class="btn btn-primary" href="index.jsp">Continue Shopping</a>
					</div>
					</form>
					
					</div>
				
			</div>
		</div>
	</div>

</div>









<%@include file="component/footer.jsp" %>
<%@include file="component/cart.jsp" %>
</body>
</html>