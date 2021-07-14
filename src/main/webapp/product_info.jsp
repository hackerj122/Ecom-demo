<%@page import="ecom.helper.Helper"%>
<%@page import="com.eoss.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="ecom.helper.FactoryProvider"%>
<%@page import="com.eoss.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
String podID = request.getParameter("productId");
int podId = Integer.parseInt(podID.trim());
ProductDao Dao = new ProductDao(FactoryProvider.getFactory());
List<Product> list = Dao.getoneProductsById(podId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>
<%@include file="component/common_css_js.jsp"%>
<link rel="stylesheet" type="text/css" href="css/proinfo.css">
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container div1 ">

		<%
		for (Product p : list) {
		%>
		<div class="div2 col-3 mt-4">
			<img style="max-height: 400px; max-width: 100%; width: auto;"
				class="card-img-top m-2" src="img/products/<%=p.getpPhoto()%>"
				alt="<%=p.getpName()%>">
		</div>

		<div class="div3 col-6 mt-4 mx-5">
			<h3 class="h3"><%=p.getpName()%></h3>
			<br>
			<p class=""><%=p.getpDesc()%></p>

			<span style="font-size: 17px;" class="badge badge-pill badge-light">&#8377;<%=p.getPriceAfterApplyingDiscount()%>/-
			</span> <span style="font-size: 14px; color: gray;"><strike>&#8377;<%=p.getpPrice()%></strike>
			</span>&nbsp; <span style="font-size: 12px;" class="badge badge-success"><%=p.getpDiscount()%>&#1642;
				off</span>
				
			<button class="btn btn-primary"
				onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">
				Add to Cart</button>
				
			
			<div class="container">
				<div class="col-4-12">Services</div>
				<ul class="col-6-12" style="list-style-type:none;">
					<li>
						<div class=""><img src="https://img.icons8.com/ios/25/000000/guarantee--v3.png"/>6 Months Replacement Warranty</div>
					</li>
					<li>
						<div class=""></div>
						<div class=""><img src="https://img.icons8.com/plasticine/25/000000/replace.png"/>7 Days Replacement Policy
						<span class="question">?</span>

						</div>
										
						
					</li>
					<li>
						<div class=""></div>
						<div class=""><img src="https://img.icons8.com/ultraviolet/25/000000/rupee.png"/> Cash on Delivery available<span class="question">?</span>
						</div>
					</li>
				</ul>
			

			</div>
			
		</div>

		<%
		}
		%>


	</div>

	<%@include file="component/footer.jsp"%>
	<%@include file="component/cart.jsp"%>
</body>
</html>