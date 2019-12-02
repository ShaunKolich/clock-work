package com.skillstorm.data;

import java.io.IOException;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.skillstorm.javabeans.User;

public class UserDao {

	public Connection getConnection() {

		Connection conn = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/timesheet";
			conn = DriverManager.getConnection(url, "root", "root");
			return conn;

		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
			return conn;
		}

	}

//	public static void main(String[] args) throws SQLException, ParseException {// main
//
//		String pattern = "YYYY/MM/DD";
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
//
//		java.util.Date date = Calendar.getInstance().getTime();
//		String parsedDate = simpleDateFormat.format(date);
//
//		String url = "jdbc:mysql://localhost:3306/clockwork";
//		Connection conn = DriverManager.getConnection(url, "root", "root");
//
//		System.out.println(parsedDate);
//		// run sql commands
//		PreparedStatement stm = conn.prepareStatement("Select * from users;");
//
//		ResultSet results = stm.executeQuery(); // wll return the rowcount
//
//		while (results.next()) {
//			System.out.println("results " + results.getString("userId"));
//		}
//
//		UserDao u = new UserDao();
//
//		System.out.println("Get User Method " + u.getUserById(2));
//		u.verifyUser("lphung1", "pickles");
//
//		TimeSheetDAO t = new TimeSheetDAO();
//
////		t.addNewTimeSheet(u.getUserById(1) ,  parsedDate ) ;
////		
//		System.out.println(t.findAllTimeSheet());
//
//	}// main

	public User getUserById(int i) {

		Connection conn = getConnection();

		try {
			PreparedStatement stm = conn.prepareStatement("Select * from employee where userId = ? ;");
			stm.setInt(1, i);
			ResultSet results = stm.executeQuery(); 
			results.next();
			User user = new User(results);

			return user;
		} catch (SQLException e) {
			System.out.println(e);

		}

		return new User();
	}

	public boolean verifyUser(String usrName, String passWord) {

		Connection conn = getConnection();

		usrName.toLowerCase();

		try {

			PreparedStatement stm = conn.prepareStatement("Select * from employee where userName = ? AND password = ?;");
			stm.setString(1, usrName);
			stm.setString(2, passWord);

			ResultSet rs = stm.executeQuery();

			rs.next();

			System.out
					.println("Result set for verify user " + rs.getString("userName") + " " + rs.getString("password"));
			System.out.println("Results from params " + usrName + " " + passWord);

			if (rs.getString("userName").equals(usrName) && rs.getString("password").equals(passWord)) {

				System.out.println("Username Password Match in DB");
				return true;
			}

		} catch (SQLException e) {
			
			System.out.println("Verify user failed with SQL exception in UserDao");
			System.out.println(e);
			return false;
		}

		return false;
	}

	public User getUser(String usrName, String passWord) {

		String url = "jdbc:mysql://localhost:3306/clockwork";

		Connection conn = getConnection();

		usrName.toLowerCase();

		try {

			PreparedStatement stm = conn.prepareStatement("Select * from employee where userName = ? AND password = ?;");
			stm.setString(1, usrName);
			stm.setString(2, passWord);

			ResultSet rs = stm.executeQuery();
			System.out.println("Result set for verify user " + rs);

			rs.next();

			return new User(rs);

		} catch (SQLException e) {
			System.out.println(e);

		}

		return new User();

	}

}
