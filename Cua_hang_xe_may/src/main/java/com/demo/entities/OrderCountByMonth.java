package com.demo.entities;

public class OrderCountByMonth {
	private String month;
	private int orderCount;
	public OrderCountByMonth(String month, int orderCount) {
		super();
		this.month = month;
		this.orderCount = orderCount;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	@Override
	public String toString() {
		return "OrderCountByMonth [month=" + month + ", orderCount=" + orderCount + "]";
	}
	public OrderCountByMonth() {
		super();
	}
	
	
}
