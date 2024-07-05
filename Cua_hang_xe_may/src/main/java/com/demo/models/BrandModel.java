package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Brand;
import com.demo.entities.ConnectDB;
import com.demo.entities.Employee;

public class BrandModel {
	public List<Brand> findAll(){
		List<Brand> brands = new ArrayList<Brand>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from brands");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Brand brand = new Brand();
				brand.setId(resultSet.getInt("id"));
				brand.setName(resultSet.getString("name"));
				brand.setPhoto(resultSet.getString("photo"));
				brand.setDescription(resultSet.getString("description"));
				brands.add(brand);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			brands = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return brands;
	}
	
	public boolean create(Brand brand) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into brands(name,photo,description)" + "value(?,?,?)");
					preparedStatement.setString(1, brand.getName());
					preparedStatement.setString(2, brand.getPhoto());
					preparedStatement.setString(3, brand.getDescription());
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
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Delete from brands where id=?");
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
	public Brand findBrandbyId(int id) {
		Brand brand = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from brands where id= ?");
					preparedStatement.setInt(1, id);
					ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				brand = new Brand();
				brand.setId(resultSet.getInt("id"));
				brand.setName(resultSet.getString("name"));
				brand.setPhoto(resultSet.getString("photo"));
				brand.setDescription(resultSet.getString("description"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			brand = null;
		}finally {
			ConnectDB.disconnect();
		}
		return brand	;
	}
	public boolean update(Brand brand) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("update brands set name=?,"
					+ "photo=?, description=? where id=? ");
			preparedStatement.setString(1, brand.getName());
			preparedStatement.setString(2, brand.getPhoto());
			preparedStatement.setString(3, brand.getDescription());
			preparedStatement.setInt(4, brand.getId());
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
		BrandModel brandModel = new BrandModel();
		Brand brand = new Brand();
		brand.setName("Vinfast");
		brand.setDescription("Vinfast");
		brand.setPhoto("Vinfast");
		System.out.println(brandModel.create(brand));
	}
}
