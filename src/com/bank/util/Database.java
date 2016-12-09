package com.bank.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Database {
	private Connection connection;
	private PreparedStatement ps;
	public void close() {
		try {
			if(ps != null) {
				ps.close();
			}
			if(connection != null) {
				connection.close();
			}
		} catch(Exception e) {}
	}
	public PreparedStatement getPS(String query) {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			ps = connection.prepareStatement(query);
			return ps;
		} catch(Exception e) {
			return null;
		}
	}
}

