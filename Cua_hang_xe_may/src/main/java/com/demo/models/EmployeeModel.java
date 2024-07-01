package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.CommentCustom;
import com.demo.entities.ConnectDB;
import com.demo.entities.Employee;

public class EmployeeModel {
	public List<Employee> findAll() {
		List<Employee> employees = new ArrayList<>();
		try {
				PreparedStatement preparedStatement = ConnectDB.connection()
						.prepareStatement("select * from employees");
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()) {
					Employee employee = new Employee();
					employee.setId(resultSet.getInt("id"));
					employee.setAccountID(resultSet.getInt("accountID"));
					employee.setCardID(resultSet.getString("card"));
					employee.setSalary(resultSet.getDouble("salary"));
					employees.add(employee);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				employees = null;
			} finally {
				ConnectDB.disconnect();
			}
		return employees;
	}
	public Employee findEmployeeByAccountId(int accountID)  {
		Employee employee = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from employees where accountID= ?");
					preparedStatement.setInt(1, accountID);
					ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				employee = new Employee();
				employee.setId(resultSet.getInt("id"));
				employee.setAccountID(resultSet.getInt("accountID"));
				employee.setCardID(resultSet.getString("card"));
				employee.setSalary(resultSet.getDouble("salary"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			employee = null;
		}finally {
			ConnectDB.disconnect();
		}
		return employee	;
	}
	public Employee findEmployeebyId(int id) {
		Employee employee = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from employees where id= ?");
					preparedStatement.setInt(1, id);
					ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				employee = new Employee();
				employee.setId(resultSet.getInt("id"));
				employee.setAccountID(resultSet.getInt("accountID"));
				employee.setCardID(resultSet.getString("card"));
				employee.setSalary(resultSet.getDouble("salary"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			employee = null;
		}finally {
			ConnectDB.disconnect();
		}
		return employee	;
	}
	public boolean update(Employee employee) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("update employees set accountID=?,"
					+ "card=?, salary=? where id=? ");
			preparedStatement.setInt(1, employee.getAccountID());
			preparedStatement.setString(2, employee.getCardID());
			preparedStatement.setDouble(3, employee.getSalary());
			preparedStatement.setInt(4, employee.getId());
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
					.prepareStatement("Delete from employees where id=?");
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
	
	public boolean create(Employee employee) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("insert into employees(salary, card, accountID)"
					+ "value(?, ?, ?)");
			preparedStatement.setInt(3, employee.getAccountID());
			preparedStatement.setString(2, employee.getCardID());
			preparedStatement.setDouble(1, employee.getSalary());
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
		EmployeeModel employeeModel = new EmployeeModel();
		Employee employee = new Employee();
		employee.setAccountID(6);
		employee.setCardID("215597097");
		employee.setSalary(400000.0);
		System.out.println(employeeModel.create(employee));
	}
}
