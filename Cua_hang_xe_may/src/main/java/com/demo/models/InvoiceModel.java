package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.ConnectDB;
import com.demo.entities.Invoice;

public class InvoiceModel {
	public List<Invoice> findAll() {
		List<Invoice> invoices = new ArrayList<Invoice>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from invoicedetails");
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				Invoice invoice = new Invoice();
				invoice.setId(rs.getInt("id"));
				invoice.setColorId(rs.getInt("colorId"));
				invoice.setTradeDate(rs.getString("tradeDate"));
				invoice.setCustomerId(rs.getInt("customerId"));
				invoice.setEmployeeId(rs.getInt("employeeId"));
				invoice.setPrice(rs.getDouble("price"));
				invoices.add(invoice);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			invoices = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return invoices;
	}
	public Invoice findInvoiceByID(int ID) {
		Invoice invoice = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from invoicedetails where id = ?");
			preparedStatement.setInt(1, ID);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				invoice = new Invoice();
				invoice.setId(rs.getInt("id"));
				invoice.setColorId(rs.getInt("colorId"));
				invoice.setTradeDate(rs.getString("tradeDate"));
				invoice.setCustomerId(rs.getInt("customerId"));
				invoice.setEmployeeId(rs.getInt("employeeId"));
				invoice.setPrice(rs.getDouble("price"));
			
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			invoice = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return invoice;
	}
	public static void main(String[] args) {
		System.out.println(new InvoiceModel().findInvoiceByID(6));
	}
	public boolean create(Invoice invoice) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into invoicedetails (colorId, tradeDate, customerId, employeeId, price) "
							+ "values(?, ?, ?, ?,? )");
			preparedStatement.setInt(1, invoice.getColorId());
			preparedStatement.setString(2, invoice.getTradeDate());
			preparedStatement.setInt(3, invoice.getCustomerId());
			preparedStatement.setInt(4, invoice.getEmployeeId());
			preparedStatement.setDouble(5, invoice.getPrice());
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
	public boolean update(Invoice invoice) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Update invoicedetails set colorId = ?, tradeDate=?,"
							+ " customerId=?, employeeId=?, price=?  where id =?");
			preparedStatement.setInt(1, invoice.getColorId());
			preparedStatement.setString(2, invoice.getTradeDate());
			preparedStatement.setInt(3, invoice.getCustomerId());
			preparedStatement.setInt(4, invoice.getEmployeeId());
			preparedStatement.setDouble(5, invoice.getPrice());
			preparedStatement.setInt(6, invoice.getId());
			result = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}
		return result;
	}
	
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Delete from invoicedetails where id=?");
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
	
	

}
