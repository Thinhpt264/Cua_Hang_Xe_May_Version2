package com.demo.entities;

public class Customer {
	private int id ;
	private String name;
	private String address;
	private String phone;
	private String card ;
	public Customer(int id, String name, String address, String phone, String card) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.card = card;
	}
	public Customer() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	@Override
	public String toString() {
		return "Customer [id=" + id + ", name=" + name + ", address=" + address + ", phone=" + phone + ", card=" + card
				+ "]";
	}
	
}
