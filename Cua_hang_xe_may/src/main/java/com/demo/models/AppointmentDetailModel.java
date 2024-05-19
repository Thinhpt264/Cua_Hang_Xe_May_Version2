package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Appointment;
import com.demo.entities.AppointmentDetail;
import com.demo.entities.ConnectDB;

public class AppointmentDetailModel {
	public List<AppointmentDetail> findAll() {
		List<AppointmentDetail> result = new ArrayList<AppointmentDetail>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appoitntmentdetail");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AppointmentDetail a = new AppointmentDetail();
				a.setId(resultSet.getInt("id"));
				a.setId_appoiment(resultSet.getInt("id"));
				a.setId_appoiment(resultSet.getInt("appoitntmentId"));
				a.setId_color(resultSet.getInt("productColorId"));
				a.setQuantity(resultSet.getInt("quantity"));
				a.setTotal(resultSet.getDouble("total"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = null;
		}
		return result;
	}
	
	public List<AppointmentDetail> findAppointmentDetailByAppoitntmentId(int id) {
		List<AppointmentDetail> result = new ArrayList<AppointmentDetail>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appoitntmentdetail where appointmentId = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				AppointmentDetail a = new AppointmentDetail();
				a.setId(resultSet.getInt("id"));
				a.setId_appoiment(resultSet.getInt("id"));
				a.setId_appoiment(resultSet.getInt("appointmentId"));
				a.setId_color(resultSet.getInt("productColorId"));
				a.setQuantity(resultSet.getInt("quantity"));
				a.setTotal(resultSet.getDouble("total"));
				result.add(a);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = null;
		}
		return result;
	}
	public boolean create(AppointmentDetail appointment) {
		boolean result =  true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into appoitntmentdetail(appointmentId, productColorId, quantity, total) values(?,?,?,?)");
			preparedStatement.setInt(1, appointment.getId_appoiment());
			preparedStatement.setInt(2, appointment.getId_color());
			preparedStatement.setInt(3, appointment.getQuantity());
			preparedStatement.setDouble(4, appointment.getTotal());
			result = preparedStatement.executeUpdate() > 0;
		}catch (Exception e) {
			// TODO: handle exception
			result = false;
		}
		
		return result;
	}
	public static void main(String[] args) {
		AppointmentDetailModel appointmentDetailModel = new AppointmentDetailModel();
		AppointmentDetail a = new AppointmentDetail();
		System.out.println(appointmentDetailModel.findAppointmentDetailByAppoitntmentId(27));
	}
}