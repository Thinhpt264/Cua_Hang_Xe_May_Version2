package com.demo.entities;

public class Language {
	private int id;
	private String countryID;
	private String languageID;
	private String countryName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountryID() {
		return countryID;
	}
	public void setCountryID(String countryID) {
		this.countryID = countryID;
	}
	public String getLanguageID() {
		return languageID;
	}
	public void setLanguageID(String languageID) {
		this.languageID = languageID;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public Language(int id, String countryID, String languageID, String countryName) {
		super();
		this.id = id;
		this.countryID = countryID;
		this.languageID = languageID;
		this.countryName = countryName;
	}
	public Language() {
		super();
	}
	
}
