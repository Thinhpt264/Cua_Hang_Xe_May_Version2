package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.demo.entities.Account;
import com.demo.entities.ConnectDB;

public class AccountModel {
	public List<Account> findAll(){
		List<Account> accounts = new ArrayList<Account>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from accounts");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Account account = new Account();
				account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setName(resultSet.getString("name"));
				account.setPassword(resultSet.getString("password"));
				account.setPhone(resultSet.getString("phone"));
				account.setEmail(resultSet.getString("email"));
				account.setAddress(resultSet.getString("address"));
				account.setCreated(resultSet.getString("created"));
				account.setAvartar(resultSet.getString("avatar"));
				account.setDOB(resultSet.getString("DOB"));
				account.setRole(resultSet.getString("role"));
				account.setStatus(resultSet.getBoolean("status"));
				accounts.add(account);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			accounts = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return accounts;
	}
	public Account findAccountByUsername(String username) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from accounts where username = ? ");
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
			 account = new Account();
			 account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setName(resultSet.getString("name"));
				account.setPassword(resultSet.getString("password"));
				account.setPhone(resultSet.getString("phone"));
				account.setAddress(resultSet.getString("address"));
				account.setAvartar(resultSet.getString("avatar"));
				account.setDOB(resultSet.getString("DOB"));
				account.setCreated(resultSet.getString("created"));
				account.setEmail(resultSet.getString("email"));
				account.setRole(resultSet.getString("role"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setSecurityCode(resultSet.getString("securityCode"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			account = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return account;
	}
	public Account findAccountById(int id) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from accounts where id = ? ");
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
			 account = new Account();
			 account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setName(resultSet.getString("name"));
				account.setPassword(resultSet.getString("password"));
				account.setPhone(resultSet.getString("phone"));
				account.setAddress(resultSet.getString("address"));
				account.setAvartar(resultSet.getString("avatar"));
				account.setDOB(resultSet.getString("DOB"));
				account.setCreated(resultSet.getString("created"));
				account.setEmail(resultSet.getString("email"));
				account.setRole(resultSet.getString("role"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setSecurityCode(resultSet.getString("securityCode"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			account = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return account;
	}
	public boolean delete(int id) {
		boolean result = true;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("Delete from accounts where id=?");
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
	
	
	public Account findAccountByEmail(String email) {
		Account account = null;
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from accounts where email = ? ");
			preparedStatement.setString(1, email);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
			 account = new Account();
			 account.setId(resultSet.getInt("id"));
				account.setUsername(resultSet.getString("username"));
				account.setName(resultSet.getString("name"));
				account.setPassword(resultSet.getString("password"));
				account.setPhone(resultSet.getString("phone"));
				account.setAddress(resultSet.getString("address"));
				account.setAvartar(resultSet.getString("avatar"));
				account.setDOB(resultSet.getString("DOB"));
				account.setCreated(resultSet.getString("created"));
				account.setEmail(resultSet.getString("email"));
				account.setRole(resultSet.getString("role"));
				account.setStatus(resultSet.getBoolean("status"));
				account.setSecurityCode(resultSet.getString("securityCode"));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			account = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return account;
	}
	
	public boolean checkLogin(String username, String password) {
		Account account = findAccountByUsername(username);
		if(account != null) {
			if(account.isStatus() == true) {
				return BCrypt.checkpw(password, account.getPassword());
			}
		}
		return false;
	}
	public boolean create(Account account) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into accounts (username, password, phone, email, role, status, securityCode) "
							+ "values(?, ?, ?, ?, ?, ?, ?)");
			preparedStatement.setString(1, account.getUsername());
			preparedStatement.setString(2, account.getPassword());
			preparedStatement.setString(3, account.getPhone());
			preparedStatement.setString(4, account.getEmail());
			preparedStatement.setString(5, account.getRole());
			preparedStatement.setBoolean(6, account.isStatus());
			preparedStatement.setString(7, account.getSecurityCode());
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
	public boolean update(Account account){
		boolean result = true;
	
	try {
		PreparedStatement preparedStatement = ConnectDB.connection()
				.prepareStatement("update accounts set username = ?, password = ?, "
						+ "phone = ?, email = ?, role = ?, status = ?, securityCode = ? ,avatar = ?, address=?, name=?"
						+ " where id = ? ");
		preparedStatement.setString(1, account.getUsername());
		preparedStatement.setString(2, account.getPassword());
		preparedStatement.setString(3, account.getPhone());
		preparedStatement.setString(4, account.getEmail());
		preparedStatement.setString(5, account.getRole());
		preparedStatement.setBoolean(6, account.isStatus());
		preparedStatement.setString(7, account.getSecurityCode());
		preparedStatement.setString(8, account.getAvartar());
		preparedStatement.setString(9, account.getAddress());
		preparedStatement.setString(10, account.getName());
		preparedStatement.setInt(11, account.getId());
			result = preparedStatement.executeUpdate() > 0 ;
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
		AccountModel accountModel = new AccountModel();
		Account account = accountModel.findAccountByUsername("trantrung");
		account.setUsername("thanhvu");

		System.out.println(accountModel.update(account));
		
	}
}
