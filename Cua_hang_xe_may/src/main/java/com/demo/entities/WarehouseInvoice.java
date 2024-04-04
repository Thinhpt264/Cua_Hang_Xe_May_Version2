package com.demo.entities;

public class WarehouseInvoice {
	private int id;
	private int ColorId;
	private int quantity;
	private double price;
	private int employeeId;
	private String TradeDate;
	
	public WarehouseInvoice(int id, int colorId, int quantity, double price, int employeeId, String tradeDate) {
		super();
		this.id = id;
		ColorId = colorId;
		this.quantity = quantity;
		this.price = price;
		this.employeeId = employeeId;
		TradeDate = tradeDate;
	}
	public int getId() {
		return id;
	}
	public int getColorId() {
		return ColorId;
	}
	public void setColorId(int colorId) {
		ColorId = colorId;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public WarehouseInvoice() {
		super();
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getTradeDate() {
		return TradeDate;
	}
	public void setTradeDate(String tradeDate) {
		TradeDate = tradeDate;
	}
	@Override
	public String toString() {
		return "WarehouseInvoice [id=" + id + ", quantity=" + quantity + ", price=" + price + ", employeeId="
				+ employeeId + ", TradeDate=" + TradeDate + "]";
	}
	
}
