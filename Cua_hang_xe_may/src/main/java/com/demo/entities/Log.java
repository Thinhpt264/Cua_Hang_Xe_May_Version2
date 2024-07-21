package com.demo.entities;

import java.util.Date;

public class Log {
	private int id;
	private String ip;
	private String level;
	private String national;
	private Date time;
	private String title;
	private String beforeValue;
	private String afterValue;
	private int accountId;
	public Log(int id, String ip, String level, String national, Date time, String title, String beforeValue, String afterValue,
			int accountId) {
		super();
		this.id = id;
		this.ip = ip;
		this.level = level;
		this.national = national;
		this.time = time;
		this.title = title;
		this.beforeValue = beforeValue;
		this.afterValue = afterValue;
		this.accountId = accountId;
	}
	public Log() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getNational() {
		return national;
	}
	public void setNational(String national) {
		this.national = national;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getBeforeValue() {
		return beforeValue;
	}
	public void setBeforeValue(String beforeValue) {
		this.beforeValue = beforeValue;
	}
	public String getAfterValue() {
		return afterValue;
	}
	public void setAfterValue(String afterValue) {
		this.afterValue = afterValue;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "Log [id=" + id + ", ip=" + ip + ", level=" + level + ", national=" + national + ", time=" + time
				+ ", beforeValue=" + beforeValue + ", afterValue=" + afterValue + ", accountId=" + accountId + "]";
	}
	public Log(String ip, String level,  String national, Date time,String title, String beforeValue, String afterValue, int accountId) {
		super();
		this.ip = ip;
		this.level = level;
		this.national = national;
		this.time = time;
		this.title = title;
		this.beforeValue = beforeValue;
		this.afterValue = afterValue;
		this.accountId = accountId;
	}
	public Log(String ip, String level, String national, Date time,String title, String beforeValue, String afterValue) {
		super();
		this.ip = ip;
		this.level = level;
		this.national = national;
		this.time = time;
		this.title = title;
		this.beforeValue = beforeValue;
		this.afterValue = afterValue;
	}
	
}