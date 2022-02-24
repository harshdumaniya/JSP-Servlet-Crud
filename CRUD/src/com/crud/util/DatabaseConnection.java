package com.crud.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

	public static Connection connection() throws SQLException {
		String url = "jdbc:mysql://localhost:3306/bookdb?useSSL=false";
		String username = "root";
		String password = "root";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
		Connection connection = DriverManager.getConnection(url, username, password);
		return connection;
	}

}