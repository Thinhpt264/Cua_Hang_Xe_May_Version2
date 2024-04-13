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
	public Appointment(int id, String name, String email, String phone, String appointmentDate, String cccd, int status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.appointmentDate = appointmentDate;
		this.cccd = cccd;
		this.status = status;
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
	public Appointment() {
		super();
	}
	@Override
	public String toString() {
		return "Appointment [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", appointmentDate=" + appointmentDate + ", cccd=" + cccd + ", status=" + status + "]";
	}
	
	
}