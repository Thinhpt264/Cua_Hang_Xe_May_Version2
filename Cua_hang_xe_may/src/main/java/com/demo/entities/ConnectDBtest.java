package com.demo.entities;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDBtest {
	private static Connection connection;
	
	public static Connection connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connection;
		
	}
}
