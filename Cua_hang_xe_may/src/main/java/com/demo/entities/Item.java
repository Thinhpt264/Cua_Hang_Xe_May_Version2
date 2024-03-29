package com.demo.entities;

import com.demo.models.ProductModel;

public class Item {
	private ProductColor productcolor;
	private int quantity;
	public ProductColor getProductcolor() {
		return productcolor;
	}
	public void setProductcolor(ProductColor productcolor) {
		this.productcolor = productcolor;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Item(ProductColor productcolor, int quantity) {
		super();
		this.productcolor = productcolor;
		this.quantity = quantity;
	}
	public Item() {
		super();
	}
	public String viewNameProduct(int id) {
		ProductModel productModel = new ProductModel();
		Product product = productModel.findProductById(id);
		String name = product.getName();
		System.out.println("test2");
		return name;
	}
	public String viewNameProductVersion(int id) {
		ProductModel productModel = new ProductModel();
		ProductVersion product = productModel.findProductVersionById(id);
		String name = product.getVersionName();
		System.out.println("test2");
		return name;
	}
	public ProductVersion ProductVersion(int id) {
		ProductModel productModel = new ProductModel();
		ProductVersion product = productModel.findProductVersionById(id);
		return product;
	} 
	
}
