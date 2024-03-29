/**
 * 
 */
package com.demo.entities;

/**
 * @author 
 *
 */
public class Invoice {
	private int id;
	private int colorId;
	private String tradeDate;
	private double price;
	private int customerId;
	private int employeeId;
	public Invoice(int id, int colorId, String tradeDate, double price, int customerId, int employeeId) {
		super();
		this.id = id;
		this.colorId = colorId;
		this.tradeDate = tradeDate;
		this.price = price;
		this.customerId = customerId;
		this.employeeId = employeeId;
	}
	public Invoice() {
		super();
	}
	@Override
	public String toString() {
		return "Invoice [id=" + id + ", colorId=" + colorId + ", tradeDate=" + tradeDate + ", price=" + price
				+ ", customerId=" + customerId + ", employeeId=" + employeeId + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getColorId() {
		return colorId;
	}
	public void setColorId(int colorId) {
		this.colorId = colorId;
	}
	public String getTradeDate() {
		return tradeDate;
	}
	public void setTradeDate(String tradeDate) {
		this.tradeDate = tradeDate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	
}
