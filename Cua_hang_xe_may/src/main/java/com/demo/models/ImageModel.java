package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.CommentCustom;
import com.demo.entities.ConnectDB;
import com.demo.entities.Image;
import com.demo.entities.Invoice;
import com.demo.entities.Product;

public class ImageModel {
	public static boolean create(Image image) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into images(photo, productId) values(?,?)");
			preparedStatement.setString(1, image.getPhoto());
			preparedStatement.setInt(2, image.getProductId());
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
	public static List<Image> findByProductId(int id) {
		List<Image> images = new ArrayList<Image>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("Select * from images where productId = ?");
			preparedStatement.setInt(1, id);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Image image = new Image();
				image.setId(rs.getInt("id"));
				image.setPhoto(rs.getString("photo"));
				image.setProductId(rs.getInt("productId"));
				images.add(image);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			images = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return images;
	}
	public static void main(String[] args) {
	 System.out.println(findByProductId(70));
	}
}