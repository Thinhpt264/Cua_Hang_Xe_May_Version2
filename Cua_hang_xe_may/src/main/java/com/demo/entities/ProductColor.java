package com.demo.entities;

public class ProductColor {
	private int id;
	private int versionID;
	private String color;
	private String photo;
	private double price;
	private String value;
	public ProductColor() {
		
	}
	public ProductColor(int id, int versionID, String color, String photo, double price, String value) {
		super();
		this.id = id;
		this.versionID = versionID;
		this.color = color;
		this.photo = photo;
		this.price = price;
		this.value = value;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getVersionID() {
		return versionID;
	}
	public void setVersionID(int versionID) {
		this.versionID = versionID;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "ProductColor [id=" + id + ", versionID=" + versionID + ", color=" + color + ", photo=" + photo + "]";
	}
	
	
}	
