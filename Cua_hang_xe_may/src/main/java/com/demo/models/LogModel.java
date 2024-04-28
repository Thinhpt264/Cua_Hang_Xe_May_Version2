package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.demo.entities.ConnectDB;
import com.demo.entities.Log;

public class LogModel {
	public List<Log> findAll() {
		List<Log> logs = new ArrayList<Log>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from log");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Log log = new Log();
				log.setId(resultSet.getInt("id"));
				log.setIp(resultSet.getString("ip"));
				log.setLevel(resultSet.getString("level"));
				log.setNational(resultSet.getString("national"));
				log.setTime(resultSet.getTimestamp("time"));
				log.setBeforeValue(resultSet.getString("beforeValue"));
				log.setAfterValue(resultSet.getString("afterValue"));
				log.setAccountId(resultSet.getInt("accountId"));;
				logs.add(log);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			logs = null;
			e.printStackTrace();
		}
		
		return logs;
	}
	
	public boolean create(Log log) {
		boolean status = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("INSERT INTO log(ip, level, national, time, beforeValue, afterValue, accountId) VALUES (?,?,?,?,?,?,?)");
			preparedStatement.setString(1, log.getIp());
			preparedStatement.setString(2, log.getLevel());
			preparedStatement.setString(3, log.getNational());
			preparedStatement.setTimestamp(4, new Timestamp(new Date().getTime()));
			preparedStatement.setString(5, log.getBeforeValue());
			preparedStatement.setString(6, log.getAfterValue());
			preparedStatement.setInt(7, log.getAccountId());
			status = preparedStatement.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			status = false;
			e.printStackTrace();
		}
		return status;
	}
	
	public static void main(String[] args) {
		LogModel logModel = new LogModel();
		Log log = new Log();
		log.setIp("123");
		log.setLevel("info");
		log.setNational("VN");
		log.setTime(new Timestamp(new Date().getTime()));
		log.setBeforeValue(null);
		log.setAfterValue(null);
	
		System.out.println(logModel.create(log));
	}
}
