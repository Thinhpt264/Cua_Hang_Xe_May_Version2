package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.demo.entities.Account;
import com.demo.entities.Comment;
import com.demo.entities.CommentCustom;
import com.demo.entities.ConnectDB;

public class CommentModel {
	public List<Comment> findCommentByProduct(int idProduct) {
		List<Comment> comments = new ArrayList<Comment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from comments where productId=? order by id desc");
			preparedStatement.setInt(1, idProduct);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				Comment comment = new Comment();
				comment.setId(resultSet.getInt("id"));
				comment.setAccountId(resultSet.getInt("accountId"));
				comment.setProductId(resultSet.getInt("productId"));
				comment.setContent(resultSet.getString("content"));
				comment.setCreated(resultSet.getString("created"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			comments = null;
		}finally {
			ConnectDB.disconnect();
		}
		
		return comments	;
	}
	public List<CommentCustom> newComment(int idProduct) {
		List<CommentCustom> comments = new ArrayList<CommentCustom>();
		
			try {
				PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select c.id, c.productId, c.content, c.created, a.username from comments c, accounts a where productId=? and c.accountId = a.id");
				preparedStatement.setInt(1, idProduct);
				ResultSet resultSet = preparedStatement.executeQuery();
				while(resultSet.next()){
					CommentCustom comment = new CommentCustom();
					comment.setId(resultSet.getInt("c.id"));
					comment.setAccountId(resultSet.getString("a.username"));
					comment.setProductId(resultSet.getInt("c.productId"));
					comment.setContent(resultSet.getString("c.content"));
					comment.setCreated(resultSet.getString("c.created"));
					comments.add(comment);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			comments = null;
		}finally {
			ConnectDB.disconnect();
		}
		
		return comments	;
	}
	public String NameAccountById(int accountId) {
		String result = "";
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("select accounts.username from comments join accounts on accounts.id = comments.accountId where accountId=?");
			preparedStatement.setInt(1, accountId);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				result = resultSet.getString("username");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "false";
		}finally {
			ConnectDB.disconnect();
		}
		return result;
	
	}
	public boolean create(Comment comment) {
		boolean result = true;
		
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("insert into comments (productId, accountId, content, created) "
							+ "values(?, ?, ?, ?)");
			preparedStatement.setInt(1, comment.getProductId());
			preparedStatement.setInt(2, comment.getAccountId());
			preparedStatement.setString(3, comment.getContent());
			preparedStatement.setString(4,  comment.getCreated());
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
		CommentModel commentModel = new CommentModel();
		System.out.println(commentModel.newComment(32));
				
	}
	public List<Comment> viewNewComment() {
		List<Comment> comments = new ArrayList<Comment>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection()
					.prepareStatement("SELECT * FROM comments ORDER BY created DESC LIMIT 4");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				Comment comment = new Comment();
				comment.setId(resultSet.getInt("id"));
				comment.setAccountId(resultSet.getInt("accountId"));
				comment.setProductId(resultSet.getInt("productId"));
				comment.setContent(resultSet.getString("content"));
				comment.setCreated(resultSet.getString("created"));
				comments.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			comments = null;
		}finally {
			ConnectDB.disconnect();
		}
		return comments	;
	}
}
