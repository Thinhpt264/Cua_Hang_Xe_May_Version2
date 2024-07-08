package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.ConnectDB;
import com.demo.entities.OrderCountByMonth;

public class StatisticalModel {
	public List<OrderCountByMonth> findCountInMonthByYear(int year) {
		List<OrderCountByMonth> orderCountByMonths = new ArrayList<OrderCountByMonth>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT DATE_FORMAT(appointmentDate, '%m') AS month, COUNT(*) AS orderCount FROM appointment WHERE YEAR(appointmentDate) = ?"
					+ " GROUP BY month ORDER BY DATE_FORMAT(appointmentDate, '%m') ASC");
			preparedStatement.setInt(1, year);
			 ResultSet resultSet = preparedStatement.executeQuery();
			 while(resultSet.next()) {
				 OrderCountByMonth orderCountByMonth = new OrderCountByMonth();
				 String month = resultSet.getString("month");
				 int orderCount = resultSet.getInt("orderCount");
				 orderCountByMonth.setMonth(month);
				 orderCountByMonth.setOrderCount(orderCount);
				 orderCountByMonths.add(orderCountByMonth);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			orderCountByMonths = null;
		}finally {
			ConnectDB.disconnect();
		}
		return orderCountByMonths;
	}
	public List<String> getYears() {
		List<String> years = new ArrayList<String>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("SELECT DISTINCT YEAR(appointmentDate) AS appointmentYear FROM appointment;");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				String year = resultSet.getString("appointmentYear");
				years.add(year);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			years = null;
		}finally {
			ConnectDB.disconnect();
		}
		return years;
	}
	public static void main(String[] args) {
		StatisticalModel statisticalModel = new StatisticalModel();
		System.out.println(statisticalModel.getYears());
	}
}
