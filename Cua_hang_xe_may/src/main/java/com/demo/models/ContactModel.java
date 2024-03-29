package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.ConnectDB;
import com.demo.entities.Contact;

public class ContactModel {
	public List<Contact> findAll(){
		List<Contact> contacts = new ArrayList<Contact>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from contacts");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Contact contact = new Contact();
				contact.setId(resultSet.getInt("id"));
				contact.setName(resultSet.getString("nameUser"));
				contact.setPhone(resultSet.getString("phoneUser"));
				contact.setEmail(resultSet.getString("emailUser"));
				contact.setContent(resultSet.getString("content"));
				contacts.add(contact);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			contacts = null;
			
		}finally {
			ConnectDB.disconnect();
		}
		return contacts;
		
	}
	public boolean create(Contact contact) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("insert into contacts (nameUser,phoneUser,emailUser,content)"
					+ "value(?,?,?,?)");
			
			preparedStatement.setString(1, contact.getName());
			preparedStatement.setString(2, contact.getPhone());
			preparedStatement.setString(3, contact.getEmail());
			preparedStatement.setString(4, contact.getContent());
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
}
