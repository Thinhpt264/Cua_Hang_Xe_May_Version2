package com.demo.entities;

public class ProductApointment {
	private int id;
	private ProductColor productColor;
	private int quantity;
	private int appointmentId;
	public ProductApointment(int id, ProductColor productColor, int quantity, int appointmentId) {
		super();
		this.id = id;
		this.productColor = productColor;
		this.quantity = quantity;
		this.appointmentId = appointmentId;
	}
	public ProductApointment() {
		super();
	}
	public int getId() {
		return id;
	}
	@Override
	public String toString() {
		return "ProductApointment [id=" + id + ", productColor=" + productColor + ", quantity=" + quantity
				+ ", appointmentId=" + appointmentId + "]";
	}
	public void setId(int id) {
		this.id = id;
	}

	public ProductColor getProductColor() {
		return productColor;
	}
	public void setProductColor(ProductColor productColor) {
		this.productColor = productColor;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
}
