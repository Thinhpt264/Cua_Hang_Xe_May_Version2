package com.demo.entities;

public class Image {
	private int id;
	private String photo;
	private int productId;
	public Image(int id, String photo, int productId) {
		super();
		this.id = id;
		this.photo = photo;
		this.productId = productId;
	}
	public Image() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	@Override
	public String toString() {
		return "Image [id=" + id + ", photo=" + photo + ", productId=" + productId + "]";
	}
	 
}