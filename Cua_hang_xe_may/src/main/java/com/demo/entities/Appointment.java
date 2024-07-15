package com.demo.entities;

import java.util.Date;

public class Appointment {
	private int id ;
	private String name  ;
	private String email  ;
	private String phone  ;
	private String appointmentDate;
	private String cccd;
	private int status;
	private int accountId;
	private double deposit_amount;
	private String date_pay;
	private String content;
	public Appointment(int id, String name, String email, String phone, String appointmentDate, String cccd, int status,
			int accountId, double deposit_amount, String date_pay, String content) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.appointmentDate = appointmentDate;
		this.cccd = cccd;
		this.status = status;
		this.accountId = accountId;
		this.deposit_amount = deposit_amount;
		this.date_pay = date_pay;
		this.content = content;
	}
	public Appointment( String name, String email, String phone, String appointmentDate, String cccd, int status,
			int accountId, double deposit_amount, String date_pay, String content) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.appointmentDate = appointmentDate;
		this.cccd = cccd;
		this.status = status;
		this.accountId = accountId;
		this.deposit_amount = deposit_amount;
		this.date_pay = date_pay;
		this.content = content;
	}
	public Appointment()
	{
		
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getCccd() {
		return cccd;
	}
	public void setCccd(String cccd) {
		this.cccd = cccd;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public double getDeposit_amount() {
		return deposit_amount;
	}
	public void setDeposit_amount(double deposit_amount) {
		this.deposit_amount = deposit_amount;
	}
	public String getDate_pay() {
		return date_pay;
	}
	public void setDate_pay(String date_pay) {
		this.date_pay = date_pay;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", appointmentDate=" + appointmentDate + ", cccd=" + cccd + ", status=" + status + ", accountId="
				+ accountId + ", deposit_amount=" + deposit_amount + ", date_pay=" + date_pay + ", content=" + content
				+ "]";
	}
	
	
	
	
	
	
}