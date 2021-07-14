<%@page import="com.eoss.entities.Product"%>
<%@page import="com.eoss.dao.ProductDao"%>
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


ProductDao Dao=new ProductDao(FactoryProvider.getFactory());
List<Product> list=Dao.gettAllProducts();
CategoryDao cat=new CategoryDao(FactoryProvider.getFactory());
	List<Category> clist= cat.getCategories();

	
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="component/common_css_js.jsp"%>

<link rel="stylesheet" href="css/Admin.css">
<style type="text/css">

.AA{
margin-left:0px !important;
margin-right:5px !important;
}
.container-100 {
	
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  background-repeat: no-repeat;
  background-position: 50% 50%;
  background-size: cover;
  background-attachment: fixed;
}
.tb{
	margin: 0 15px 0 15px;
	margin-bottom:10px;	
}

</style>
<meta charset="ISO-8859-1">
<title>Product PANAL</title>
</head>
<body>
<div class="container-100" style="background-image: url('img/background-992850.png');">
<%@ include file="component/navbar_admin.jsp"%>
	<table class='table tb table-bordered table-hover' style="border-collapse: collapse; border-spacing: 0; ">
		<thead class='thead-light'>
			<tr>
			<th scope="col">ID</th>
			<th scope="col">Category</th>
			<th scope="col">Product Name</th>
			<th scope="col">Description</th>
			<th scope="col">Price</th>
			<th scope="col">Discount</th>
			<th scope="col">Quantity Available</th>
			<th >Action</th>
			</tr>
		</thead>
		
		<tbody>
		<%
		
							for(Product p:list){
						%>
			<tr>
			<td><%= p.getpId() %></td>
			<td><%=p.getCategory().getCategouryTitle()%></td>
			<td><%=p.getpName() %></td>
			<td><%=p.getpDesc() %></td>
			<td><%=p.getpPrice() %></td>
			<td><%=p.getpDiscount() %></td> 
			<td><%=p.getpQuantity() %></td>
			<td style="white-space: nowrap;width:10%; paddding:0;">
			<button onclick="window.location='edit_products.jsp?id=<%= p.getpId() %>'" type="button" class="btn btn-secondary btn-sm mx-5 AA">Edit</button>
			<button onclick="window.location='ProductOperationServlet?operation=deleteproduct&id=<%=p.getpId() %>'" type="button" class='btn btn-danger btn-sm mx-5 AA'>Remove</button>
			</td>
			</tr>
			<%
							}
		%>
		</tbody>
	</table>	
</div>



















</body>
</html>