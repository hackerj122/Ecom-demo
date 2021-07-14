
<!DOCTYPE html>
<%@page import="ecom.helper.Helper"%>
<%@page import="com.eoss.entities.Category"%>
<%@page import="com.eoss.dao.CategoryDao"%>
<%@page import="com.eoss.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.eoss.dao.ProductDao"%>
<%@page import="ecom.helper.FactoryProvider"%>
<html lang="en">
<head>
	
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#511281">
<title>Online shopping </title>
<%@include file="component/common_css_js.jsp" %>
</head>
<body>
	
<span style="display:none;" id="svgIncludes"></span>
<%@include file="component/navbar.jsp" %>
	
	
	<div class="row mt-4 mx-4">
	
		<%
			
			
			ProductDao Dao=new ProductDao(FactoryProvider.getFactory());
			List<Product> list=null;
			String cat1 = request.getParameter("category");
			
				if(cat1==null||cat1.equals("all")){
					 list=Dao.gettAllProducts();
				}
				else{
					
					int cid=Integer.parseInt(cat1.trim());
					list=Dao.gettAllProductsById(cid);
				}
				
			
			CategoryDao cat=new CategoryDao(FactoryProvider.getFactory());
			List<Category> clist= cat.getCategories();
		
		%>
		<!-- show category -->
		
		<div class="col-md-2 mt-2">
			
			<div class="list-items">
				<a href="index.jsp?category=all" Style="background:#c15050;border:none;" class="list-group-item list-group-item-action active list-off">
			    Categories
			  	</a>
			  	
			
			<%
				for(Category c:clist)
				{
					%>
					
					<a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action list-in"><%= c.getCategouryTitle() %></a>
					
				<%}
			%>
			</div>
		</div>
			
		<!-- show products -->
		<div class="col-md-10">
			<!-- pro Row -->
			<div class="row mt-2">
				<div class="col-md-12">
					
					<div class="card-columns" > 
						
						<!-- travensing product -->
						<%
							for(Product p:list){
						%>
							<!-- product card  -->
							<div class="card card-product">
								
								<div class="container text-center">
									<img style="max-height:270px;max-width:100%;width:auto;" class="card-img-top m-2" src="img/products/<%= p.getpPhoto() %>" alt="<%= p.getpName()%>">
								</div>
								
								<div class="card-body">
									<h5 class="card-title"><%=p.getpName() %></h5>
									<p class="card-text"><%=Helper.get10Words(p.getpDesc()) %></p>
									
								</div>
								
								<div class="card-footer">
									<a href="product_info.jsp?productId=<%=p.getpId()%>" type="button" class="btn btn-primary"> More Info</a>
									
									<span style="font-size:17px;"class="badge badge-pill badge-light">&#8377;<%=p.getPriceAfterApplyingDiscount() %>/-
										</span>
									<span style="font-size:14px;color:gray;"><strike>&#8377;<%= p.getpPrice()%></strike>
									</span>&nbsp;
									<span style="font-size:12px;"class="badge badge-success"><%=p.getpDiscount()%>&#1642; off</span>
									
									
								</div>
							</div>
							
						<%
							}
						
							if(list.size()==0){
								out.println("<span>This Category Product are not Available<span>");
							}
						%>
						
					</div>
					
				</div>
			</div>
			</div>
			
	</div>
	
<%@include file="component/footer.jsp" %>
<%@include file="component/cart.jsp" %>
</body>
</html>