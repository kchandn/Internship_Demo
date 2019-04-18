package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectDB {

	public static String driver="com.mysql.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/demo";
	public static String username="root";
	public static String password="root";
	public static Connection con=null;
	public static PreparedStatement ps=null;
	public static ResultSet rs=null;
	
	public static Connection connect()
	{
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,username, password);
			System.out.println("Connection Established.......");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}
}
