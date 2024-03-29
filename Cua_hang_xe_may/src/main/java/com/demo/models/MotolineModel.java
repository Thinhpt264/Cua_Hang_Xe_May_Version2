package com.demo.models;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.demo.entities.ConnectDB;
import com.demo.entities.Motoline;

public class MotolineModel {
	public List<Motoline> findAll(){
		List<Motoline> motolines = new ArrayList<Motoline>();
		try {
			PreparedStatement preparedStatement = ConnectDB.connection().prepareStatement("select * from motolines");
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Motoline motoline = new Motoline();
				motoline.setId(resultSet.getInt("id"));
				motoline.setName(resultSet.getString("name"));
				motolines.add(motoline);
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			motolines = null;
			
		} finally {
			ConnectDB.disconnect();
		}
		return motolines;
	}
}
