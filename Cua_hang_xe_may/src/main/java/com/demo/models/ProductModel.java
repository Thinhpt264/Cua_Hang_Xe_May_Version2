package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Brand;
import com.demo.entities.ConnectDB;
import com.demo.entities.Product;
import com.demo.entities.ProductColor;
import com.demo.entities.ProductVersion;

public class ProductModel {
	public static List<Product> findAll(){
		List<Product> products = new ArrayList<Product>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from products");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Product product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setBrandID(resultSet.getInt("brandId"));
				product.setAvatar(resultSet.getString("avatar"));	
				product.setPrice(resultSet.getDouble("price"));
				product.setMotolineID(resultSet.getInt("motolineId"));
				product.setAfterFork(resultSet.getString("afterFork"));
				product.setBeforeFork(resultSet.getString("beforeFork"));
				product.setCompressionRatio(resultSet.getString("compressionRatio"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setCylinderCapacity(resultSet.getString("cylinderCapacity"));
				product.setEngieType(resultSet.getString("engieType"));
				product.setFuelConsumption(resultSet.getString("fuelConsumption"));
				product.setMaxiumCapacity(resultSet.getString("maxiumCapacity"));
				product.setMaxiumMoment(resultSet.getString("maxiumMoment"));
				product.setOilCapacity(resultSet.getString("oilCapacity"));
				product.setSize(resultSet.getString("size"));
				product.setWeight(resultSet.getString("weight"));
				product.setWheelSize(resultSet.getString("wheelSize"));
				product.setSaddleHeight(resultSet.getString("saddleHeight"));
				product.setPetrolCapacity(resultSet.getString("petrolCapacity"));
				products.add(product);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			products = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return products;
	}
	public static Product findProductById(int id) {
		Product product = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from products where id=? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setBrandID(resultSet.getInt("brandId"));
				product.setAvatar(resultSet.getString("avatar"));
				product.setPrice(resultSet.getDouble("price"));
				product.setMotolineID(resultSet.getInt("motolineId"));
				product.setAfterFork(resultSet.getString("afterFork"));
				product.setBeforeFork(resultSet.getString("beforeFork"));
				product.setCompressionRatio(resultSet.getString("compressionRatio"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setCylinderCapacity(resultSet.getString("cylinderCapacity"));
				product.setEngieType(resultSet.getString("engieType"));
				product.setFuelConsumption(resultSet.getString("fuelConsumption"));
				product.setMaxiumCapacity(resultSet.getString("maxiumCapacity"));
				product.setMaxiumMoment(resultSet.getString("maxiumMoment"));
				product.setOilCapacity(resultSet.getString("oilCapacity"));
				product.setSize(resultSet.getString("size"));
				product.setWeight(resultSet.getString("weight"));
				product.setWheelSize(resultSet.getString("wheelSize"));
				product.setSaddleHeight(resultSet.getString("saddleHeight"));
				product.setPetrolCapacity(resultSet.getString("petrolCapacity"));				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			product = null;

		} finally {
			ConnectDB.disconnect();
		}
		
		return product;
	}
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Delete from products where id=?");
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}finally {
			ConnectDB.disconnect();
		}
		return result;
	
	}
	public static boolean create(Product product) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into products(brandId ,motolineId,avatar,name,description,price,weight,size,petrolCapacity,saddleHeight,wheelSize,beforeFork,afterFork,maxiumCapacity,oilCapacity,fuelConsumption,cylinderCapacity,maxiumMoment,compressionRatio,engieType)"
						+	"values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setInt(1, product.getBrandID());
			preparedStatement.setInt(2, product.getMotolineID());
			preparedStatement.setString(3, product.getAvatar());
			preparedStatement.setString(4, product.getName());
			preparedStatement.setString(5, product.getDescription());
			preparedStatement.setDouble(6, product.getPrice());
			preparedStatement.setString(7, product.getWeight());
			preparedStatement.setString(8, product.getSize());
			preparedStatement.setString(9, product.getPetrolCapacity());
			preparedStatement.setString(10, product.getSaddleHeight());
			preparedStatement.setString(11, product.getWheelSize());
			preparedStatement.setString(12, product.getBeforeFork());
			preparedStatement.setString(13, product.getAfterFork());
			preparedStatement.setString(14, product.getMaxiumCapacity());
			preparedStatement.setString(15, product.getOilCapacity());
			preparedStatement.setString(16, product.getFuelConsumption());
			preparedStatement.setString(17, product.getCylinderCapacity());
			preparedStatement.setString(18, product.getMaxiumMoment());
			preparedStatement.setString(19, product.getCompressionRatio());
			preparedStatement.setString(20, product.getEngieType());
			result = preparedStatement.executeUpdate() > 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}
	public String viewNameBrand(int idBrand) {
		String result = "";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select brands.name from products join brands on brands.id = products.brandId where brandId=?");
			preparedStatement.setInt(1, idBrand);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				result = resultSet.getString("name");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "false";
		}finally {
			ConnectDB.disconnect();
		}
		return result;
	}
	public String viewNameMotoline(int idMotoline) {
		String result = "";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select motolines.name from products join motolines on motolines.id = products.motolineId where motolineId=?");
			preparedStatement.setInt(1, idMotoline);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				result = resultSet.getString("name");
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "false";
		}finally {
			ConnectDB.disconnect();
		}
		return result;
	}
	public List<Product> findbyBrand(int brandId) {
		List<Product> products = new ArrayList<Product>();
		try {
		PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from products where brandId=?");
		preparedStatement.setInt(1, brandId);
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			Product product = new Product();
			product.setId(resultSet.getInt("id"));
			product.setBrandID(resultSet.getInt("brandId"));
			product.setAvatar(resultSet.getString("avatar"));	
			product.setPrice(resultSet.getDouble("price"));
			product.setMotolineID(resultSet.getInt("motolineId"));
			product.setAfterFork(resultSet.getString("afterFork"));
			product.setBeforeFork(resultSet.getString("beforeFork"));
			product.setCompressionRatio(resultSet.getString("compressionRatio"));
			product.setName(resultSet.getString("name"));
			product.setDescription(resultSet.getString("description"));
			product.setCylinderCapacity(resultSet.getString("cylinderCapacity"));
			product.setEngieType(resultSet.getString("engieType"));
			product.setFuelConsumption(resultSet.getString("fuelConsumption"));
			product.setMaxiumCapacity(resultSet.getString("maxiumCapacity"));
			product.setMaxiumMoment(resultSet.getString("maxiumMoment"));
			product.setOilCapacity(resultSet.getString("oilCapacity"));
			product.setSize(resultSet.getString("size"));
			product.setWeight(resultSet.getString("weight"));
			product.setWheelSize(resultSet.getString("wheelSize"));
			product.setSaddleHeight(resultSet.getString("saddleHeight"));
			product.setPetrolCapacity(resultSet.getString("petrolCapacity"));
			products.add(product);
			}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				products = null;
				
			} finally {
				ConnectDB.disconnect();
			}
			return products;
		}
	public List<Product> findbyMotoline(int motolineId) {
		List<Product> products = new ArrayList<Product>();
		try {
		PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from products where motolineId =?");
		preparedStatement.setInt(1, motolineId);
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			Product product = new Product();
			product.setId(resultSet.getInt("id"));
			product.setBrandID(resultSet.getInt("brandId"));
			product.setAvatar(resultSet.getString("avatar"));	
			product.setPrice(resultSet.getDouble("price"));
			product.setMotolineID(resultSet.getInt("motolineId"));
			product.setAfterFork(resultSet.getString("afterFork"));
			product.setBeforeFork(resultSet.getString("beforeFork"));
			product.setCompressionRatio(resultSet.getString("compressionRatio"));
			product.setName(resultSet.getString("name"));
			product.setDescription(resultSet.getString("description"));
			product.setCylinderCapacity(resultSet.getString("cylinderCapacity"));
			product.setEngieType(resultSet.getString("engieType"));
			product.setFuelConsumption(resultSet.getString("fuelConsumption"));
			product.setMaxiumCapacity(resultSet.getString("maxiumCapacity"));
			product.setMaxiumMoment(resultSet.getString("maxiumMoment"));
			product.setOilCapacity(resultSet.getString("oilCapacity"));
			product.setSize(resultSet.getString("size"));
			product.setWeight(resultSet.getString("weight"));
			product.setWheelSize(resultSet.getString("wheelSize"));
			product.setSaddleHeight(resultSet.getString("saddleHeight"));
			product.setPetrolCapacity(resultSet.getString("petrolCapacity"));
			products.add(product);
			}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				products = null;
				
			} finally {
				ConnectDB.disconnect();
			}
			return products;
		}
	public List<ProductVersion> findAllVersionByProduct(int productId) {
		List<ProductVersion> productversions =  new ArrayList<ProductVersion>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productversions where productID=?");
			preparedStatement.setInt(1, productId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				ProductVersion productVersion = new ProductVersion();
				productVersion.setId(resultSet.getInt("id"));
				productVersion.setProductID(resultSet.getInt("productID"));
				productVersion.setPrice(resultSet.getDouble("price"));
				productVersion.setVersionName(resultSet.getString("versionname"));
				productversions.add(productVersion);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productversions = null;
		} finally {
			ConnectDB.disconnect();
		}
		return productversions;
	}
	public List<ProductColor> findAllColorByProductVersion(int VersionId) {
		List<ProductColor> productColors =  new ArrayList<ProductColor>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productcolor where versionID=?");
			preparedStatement.setInt(1, VersionId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				ProductColor productColor = new ProductColor();
				productColor.setId(resultSet.getInt("id"));
				productColor.setVersionID(resultSet.getInt("versionID"));
				productColor.setPhoto(resultSet.getString("photo"));
				productColor.setColor(resultSet.getString("color"));
				productColor.setPrice(resultSet.getDouble("price"));
				productColor.setValue(resultSet.getString("value"));
				productColors.add(productColor);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productColors = null;
		} finally {
			ConnectDB.disconnect();
		}
		return productColors;
	}
	public List<Product> findbyMotolineAndBrand(int motolineId, int brandId) {
		List<Product> products = new ArrayList<Product>();
		try {
		PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from products where  brandId=? and motolineId =?");
		preparedStatement.setInt(1, brandId);
		preparedStatement.setInt(2, motolineId);
		ResultSet resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			Product product = new Product();
			product.setId(resultSet.getInt("id"));
			product.setBrandID(resultSet.getInt("brandId"));
			product.setAvatar(resultSet.getString("avatar"));	
			product.setPrice(resultSet.getDouble("price"));
			product.setMotolineID(resultSet.getInt("motolineId"));
			product.setAfterFork(resultSet.getString("afterFork"));
			product.setBeforeFork(resultSet.getString("beforeFork"));
			product.setCompressionRatio(resultSet.getString("compressionRatio"));
			product.setName(resultSet.getString("name"));
			product.setDescription(resultSet.getString("description"));
			product.setCylinderCapacity(resultSet.getString("cylinderCapacity"));
			product.setEngieType(resultSet.getString("engieType"));
			product.setFuelConsumption(resultSet.getString("fuelConsumption"));
			product.setMaxiumCapacity(resultSet.getString("maxiumCapacity"));
			product.setMaxiumMoment(resultSet.getString("maxiumMoment"));
			product.setOilCapacity(resultSet.getString("oilCapacity"));
			product.setSize(resultSet.getString("size"));
			product.setWeight(resultSet.getString("weight"));
			product.setWheelSize(resultSet.getString("wheelSize"));
			product.setSaddleHeight(resultSet.getString("saddleHeight"));
			product.setPetrolCapacity(resultSet.getString("petrolCapacity"));
			products.add(product);
			}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				products = null;
				
			} finally {
				ConnectDB.disconnect();
			}
			return products;
		}
	
	public boolean update(Product product) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Update products set brandId= ? ,motolineId = ?,avatar= ?,name= ?,description= ?,"
							+"price= ?,weight= ?,size= ?,petrolCapacity= ?,saddleHeight= ?,wheelSize= ?,"
							+"beforeFork= ?,afterFork= ?,maxiumCapacity= ?,oilCapacity= ?,fuelConsumption= ?,"
							+ "cylinderCapacity= ?,maxiumMoment= ?,compressionRatio= ?,engieType=? "
							+ "where id=?");
			preparedStatement.setInt(1, product.getBrandID());
			preparedStatement.setInt(2, product.getMotolineID());
			preparedStatement.setString(3, product.getAvatar());
			preparedStatement.setString(4, product.getName());
			preparedStatement.setString(5, product.getDescription());
			preparedStatement.setDouble(6, product.getPrice());
			preparedStatement.setString(7, product.getWeight());
			preparedStatement.setString(8, product.getSize());
			preparedStatement.setString(9, product.getPetrolCapacity());
			preparedStatement.setString(10, product.getSaddleHeight());
			preparedStatement.setString(11, product.getWheelSize());
			preparedStatement.setString(12, product.getBeforeFork());
			preparedStatement.setString(13, product.getAfterFork());
			preparedStatement.setString(14, product.getMaxiumCapacity());
			preparedStatement.setString(15, product.getOilCapacity());
			preparedStatement.setString(16, product.getFuelConsumption());
			preparedStatement.setString(17, product.getCylinderCapacity());
			preparedStatement.setString(18, product.getMaxiumMoment());
			preparedStatement.setString(19, product.getCompressionRatio());
			preparedStatement.setString(20, product.getEngieType());
			preparedStatement.setInt(21, product.getId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		} finally {
			ConnectDB.disconnect();
		}
		return  result;
		
	}
	
	public static void main(String[] args) {
		ProductModel productModel = new ProductModel();
		Product product = new Product();
		  product.setBrandID(1);
		  product.setAvatar("aaa");
		  product.setMotolineID(1);
		  product.setName("aaa");
		  product.setDescription("aaa");
		  product.setPrice(0);
		  product.setWeight("aaa");
		  product.setSize("aaa");
		  product.setPetrolCapacity("aaa");
		  product.setSaddleHeight("aaa");
		  product.setWheelSize("aaa");
		  product.setBeforeFork("aaa");
		  product.setAfterFork("aaa");
		  product.setMaxiumCapacity("aaa");
		  product.setOilCapacity("aaa");
		  product.setFuelConsumption("aaa");
		  product.setCylinderCapacity("aaa");
		  product.setMaxiumMoment("aaa");
		  product.setCompressionRatio("aaa");
		  product.setEngieType("aaa");
		System.out.println(productModel.findAllVersionByProduct(16));
		 
		 
		 
	}
	public ProductColor findProductColorById(int id) {
		ProductColor productColor = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productcolor where id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				productColor = new ProductColor();
				productColor.setId(resultSet.getInt("id"));
				productColor.setVersionID(resultSet.getInt("versionID"));
				productColor.setPhoto(resultSet.getString("photo"));
				productColor.setColor(resultSet.getString("color"));
				productColor.setPrice(resultSet.getDouble("price"));
				productColor.setValue(resultSet.getString("value"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productColor = null;
		}
		finally {
			ConnectDB.disconnect();
		}
		return productColor;
		
	}
	public ProductVersion findProductVersionById(int id) {
		ProductVersion Productversion = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productversions where id=?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				Productversion = new ProductVersion();
				Productversion.setId(resultSet.getInt("id"));
				Productversion.setPrice(resultSet.getDouble("price"));;
				Productversion.setVersionName(resultSet.getString("versionname"));
				Productversion.setProductID(resultSet.getInt("productID"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			Productversion = null;
		}
		finally {
			ConnectDB.disconnect();
		}
		return Productversion;
		
	}
	public Product findLast() {
		Product product = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from products order by id desc limit 1");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				product = new Product();
				product.setId(resultSet.getInt("id"));
				product.setBrandID(resultSet.getInt("brandId"));
				product.setAvatar(resultSet.getString("avatar"));
				product.setPrice(resultSet.getDouble("price"));
				product.setMotolineID(resultSet.getInt("motolineId"));
				product.setAfterFork(resultSet.getString("afterFork"));
				product.setBeforeFork(resultSet.getString("beforeFork"));
				product.setCompressionRatio(resultSet.getString("compressionRatio"));
				product.setName(resultSet.getString("name"));
				product.setDescription(resultSet.getString("description"));
				product.setCylinderCapacity(resultSet.getString("cylinderCapacity"));
				product.setEngieType(resultSet.getString("engieType"));
				product.setFuelConsumption(resultSet.getString("fuelConsumption"));
				product.setMaxiumCapacity(resultSet.getString("maxiumCapacity"));
				product.setMaxiumMoment(resultSet.getString("maxiumMoment"));
				product.setOilCapacity(resultSet.getString("oilCapacity"));
				product.setSize(resultSet.getString("size"));
				product.setWeight(resultSet.getString("weight"));
				product.setWheelSize(resultSet.getString("wheelSize"));
				product.setSaddleHeight(resultSet.getString("saddleHeight"));
				product.setPetrolCapacity(resultSet.getString("petrolCapacity"));	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			product = null;
		} finally {
			ConnectDB.disconnect();
		}
		return product;
	}
	
	
}
