<%@page import="java.util.Map"%>
<%@page import="ecom.helper.Helper"%>
<%@page import="com.eoss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="ecom.helper.FactoryProvider"%>
<%@page import="com.eoss.dao.CategoryDao"%>
<%@page import="com.eoss.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "you are not logged in !! login First");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("normal")) {
		session.setAttribute("message", "You ARe NOt ADmin! don not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>
<%
		CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
		List <Category> list=cdao.getCategories();
		
		//getting product and user count
		
		Map<String,Long> m=Helper.getValues(FactoryProvider.getFactory());
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/common_css_js.jsp"%>

<link rel="stylesheet" href="css/Admin.css">
<meta charset="ISO-8859-1">
<title>ADMIN PANAL</title>

</head>
<body>

			
<div class="container-login100" style="background-image: url('img/pexels-tyler-lastovich.jpg');">

	<%@ include file="component/navbar_admin.jsp"%>
	<%@ include file="component/message.jsp" %>
	<div class="container admin">
		
		<div class="row mt-4">

			<!-- first col -->
			<div class="col-md-4">
				<div class="card" style="background-image: url('img/presence.png');"data-bs-toggle="tooltip" data-bs-placement="top" title="User In This Website">
					<!-- first box -->
					<div class="card-body text-center" >

						<div class="container">
							<img alt="user-icon" class="img-fluid" style="max-width: 125px;"
								src="img/group.png">
						</div>
							
						<h3><%= m.get("userCount") %></h3>
						<h2 class="text-uppercase text-muted">Users</h2>
					</div>
				</div>
			</div>

			
			<!-- second col -->
			<div class="col-md-4">
				<div class="card" style="background-image: url('img/presence.png');" data-bs-toggle="tooltip" data-bs-placement="top" title="Categories Available" >
					<!-- second box -->
					<div class="card-body text-center">

						<div class="container">
							<img alt="user-icon" class="img-fluid" style="max-width: 125px;"
								src="img/category.png">
						</div>


						<h3><%= list.size() %></h3>
						<h2 class="text-uppercase text-muted">categories</h2>
					</div>
				</div>
			</div>

			<!-- third col -->
			<div class="col-md-4">
				<div class="card" style="background-image: url('img/presence.png');" data-bs-toggle="tooltip" data-bs-placement="top" title="Product Available">
					<!-- third box -->
					<div class="card-body text-center">

						<div class="container">
							<img alt="user-icon" class="img-fluid" style="max-width: 125px;"
								src="img/product.png">
						</div>

						<h3><%= m.get("productCount") %></h3>
						<h2 class="text-uppercase text-muted">products</h2>
					</div>
				</div>
			</div>

		</div>
		
		<!-- second row -->
		<div class="row mt-4">
			<!-- second row first column -->
			<div class="col-md-6">

				<div class="card" data-toggle="modal"
					data-target="#add-category-modal" style="background-image: url('img/presence.png');">
					<div class="card-body text-center">

						<div class="container">
							<img alt="user-icon" class="img-fluid" style="max-width: 125px;"
								src="img/box.png">
						</div>

						
						<small class="mt-2">Click here to add new category</small>
						<h2 class="text-uppercase text-muted">add categories</h2>
					</div>
				</div>

			</div>

			<!-- second row second column -->
			<div class="col-md-6">

				<div class="card"data-toggle="modal"
					data-target="#add-product-modal" style="background-image: url('img/presence.png');">
					<div class="card-body text-center" >

						<div class="container">
							<img alt="user-icon" class="img-fluid" style="max-width: 125px;"
								src="img/add-to-cart.png">
						</div>

						
						<small class="mt-2">Click here to add new product</small>
						<h2 class="text-uppercase text-muted">add products</h2>
					</div>
				</div>

			</div>

		</div>
		
		<!-- View product card -->
	
		<div class="row mt-3">
			<div onclick="window.location='view_products.jsp'"class="col-md-12">
	
					<div class="card" style="background-image: url('img/presence.png');">
						<div class="card-body text-center">
	
							<div class="container">
								<img alt="user-icon" class="img-fluid" style="max-width: 125px;"
									src="img/box_view.png">
							</div>
	
							
							<small class="mt-2">Click here to View products</small>
							<h2 class="text-uppercase text-muted">View Products</h2>
						</div>
					</div>
	
				</div>
		</div>
	
	<!-- End of View product card -->
	
</div>
	
	
	
	
	
	<!-- 	Add category modal -->

	<div class="modal" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">

				<div class="modal-header">
					
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					
				</div>

				<div class="modal-body "style="background-image: url('img/pattern2.png');">
					<form action="ProductOperationServlet" method="post">
					
						<input type="hidden" name="operation" value="addcategory">
						<div class="form-group">
							<input type="text" style="color: black; font-size: 20px;"class="form-control myinput" name="catTitle"
								placeholder="Enter Category Title" required>
						</div>

						<div class="form-group">
							<textarea style="height: 200px;color: black; font-size: 20px;" class="form-control myinput"
								placeholder="Enter Category Description" name="catDescription"
								required></textarea>
						</div>

						<div class="form-group  text-center">
							<button class="btn btn-success btnn">Add Category</button>
							<button type="button" class="btn btn-danger btnn"
								data-dismiss="modal">Close</button>
						</div>

					</form>
				</div>


			</div>
		</div>
	</div>
	<!--End of categroy modal  -->


	<!-- Start product modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" style="background-image: url('img/pattern2.png');">
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct">
						<div class="form-group">
							<input type="text" class="form-control myinput" name="pName"
								placeholder="Enter Product Name" required>
						</div>

						<div class="form-group">
							<textarea style="height: 150px;" class="form-control myinput"
								placeholder="Enter Product Description" name="pDesc"
								required></textarea>
						</div>
						
						<div class="form-group">
							<input type="number" class="form-control myinput" name="pPrice" placeholder="Product Price" required>
						</div>
						
						<div class="form-group">
							<input type="number" class="form-control myinput" name="pDiscount" placeholder="Product discount" required>
						</div>
						
						<div class="form-group">
							<input type="number" class="form-control myinput" name="pQuantity" placeholder="Product Quantity" required>
						</div>
						
						<!-- product category -->
						
						
						<div class="form-group">
							<select name="catId" class="form-control myinput" style="height: 50px;">
								<option style="color:black;" selected disabled class="d-none">Select Category</option>
								<%
									for(Category c:list){
								%>
								<option value="<%=c.getCategoryId()%>"><%= c.getCategouryTitle() %></option>
								<%
									}
								%>
							</select>
						</div>
						
						<div class="form-group">
							<input type="file" class="form-control myinput" name="pPhoto" placeholder="Add Product Image" id="imglable" required>
						</div>

						<div class="cotainer text-center">
							<button class="btn btn-success">Add Product</button>
							<button type="button" class="btn btn-danger"
								data-dismiss="modal">Close</button>
						</div>

					</form>
				</div>


			</div>
		</div>
	</div>
	<!-- End of product modal -->
	
	
</div>
	

<script>
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})
</script>
</body>
</html>




















