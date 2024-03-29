package com.demo.entities;

public class Account {
	private int id;
	private String username;
	private String password;
	private String phone;
	private String email;
	private String role;
	private String name;
	private String DOB;
	private String address;
	private String created;
	private String avartar;
	private String securityCode;
	private boolean status;
	
	public Account() {
		super();
	}

	public Account(int id, String username, String password, String phone, String email, String role, String name,
			String dOB, String address, String created, String avartar, String securityCode, boolean status) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.email = email;
		this.role = role;
		this.name = name;
		DOB = dOB;
		this.address = address;
		this.created = created;
		this.avartar = avartar;
		this.securityCode = securityCode;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDOB() {
		return DOB;
	}

	public void setDOB(String dOB) {
		DOB = dOB;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getAvartar() {
		return avartar;
	}

	public void setAvartar(String avartar) {
		this.avartar = avartar;
	}

	public String getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone
				+ ", email=" + email + ", role=" + role + ", name=" + name + ", DOB=" + DOB + ", address=" + address
				+ ", created=" + created + ", avartar=" + avartar + ", securityCode=" + securityCode + ", status="
				+ status + "]";
	}
	
		
}
