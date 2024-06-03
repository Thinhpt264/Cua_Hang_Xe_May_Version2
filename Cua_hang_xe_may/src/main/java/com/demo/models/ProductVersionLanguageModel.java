package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Account;
import com.demo.entities.ConnectDB;
import com.demo.entities.ProductVersion;
import com.demo.entities.productVersionLanguage;

public class ProductVersionLanguageModel {
	
	public productVersionLanguage find(int productVersionID, int languageID) {
		productVersionLanguage productVersionID1 = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from productversion_language "
					+ "where productVersionId = ? and languageId = ?");
			preparedStatement.setInt(1, productVersionID);
			preparedStatement.setInt(2, languageID);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				productVersionID1 = new productVersionLanguage();
				productVersionID1.setId(resultSet.getInt("id"));
				productVersionID1.setLanguageId(resultSet.getInt("languageId"));
				productVersionID1.setProductVersionId(resultSet.getInt("productVersionId"));
				productVersionID1.setVersionName(resultSet.getString("versionName"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			productVersionID1 = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return productVersionID1;
	}

	
	


	public static void main(String[] args) {
		ProductVersionLanguageModel accountModel = new ProductVersionLanguageModel();
		System.out.println(accountModel.find(33, 2).getVersionName());
		
	}
}
