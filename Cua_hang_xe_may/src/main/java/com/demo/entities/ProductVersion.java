package com.demo.entities;

public class ProductVersion {
	private int id;
	private int productID;
	private String versionName;
	private double price;
	public ProductVersion() {
	
	}
	public ProductVersion(int id, int productID, String versionName, double price) {
		super();
		this.id = id;
		this.productID = productID;
		this.versionName = versionName;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public String getVersionName() {
		return versionName;
	}
	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "ProductVersion [id=" + id + ", productID=" + productID + ", versionName=" + versionName + ", price="
				+ price + "]";
	}
	
	
}
