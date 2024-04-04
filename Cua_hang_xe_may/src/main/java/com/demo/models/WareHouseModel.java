package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.ConnectDB;
import com.demo.entities.Invoice;
import com.demo.entities.WarehouseInvoice;

public class WareHouseModel {
	public List<WarehouseInvoice> findAll() {
		List<WarehouseInvoice> invoices = new ArrayList<WarehouseInvoice>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from warehouseinvoice");
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				WarehouseInvoice invoice = new WarehouseInvoice();
				invoice.setId(rs.getInt("id"));
				invoice.setQuantity(rs.getInt("quantity"));
				invoice.setColorId(rs.getInt("ColorId"));
				invoice.setPrice(rs.getDouble("price"));
				invoice.setEmployeeId(rs.getInt("employeeId"));
				invoice.setTradeDate(rs.getString("tradeDate"));
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
	public WarehouseInvoice findInvoiceByID(int ID) {
		WarehouseInvoice invoice = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from warehouseinvoice where id = ?");
			preparedStatement.setInt(1, ID);
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				invoice = new WarehouseInvoice();
				invoice.setId(rs.getInt("id"));
				invoice.setQuantity(rs.getInt("quantity"));
				invoice.setColorId(rs.getInt("ColorId"));
				invoice.setPrice(rs.getDouble("price"));
				invoice.setEmployeeId(rs.getInt("employeeId"));
				invoice.setTradeDate(rs.getString("tradeDate"));
			
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
	public boolean create(WarehouseInvoice invoice) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into warehouseinvoice (quantity, ColorId, price, employeeId, TradeDate) "
							+ "values(?, ?, ?, ?,? )");
			preparedStatement.setInt(1, invoice.getQuantity());
			preparedStatement.setInt(2, invoice.getColorId());
			preparedStatement.setDouble(3, invoice.getPrice());
			preparedStatement.setInt(4, invoice.getEmployeeId());
			preparedStatement.setString(5, invoice.getTradeDate());
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
	public static void main(String[] args) {
		WareHouseModel houseModel  = new WareHouseModel();
		WarehouseInvoice w = new WarehouseInvoice();
		
	}
}

