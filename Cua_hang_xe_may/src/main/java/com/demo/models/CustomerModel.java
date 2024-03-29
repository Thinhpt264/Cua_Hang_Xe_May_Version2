package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.ConnectDB;
import com.demo.entities.Customer;
import com.demo.entities.Employee;

public class CustomerModel {
	public List<Customer> findAll(){
		List<Customer> customers = new ArrayList<Customer>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from customers");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Customer customer = new Customer();
				customer.setId(resultSet.getInt("id"));
				customer.setName(resultSet.getString("name"));
				customer.setPhone(resultSet.getString("phone"));
				customer.setAddress(resultSet.getString("address"));
				customer.setCard(resultSet.getString("card"));
				customers.add(customer);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			customers = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return customers;
	}
	public Customer findCustomerById(int id) {
		Customer customer = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from customers where id = ? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				customer = new Customer();
			 customer.setId(resultSet.getInt("id"));
				customer.setName(resultSet.getString("name"));
				customer.setPhone(resultSet.getString("phone"));
				customer.setAddress(resultSet.getString("address"));
				customer.setCard(resultSet.getString("card"));

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			customer = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return customer;
	}
	
	public boolean create(Customer customer) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into customers (name, phone, address, card) "
							+ "values(?, ?, ?, ?)");
			preparedStatement.setString(1, customer.getName());
			preparedStatement.setString(2, customer.getPhone());
			preparedStatement.setString(3, customer.getAddress());
			preparedStatement.setString(4, customer.getCard());
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
	public boolean delete(int id) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("delete from customers where id = ? ");
			preparedStatement.setInt(1, id);
			
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
	public boolean update(Customer customer) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("update customers set name=?,"
					+ "phone=?, address=? , card=? where id=? ");
			preparedStatement.setString(1, customer.getName());
			preparedStatement.setString(2, customer.getPhone());
			preparedStatement.setString(3, customer.getAddress());
			preparedStatement.setString(4, customer.getCard());
			preparedStatement.setInt(5, customer.getId());
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
