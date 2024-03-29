package com.demo.entities;

public class Product {
	private int id; //id san pham
	private int brandID; // thuong hieu cua san pham 
	private int motolineID; // dong xe (tay ga, xe so, phan khoi lon)
	private String avatar; // anh dai dien cua san pham
	private String name; // ten san pham
	private String description; // mo ta san pham
	private double price ; // gia
	private String weight ; // khối lượng bản thân
	private String size ; // dài x rộng x cao
	private String petrolCapacity ; // dung tích bình xăng
	private String saddleHeight ; // độ cao yên
	private String wheelSize ; // kích cỡ lốp trước sau
	private String beforeFork ; // phuộc trước
	private String afterFork ;// phuộc sau
	private String maxiumCapacity ; // công suất tối đa
	private String oilCapacity ; // dung tích nhớt máy
	private String fuelConsumption ; // mức tiêu thụ nhiên liệu
	private String cylinderCapacity ; // dung tích xi-lanh
	private String maxiumMoment ; // moment cực đại
	private String compressionRatio ; // tỉ số nén
	private String engieType; // loại động cơ
	
	public Product() {
		
	}

	public Product(int id, int brandID, int motolineID, String avatar, String name, String description, double price,
			String weight, String size, String petrolCapacity, String saddleHeight, String wheelSize, String beforeFork,
			String afterFork, String maxiumCapacity, String oilCapacity, String fuelConsumption,
			String cylinderCapacity, String maxiumMoment, String compressionRatio, String engieType) {
		super();
		this.id = id;
		this.brandID = brandID;
		this.motolineID = motolineID;
		this.avatar = avatar;
		this.name = name;
		this.description = description;
		this.price = price;
		this.weight = weight;
		this.size = size;
		this.petrolCapacity = petrolCapacity;
		this.saddleHeight = saddleHeight;
		this.wheelSize = wheelSize;
		this.beforeFork = beforeFork;
		this.afterFork = afterFork;
		this.maxiumCapacity = maxiumCapacity;
		this.oilCapacity = oilCapacity;
		this.fuelConsumption = fuelConsumption;
		this.cylinderCapacity = cylinderCapacity;
		this.maxiumMoment = maxiumMoment;
		this.compressionRatio = compressionRatio;
		this.engieType = engieType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBrandID() {
		return brandID;
	}

	public void setBrandID(int brandID) {
		this.brandID = brandID;
	}

	public int getMotolineID() {
		return motolineID;
	}

	public void setMotolineID(int motolineID) {
		this.motolineID = motolineID;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getPetrolCapacity() {
		return petrolCapacity;
	}

	public void setPetrolCapacity(String petrolCapacity) {
		this.petrolCapacity = petrolCapacity;
	}

	public String getSaddleHeight() {
		return saddleHeight;
	}

	public void setSaddleHeight(String saddleHeight) {
		this.saddleHeight = saddleHeight;
	}

	public String getWheelSize() {
		return wheelSize;
	}

	public void setWheelSize(String wheelSize) {
		this.wheelSize = wheelSize;
	}

	public String getBeforeFork() {
		return beforeFork;
	}

	public void setBeforeFork(String beforeFork) {
		this.beforeFork = beforeFork;
	}

	public String getAfterFork() {
		return afterFork;
	}

	public void setAfterFork(String afterFork) {
		this.afterFork = afterFork;
	}

	public String getMaxiumCapacity() {
		return maxiumCapacity;
	}

	public void setMaxiumCapacity(String maxiumCapacity) {
		this.maxiumCapacity = maxiumCapacity;
	}

	public String getOilCapacity() {
		return oilCapacity;
	}

	public void setOilCapacity(String oilCapacity) {
		this.oilCapacity = oilCapacity;
	}

	public String getFuelConsumption() {
		return fuelConsumption;
	}

	public void setFuelConsumption(String fuelConsumption) {
		this.fuelConsumption = fuelConsumption;
	}

	public String getCylinderCapacity() {
		return cylinderCapacity;
	}

	public void setCylinderCapacity(String cylinderCapacity) {
		this.cylinderCapacity = cylinderCapacity;
	}

	public String getMaxiumMoment() {
		return maxiumMoment;
	}

	public void setMaxiumMoment(String maxiumMoment) {
		this.maxiumMoment = maxiumMoment;
	}

	public String getCompressionRatio() {
		return compressionRatio;
	}

	public void setCompressionRatio(String compressionRatio) {
		this.compressionRatio = compressionRatio;
	}

	public String getEngieType() {
		return engieType;
	}

	public void setEngieType(String engieType) {
		this.engieType = engieType;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", brandID=" + brandID + ", motolineID=" + motolineID + ", avatar=" + avatar
				+ ", name=" + name + ", description=" + description + ", price=" + price + ", weight=" + weight
				+ ", size=" + size + ", petrolCapacity=" + petrolCapacity + ", saddleHeight=" + saddleHeight
				+ ", wheelSize=" + wheelSize + ", beforeFork=" + beforeFork + ", afterFork=" + afterFork
				+ ", maxiumCapacity=" + maxiumCapacity + ", oilCapacity=" + oilCapacity + ", fuelConsumption="
				+ fuelConsumption + ", cylinderCapacity=" + cylinderCapacity + ", maxiumMoment=" + maxiumMoment
				+ ", compressionRatio=" + compressionRatio + ", engieType=" + engieType + "]";
	}
	
}
