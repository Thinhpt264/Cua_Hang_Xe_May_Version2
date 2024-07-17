package com.demo.models;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Appointment;
import com.demo.entities.ConnectDB;
import com.demo.entities.ProductColor;

public class AppointmentModel {
	public List<Appointment> findAll() {
		List<Appointment> result = new ArrayList<Appointment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appointment");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Appointment appointment = new Appointment();
				appointment.setId(resultSet.getInt("id"));
				appointment.setName(resultSet.getString("name"));
				appointment.setEmail(resultSet.getString("email"));
				appointment.setPhone(resultSet.getString("phone"));
				appointment.setCccd(resultSet.getString("cccd"));
				appointment.setAppointmentDate(resultSet.getString("appointmentDate"));
				appointment.setStatus(resultSet.getInt("status"));
				appointment.setAccountId(resultSet.getInt("accountId"));
				appointment.setDeposit_amount(resultSet.getDouble("deposit_amount"));
				
				appointment.setDate_pay(resultSet.getString("date_pay"));
				appointment.setContent((resultSet.getString("content")));
				result.add(appointment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = null;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	}
	
	public List<Appointment> findAppointmentByAccountId(int accountId) {
		List<Appointment> result = new ArrayList<Appointment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appointment where accountId = ?");
			preparedStatement.setInt(1, accountId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Appointment appointment = new Appointment();
				appointment.setId(resultSet.getInt("id"));
				appointment.setName(resultSet.getString("name"));
				appointment.setEmail(resultSet.getString("email"));
				appointment.setPhone(resultSet.getString("phone"));
				appointment.setCccd(resultSet.getString("cccd"));
				appointment.setAppointmentDate(resultSet.getString("appointmentDate"));
				appointment.setStatus(resultSet.getInt("status"));
				appointment.setAccountId(resultSet.getInt("accountId"));
				appointment.setDeposit_amount(resultSet.getDouble("deposit_amount"));
				appointment.setDate_pay(resultSet.getString("date_pay"));
				appointment.setContent(resultSet.getString("content"));
				result.add(appointment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = null;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	} 
	public Appointment findAppointmentById(int id) {
		Appointment result = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appointment where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				result = new Appointment();
				result.setId(resultSet.getInt("id"));
				result.setName(resultSet.getString("name"));
				result.setEmail(resultSet.getString("email"));
				result.setPhone(resultSet.getString("phone"));
				result.setCccd(resultSet.getString("cccd"));
				result.setAppointmentDate(resultSet.getString("appointmentDate"));
				result.setStatus(resultSet.getInt("status"));
				result.setAccountId(resultSet.getInt("accountId"));
				result.setDeposit_amount(resultSet.getDouble("deposit_amount"));
				result.setDate_pay(resultSet.getString("date_pay"));
				result.setContent(resultSet.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = null;
		} finally {
			ConnectDB.disconnect();
		}
		return result;
	} 
	public boolean create(Appointment appointment) {
		boolean result =  true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into appointment(name, email, phone, appointmentDate, cccd, status, accountId, deposit_amount,date_pay,content) values(?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, appointment.getName());
			preparedStatement.setString(2, appointment.getEmail());
			preparedStatement.setString(3, appointment.getPhone());
			preparedStatement.setString(4, appointment.getAppointmentDate());
			preparedStatement.setString(5, appointment.getCccd());
			preparedStatement.setInt(6, appointment.getStatus());
			preparedStatement.setInt(7, appointment.getAccountId());
			preparedStatement.setDouble(8, appointment.getDeposit_amount());
			preparedStatement.setString(9, appointment.getDate_pay());
			preparedStatement.setString(10, appointment.getContent());
			result = preparedStatement.executeUpdate() > 0;
		}catch (Exception e) {
			// TODO: handle exception
			result = false;
		} 
		
		return result;
	}
	
	public Appointment findLast() {
		Appointment result = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appointment order by id desc limit 1");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				result = new Appointment();
				result.setId(resultSet.getInt("id"));
				result.setName(resultSet.getString("name"));
				result.setEmail(resultSet.getString("email"));
				result.setPhone(resultSet.getString("phone"));
				result.setCccd(resultSet.getString("cccd"));
				result.setAppointmentDate(resultSet.getString("appointmentDate"));
				result.setStatus(resultSet.getInt("status"));
				result.setAccountId(resultSet.getInt("accountId"));
				result.setDeposit_amount(resultSet.getDouble("deposit_amount"));
				result.setDate_pay(resultSet.getString("date_pay"));
				result.setContent(resultSet.getString("content"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = null;
		}finally {
			ConnectDB.disconnect();
		}
		return result;
		
	}
	public boolean update(Appointment appointment) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("update appointment set name=?,"
					+ "email=?, phone=?,appointmentDate=?,cccd=?,  status=?, accountId=?, deposit_amount=?,date_pay=?,content=? where id=? ");
			preparedStatement.setString(1, appointment.getName());
			preparedStatement.setString(2, appointment.getEmail());
			preparedStatement.setString(3, appointment.getPhone());
			preparedStatement.setString(4, appointment.getAppointmentDate());
			preparedStatement.setString(5, appointment.getCccd());
			preparedStatement.setInt(6, appointment.getStatus());
			preparedStatement.setInt(7, appointment.getAccountId());
			preparedStatement.setDouble(8, appointment.getDeposit_amount());
			preparedStatement.setString(9, appointment.getDate_pay());
			preparedStatement.setString(10, appointment.getContent());
			preparedStatement.setInt(11, appointment.getId());
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
					.prepareStatement("Delete from appointment where id=?");
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
	
	public static void main(String[] args) {
		AppointmentModel appointmentModel = new AppointmentModel();
Appointment a = new Appointment();
		a.setName("aaa");
		a.setEmail("aaa");
		a.setPhone("123");
		a.setStatus(0);
		a.setAppointmentDate("12/3/2003");
		a.setCccd("2222");
		a.setAccountId(5);
		a.setDeposit_amount(1000000);
		System.out.println(	appointmentModel.create(a));
	
		
	}
}