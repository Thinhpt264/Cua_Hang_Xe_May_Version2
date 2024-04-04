package com.demo.entities;

import java.util.Date;

public class Log {
	private int id;
	private String ip;
	private String level;
	private String national;
	private Date time;
	private String beforeValue;
	private String afterValue;
	public Log(int id, String ip, String level, String national, Date time, String beforeValue, String afterValue) {
		super();
		this.id = id;
		this.ip = ip;
		this.level = level;
		this.national = national;
		this.time = time;
		this.beforeValue = beforeValue;
		this.afterValue = afterValue;
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
	public Log() {
		super();
	}
	@Override
	public String toString() {
		return "Log [id=" + id + ", ip=" + ip + ", level=" + level + ", national=" + national + ", time=" + time
				+ ", beforeValue=" + beforeValue + ", afterValue=" + afterValue + "]";
	}
	public Log(String ip, String level, String national, Date time, String beforeValue, String afterValue) {
		super();
		this.ip = ip;
		this.level = level;
		this.national = national;
		this.time = time;
		this.beforeValue = beforeValue;
		this.afterValue = afterValue;
	}
	
}