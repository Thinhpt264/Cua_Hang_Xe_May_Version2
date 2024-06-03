package com.demo.entities;

public class productVersionLanguage {
	private int id;
	private int languageId;
	private int productVersionId;
	private String versionName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLanguageId() {
		return languageId;
	}
	public void setLanguageId(int languageId) {
		this.languageId = languageId;
	}
	public int getProductVersionId() {
		return productVersionId;
	}
	public void setProductVersionId(int productVersionId) {
		this.productVersionId = productVersionId;
	}
	public String getVersionName() {
		return versionName;
	}
	public void setVersionName(String versionName) {
		this.versionName = versionName;
	}
	public productVersionLanguage(int id, int languageId, int productVersionId, String versionName) {
		super();
		this.id = id;
		this.languageId = languageId;
		this.productVersionId = productVersionId;
		this.versionName = versionName;
	}
	public productVersionLanguage() {
		super();
	}
	
}

	
	