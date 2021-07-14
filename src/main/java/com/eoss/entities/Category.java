package com.eoss.entities;

import java.util.ArrayList; 
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int categoryId;
	private String categouryTitle;
	private String categouryDescription;
	@OneToMany(mappedBy="category")
	private List<Product> products=new ArrayList<>();
	
	public Category(int categoryId, String categouryTitle, String categouryDescription) {
		super();
		this.categoryId = categoryId;
		this.categouryTitle = categouryTitle;
		this.categouryDescription = categouryDescription;
	}

	public Category(String categouryTitle, String categouryDescription,List<Product> products) {
		super();
		this.categouryTitle = categouryTitle;
		this.categouryDescription = categouryDescription;
		this.products=products;
	}

	
	
	
	public Category() {
		super();
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategouryTitle() {
		return categouryTitle;
	}

	public void setCategouryTitle(String categouryTitle) {
		this.categouryTitle = categouryTitle;
	}

	public String getCategouryDescription() {
		return categouryDescription;
	}

	public void setCategouryDescription(String categouryDescription) {
		this.categouryDescription = categouryDescription;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}
	

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categouryTitle=" + categouryTitle + ", categouryDescription="
				+ categouryDescription + "]";
	}
	
	
	
	
}
