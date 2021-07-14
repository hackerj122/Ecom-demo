package com.eoss.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import com.eoss.dao.CategoryDao;
import com.eoss.dao.ProductDao;
import com.eoss.entities.Category;
import com.eoss.entities.Product;

import ecom.helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;


@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request,HttpServletResponse responce)
			   throws ServletException,IOException{
		responce.setContentType("text/html;charset=utf-8");
		   try(PrintWriter out = responce.getWriter()) {
			   
			   String opt=request.getParameter("operation");
			   
			   if(opt.trim().equals("addcategory")) {
				   
				   //add category
				   String title=request.getParameter("catTitle");
				   String description=request.getParameter("catDescription");
				   
				   Category category=new Category();
				   category.setCategouryTitle(title);
				   category.setCategouryDescription(description);
				   
				   CategoryDao categoryDao =new CategoryDao(FactoryProvider.getFactory());
				   int catId = categoryDao.saveCategory(category);
				  // out.println("category saved");
				   
				   HttpSession httpSession= request.getSession();
				   
				   httpSession.setAttribute("message","category Added Successfully :"+catId);
				   responce.sendRedirect("admin.jsp");
				   return;
			   }
			   else if(opt.trim().equals("addproduct")) {
				   //add product
				   String pName=request.getParameter("pName");
				   String pDesc=request.getParameter("pDesc");
				   int pPrice= Integer.parseInt(request.getParameter("pPrice")); 
				   int pDiscount= Integer.parseInt(request.getParameter("pDiscount"));
				   int pQuantity= Integer.parseInt(request.getParameter("pQuantity")); 
				   int catId= Integer.parseInt(request.getParameter("catId"));
				   Part part= request.getPart("pPhoto");
				   
				   Product p =new Product();
				   
				   p.setpName(pName);
				   p.setpDesc(pDesc);
				   p.setpPrice(pPrice);
				   p.setpDiscount(pDiscount);
				   p.setpQuantity(pQuantity);
				   p.setpPhoto(part.getSubmittedFileName());
				   //get category by id
				   CategoryDao cdoa=new CategoryDao(FactoryProvider.getFactory());
				   Category category = cdoa.getCategoryById(catId);
				   
				   p.setCategory(category);
				   
				   //product save
				   ProductDao pDao =new ProductDao(FactoryProvider.getFactory());
				   pDao.saveProduct(p);
				   //pic upload
				   
				   String path =request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				   //uplading code
				   FileOutputStream fos=new FileOutputStream(path);
				   InputStream is=part.getInputStream();
				   //reading data
				   byte []data=new byte[is.available()];
				   is.read(data);
				   //writing data
				   fos.write(data);
				   fos.close();
				   
				   
				   //System.out.println(path);
				   //out.println("product success");
				   HttpSession httpSession= request.getSession();
				   
				   httpSession.setAttribute("message","Product Added Successfully :");
				   responce.sendRedirect("admin.jsp");
				   return;
				   
			   }
			   else if(opt.trim().equals("updateproduct")) {
				   
				   int Pid =Integer.parseInt(request.getParameter("pid"));
				   String pName=request.getParameter("pName");
				   String pDesc=request.getParameter("pDesc");
				   int pPrice= Integer.parseInt(request.getParameter("pPrice")); 
				   int pDiscount= Integer.parseInt(request.getParameter("pDiscount"));
				   int pQuantity= Integer.parseInt(request.getParameter("pQuantity")); 
				   int catId= Integer.parseInt(request.getParameter("catId"));
				   Part part= request.getPart("pPhoto");
				   
				   Product p =new Product();
				   p.setpId(Pid);
				   p.setpName(pName);
				   p.setpDesc(pDesc);
				   p.setpPrice(pPrice);
				   p.setpDiscount(pDiscount);
				   p.setpQuantity(pQuantity);
				   p.setpPhoto(part.getSubmittedFileName());
				   //get category by id
				   CategoryDao cdoa=new CategoryDao(FactoryProvider.getFactory());
				   Category category = cdoa.getCategoryById(catId);
				   
				   p.setCategory(category);
				   
				   //product update
				   ProductDao pDao =new ProductDao(FactoryProvider.getFactory());
				   pDao.updateProduct(p);
				   //pic upload
				   
				   String path =request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				   //uplading code
				   FileOutputStream fos=new FileOutputStream(path);
				   InputStream is=part.getInputStream();
				   //reading data
				   byte []data=new byte[is.available()];
				   is.read(data);
				   //writing data
				   fos.write(data);
				   fos.close();
				   
				   
				   //System.out.println(path);
				   //out.println("product successs");
				   HttpSession httpSession= request.getSession();
				   
				   httpSession.setAttribute("message","Product updated Successfully :");
				   responce.sendRedirect("edit_products.jsp?id="+ Pid +"");
				   return;
				   
			   }
			   	
			   else if(opt.trim().equals("deleteproduct")){
				
				   int pid =Integer.parseInt(request.getParameter("id"));
				   Product p =new Product();
				   p.setpId(pid);
				   
				   ProductDao pDao =new ProductDao(FactoryProvider.getFactory());
				   pDao.deleteproduct(p);
				   HttpSession httpSession= request.getSession();
				   httpSession.setAttribute("message","Product updated Successfully :");
				   responce.sendRedirect("view_products.jsp");
				   return;
			   }
			   
			   
			   
			   
			   
			  
			   
		   }
		
	}
	
	
	
	
	
	
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request,response);
	}

}
