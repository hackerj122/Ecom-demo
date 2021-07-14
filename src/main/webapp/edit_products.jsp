<%@page import="com.eoss.entities.Category"%>
<%@page import="com.eoss.dao.CategoryDao"%>
<%@page import="ecom.helper.FactoryProvider"%>
<%@page import="com.eoss.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.eoss.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
 
 String s1=request.getParameter("id");
 
 //out.println(s1);
 int podId=Integer.parseInt(s1.trim());
 ProductDao Dao=new ProductDao(FactoryProvider.getFactory());
 List<Product> list=Dao.getoneProductsById(podId);
 CategoryDao cat=new CategoryDao(FactoryProvider.getFactory());
	List<Category> clist= cat.getCategories();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
<link rel="stylesheet" type="text/css" href="css/editprod.css">
<%@include file="component/common_css_js.jsp" %>
</head>
<body>
<div class="container-100" style="background-image: url('img/15410.jpg');">
    <%@ include file="component/navbar_admin.jsp"%>
    <div class="container">
  
	<% for(Product p:list){ %>
    <%@ include file="component/message.jsp" %>
    	<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
						<input type="hidden" name="operation" value="updateproduct">
						<input type="hidden" name="pid" value="<%=p.getpId() %>">
						<div class="form-group form-floating">
							<input type="text" id="floatingName" value="<%=p.getpName()%>"class="form-control myinput" name="pName"
								placeholder="Enter Product Name" required>
								 <label for="floatingName">Product Name</label>
						</div>

						<div class="form-group form-floating">
							<textarea style="height: 150px;" id="floatingDesc" class="form-control myinput"
								placeholder="Enter Product Description" name="pDesc"
								required><%=p.getpDesc() %></textarea>
								<label for="floatingDesc">Product Description</label>
						</div>
						
						<div class="form-group form-floating">
							<input type="number" id="floatingPrice" class="form-control myinput" value="<%= p.getpPrice()%>" name="pPrice" placeholder="Product Price" required>
							<label for="floadingPrice">Product Price</label>
						</div>
						
						<div class="form-group form-floating">
							<input type="number" id="floatingDis" class="form-control myinput" value="<%=p.getpDiscount() %>" name="pDiscount" placeholder="Product discount" required>
							<label for="floatingDis">Discount (%)</label>
						</div>
						
						<div class="form-group form-floating">
							<input type="number" id="floatingQue" class="form-control myinput" value="<%= p.getpQuantity()%>"name="pQuantity" placeholder="Product Quantity" required>
							<label for="floatingQue">Product Quantity</label>
						</div>
						
						<!-- product category -->
						
						<div class=" form-group form-floating">
							<select name="catId" class="form-select myinput" id="floatingSelect" aria-label="Floating label select example" required>
								<option selected value="<%=p.getCategory().getCategoryId()%>"><%= p.getCategory().getCategouryTitle() %></option>
							</select> <label for="floatingSelect">Category</label>
						</div>
						
						<div class="form-group from-floating">
						<div class="lb"><label for="floatingIp" class="form-label pl text-secondary">Product Image</label></div>
							<input type="file" id="floatingIp" class="form-control myinput" value="<%=p.getpPhoto() %>" name="pPhoto" placeholder="Add Product Image" required>
							
						</div>

						<div class="container text-center ">
							<button class="btn btn-success">Update Product</button>
							<a type="button" href="view_products.jsp" class="btn btn-danger text-white">Close</a>
						</div>

					</form>
    </div>
    </div>
    <% }%>
</body>
</html>