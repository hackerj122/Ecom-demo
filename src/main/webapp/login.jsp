
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>User Login</title>
		<%@include file="component/common_css_js.jsp" %>
		<link rel="stylesheet" type="text/css" href="css/login.css">
	</head>
	<body>
	<%@include file="component/navbar.jsp" %>
<!--  <div class="container-login100" style="background-image: url('img/bg-01.jpg');">
		
		<div class="container">
		<img class="login_logo" alt="" src="img/freeLogo.png">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card mt-3">
					
						<div class="card-header text-center text-white"style="background:#03a9f4;">
							<h4>Login Here</h4>
						</div>
						<@ include file="component/message.jsp" %>
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> 
									<input name="email"type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label>
									<input name="password" type="password" class="form-control" id="exampleInputPassword1"
										placeholder="Password">
								</div>
								
								<div class="container text-center">
								<button type="submit" class="btn btn-outline-success ">Submit</button>
								<button type="reset" class="btn btn-outline-warning ">Reset</button>
								</div>
							</form>
							<a href="register.jsp" class="text-info text-center d-block mt-2">Not Have an Account</a>
						</div> 
					
					</div>
					
				</div>
			</div>
		</div>
		
</div>		

																<!-- new data -->

	

<div class="container-login100" style="background-image: url('img/bg-01.jpg');">
	
	<div class="container cont">
	<div class="conatiner con text-center">
		<img class="reg_logo" alt="" src="img/freeLogo.png">
	</div>
		<div class="mycard">
			<div class="row">
				<div class="col-md-12">
					<div class="myLeftCtn">
						<form action="LoginServlet" method="post" class="myform text-center" >
							<header >LOGIN</header>
							<br>
							<div class="form-group">
								<i class="fas fa-envelope"></i>
								<input class="myinput" type="email" placeholder="Email" name="email" id="email" required>
							</div>
							<div class="form-group">
								<i class="fas fa-lock"></i>
								<input class="myinput" type="Password" placeholder="Password" name="password" id="Pass" required> 
							</div>
							<br>
							<input type="submit" class="bttn" value="Login"><br><br>
							<a class="btn btn-outline-dark border-0" href="register.jsp" role="button">Not Have An Account</a>
						</form>
						
	<%@ include file="component/message.jsp" %>
					</div>
				</div>
			</div>
		</div> 
	</div>
</div>

	</body>
</html>