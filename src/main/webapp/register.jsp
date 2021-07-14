<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="component/common_css_js.jsp"%>
<title>Register</title>
<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<%@include file="component/navbar.jsp"%>
<!--  
	<div class="container-fluid">

		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<div class="card ">
				
				<@include file="component/message.jsp" %>
					<div class="card-body px-5">
					
						<h3 class="text-center my-3">Sign up here</h3>
						<form action="RegisterServlet" method="post">

							<div class="form-group">
								<label for="name">User Name</label>
								 <input name="user_name" type="text" class="form-control" id="name" placeholder="Enter Here">
							</div>
							<div class="form-group">
								<label for="email">User Email</label> 
								<input name="user_email" type="email" class="form-control" id="email" placeholder="Enter Here">
							</div>
							<div class="form-group">
								<label for="password">User Password</label>
								<input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here">
							</div>
							<div class="form-group">
								<label for="phone">User Phone</label> 
								<input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter Here">
							</div>
							<div class="form-group">
								<label for="email">User Address</label>
								<textarea name="user_address" rows="" cols="" class="form-control"
									placeholder="Enter Address">
					</textarea>

							</div>
							<div class="container text-center">
								<input type="submit" class="btn btn-outline-success"
									value="Create Account">
								<button class="btn btn-outline-warning">Reset</button>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>

	</div>-->
	<!-- new register panal -->
<div class="container-login100" style="background-image: url('img/bg-01.jpg');">

	<div class="container cont">
	
			<%@ include file="component/message.jsp" %>
		<div class="mycard">
			<div class="row">
				<div class="col-md-6">
					<div class="myLeftCtn">
						<form action="RegisterServlet" method="post" class="myform text-center"  >
						
							<header >Create new account</header>
							<br>
							<div class="form-group">
								<i class="fas fa-user"></i>
								<input class="myinput" type="text" placeholder="Full Name" name="user_name" id="username" required  oninvalid="this.setCustomValidity('Enter User Name Here')">
							</div>
							<div class="form-group">
								<i class="fas fa-envelope"></i>
								<input class="myinput" type="email" placeholder="Email" name="user_email" id="email" required>
							</div>
							<div class="form-group">
								<i class="fas fa-lock"></i>
								<input class="myinput" type="Password" placeholder="Password" name="user_password" id="Pass" required> 
							</div>
							<div class="form-group">
								<i class="fas fa-phone-alt"></i>
								<input class="myinput" type="tel" pattern="[0-9]{10}" placeholder="Phone" name="user_phone" id="Pass" required> 
							</div>
							<div class="form-group">
								<i class="fas fa-map-marker-alt align-top mt-3"></i>
								<textarea name="user_address" rows="1" cols="1" class="myinput" placeholder="Enter Address" required></textarea>
							</div>
							<div class="form-group">
								<label>
									<input id="check_1" name="check_1" type="checkbox" required>
									<small>I read and agree to 
									Terms & Conditions</small>
									<div class="invalid-feedback">You must check the box</div>
								</label>
							</div>
							
							<input type="submit" class="bttn" value="Create Account">
							<a class="btn btn-link" href="login.jsp" role="button">Already have an account</a>
						</form>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="myRightCtn">
						<div class="box text-center">
					 	<img class="reg_logo" alt="" src="img/freeLogo.png">
							<header>Hello Welcome to DealsHut</header>
							<p>In our website the provide many types of products with low cost.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>