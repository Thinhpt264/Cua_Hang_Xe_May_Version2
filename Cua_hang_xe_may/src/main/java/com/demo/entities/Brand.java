package com.demo.entities;

public class Brand {
	private int id ;
	private String name ;
	private String photo ;
	private String description ;
	public Brand(int id, String name, String photo, String description) {
		super();
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.description = description;
	}
	public Brand() {
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
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", photo=" + photo + ", description=" + description + "]";
	}
	
}
