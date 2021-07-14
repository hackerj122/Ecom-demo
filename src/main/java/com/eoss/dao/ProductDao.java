package com.eoss.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.eoss.entities.Product;

public class ProductDao {
	
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	public boolean saveProduct(Product product) {
		boolean f=false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx= session.beginTransaction();
			
			session.save(product);
			f=true;
			tx.commit();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	
	//update product
	
	public boolean updateProduct(Product product) {
		boolean f=false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx= session.beginTransaction();
			
			session.update(product);
			f=true;
			tx.commit();
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
	}
	//delete product
	
		public boolean deleteproduct(Product product) {
			boolean f=false;
			try {
				
				Session session=this.factory.openSession();
				Transaction tx= session.beginTransaction();
				
				session.delete(product);
				f=true;
				tx.commit();
				session.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				f=false;
			}
			return f;
		}
	
	//get all products
	
	public List<Product> gettAllProducts(){
		
		Session s=this.factory.openSession();
		
		Query query =s.createQuery("from Product");
		List<Product>list=query.list();
		return list;
	}
	
	//get all products by id
	
		public List<Product> gettAllProductsById(int cid){
			
			Session s=this.factory.openSession();
			
			Query query =s.createQuery("from Product as p where p.category.categoryId=: id");
			query.setParameter("id", cid);
			
			List<Product>list=query.list();
			return list;
		}
		
		//get one products by id
		
			public List<Product> getoneProductsById(int podId){
				
				Session s=this.factory.openSession();
				
				Query query =s.createQuery("from Product where pId=: id");
				query.setParameter("id", podId);
				
				List<Product>list=query.list();
				return list;
			}
}












