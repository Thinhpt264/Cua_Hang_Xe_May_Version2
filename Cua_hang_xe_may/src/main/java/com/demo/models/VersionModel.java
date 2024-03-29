package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.ConnectDB;
import com.demo.entities.Customer;
import com.demo.entities.Product;
import com.demo.entities.ProductVersion;

public class VersionModel {
	public List<ProductVersion> findAll(){
		List<ProductVersion> productVersions = new ArrayList<ProductVersion>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productversions");
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				ProductVersion productVersion = new ProductVersion();
				productVersion.setId(resultSet.getInt("id"));
				productVersion.setProductID(resultSet.getInt("productID"));
				productVersion.setVersionName(resultSet.getString("versionname"));
				productVersion.setPrice(resultSet.getDouble("price"));
				productVersions.add(productVersion);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productVersions = null;
		}
		finally {
			ConnectDB.disconnect();
		}
		return productVersions;
		
	}
	public boolean create(ProductVersion version) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("insert into productversions(productID,versionname,price)" + "value(?,?,?)");
			preparedStatement.setInt(1, version.getProductID());
			preparedStatement.setString(2, version.getVersionName());
			preparedStatement.setDouble(3, version.getPrice());
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
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("delete from productversions where id = ?");
			preparedStatement.setInt(1, id);
			result = preparedStatement.executeUpdate() >0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}finally {
			ConnectDB.disconnect();
		}
		return result;
		
	}
	public ProductVersion findLast() {
		ProductVersion productVersion = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productversions order by id desc limit 1");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				productVersion = new ProductVersion();
				productVersion.setId(resultSet.getInt("id"));
				productVersion.setPrice(resultSet.getDouble("price"));;
				productVersion.setVersionName(resultSet.getString("versionname"));
				productVersion.setProductID(resultSet.getInt("productID"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			productVersion = null;
		} finally {
			ConnectDB.disconnect();
		}
		return productVersion;
	}
	public ProductVersion findVersionById(int id) {
		ProductVersion version = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productversions where id = ? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				version = new ProductVersion();
			 	version.setId(resultSet.getInt("id"));
				version.setProductID(resultSet.getInt("productID"));
				version.setVersionName(resultSet.getString("versionname"));
				version.setPrice(resultSet.getDouble("price"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			version = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return version;
	}
	public boolean update(ProductVersion version) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("update productversions set versionname=?,"
					+ "productID=?, price=? where id=? ");
			preparedStatement.setString(1, version.getVersionName());
			preparedStatement.setInt(2, version.getProductID());
			preparedStatement.setDouble(3, version.getPrice());
			preparedStatement.setInt(4, version.getId());
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
	
	public static void main(String[] args) {
		VersionModel model = new VersionModel();
		ProductVersion version = new ProductVersion();
		version.setProductID(16);
		version.setVersionName("Phiên Bản Cao Cấp");
		version.setPrice(45000000);
		System.out.println(model.create(version));
		
	}
}
