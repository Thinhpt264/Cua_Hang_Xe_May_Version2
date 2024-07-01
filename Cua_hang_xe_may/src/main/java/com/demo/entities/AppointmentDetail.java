package com.demo.entities;

public class AppointmentDetail {
	private int id;
	private int id_color;
	private int id_appoiment;
	private int quantity;
	private double total;
	
	public AppointmentDetail(int id, int id_color, int id_appoiment, int quantity, double total) {
		super();
		this.id = id;
		this.id_color = id_color;
		this.id_appoiment = id_appoiment;
		this.quantity = quantity;
		this.total = total;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getId_color() {
		return id_color;
	}
	public void setId_color(int id_color) {
		this.id_color = id_color;
	}
	public int getId_appoiment() {
		return id_appoiment;
	}
	public void setId_appoiment(int id_appoiment) {
		this.id_appoiment = id_appoiment;
	}
	public AppointmentDetail() {
		super();
	}
	public int getQuantity() {
		return quantity;
	}
	@Override
	public String toString() {
		return "AppointmentDetail [id=" + id + ", id_color=" + id_color + ", id_appoiment=" + id_appoiment
				+ ", quantity=" + quantity + ", total=" + total + "]";
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	
}