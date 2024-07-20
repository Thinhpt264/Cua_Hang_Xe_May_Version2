package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Appointment;
import com.demo.entities.AppointmentDetail;
import com.demo.entities.ConnectDB;
import com.demo.entities.Item;
import com.demo.entities.ProductApointment;
import com.demo.entities.ProductColor;

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
		}finally {
			ConnectDB.disconnect();
		}
		return result;
	}
	
	public AppointmentDetail findAppointmentDetailById(int id) {
		AppointmentDetail result = new AppointmentDetail();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from appoitntmentdetail where id = ?");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				result.setId(resultSet.getInt("id"));
				result.setId_appoiment(resultSet.getInt("id"));
				result.setId_appoiment(resultSet.getInt("appointmentId"));
				result.setId_color(resultSet.getInt("productColorId"));
				result.setQuantity(resultSet.getInt("quantity"));
				result.setTotal(resultSet.getDouble("total"));
		
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
		}finally {
			ConnectDB.disconnect();
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
		}finally {
			ConnectDB.disconnect();
		}
		
		return result;
	}
	public List<ProductApointment> findAllProductColor() {
		List<ProductApointment> items = new ArrayList<ProductApointment>();
		ColorModel colorModel = new ColorModel();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT  * FROM appoitntmentdetail");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				ProductApointment i = new ProductApointment();
				i.setId(resultSet.getInt("id"));
				i.setAppointmentId(resultSet.getInt("appointmentId"));
				i.setProductColor(colorModel.findColorById(resultSet.getInt("productColorId")));
				i.setQuantity(resultSet.getInt("quantity"));
				items.add(i);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			items = null;
		}finally {
			ConnectDB.disconnect();
		}
		
		return items;
	}
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("delete from appoitntmentdetail where id = ?");
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
	public static void main(String[] args) {
		AppointmentDetailModel appointmentDetailModel = new AppointmentDetailModel();
		AppointmentDetail a = new AppointmentDetail();
		System.out.println(appointmentDetailModel.findAppointmentDetailById(12).toString());
	}
	public boolean update(AppointmentDetail appointmentDetail) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("update appoitntmentdetail set appointmentId=?,"
					+ "productColorId=?, quantity=?,total=? where id=? ");
			preparedStatement.setInt(1, appointmentDetail.getId_appoiment());
			preparedStatement.setInt(2, appointmentDetail.getId_color());
			preparedStatement.setInt(3, appointmentDetail.getQuantity());
			preparedStatement.setDouble(4, appointmentDetail.getTotal());
			preparedStatement.setInt(5, appointmentDetail.getId());
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