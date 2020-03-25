package com.aderateTech;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionManager {
	private static String driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost/myproject?autoReconnect=true&useSSL=false";
	private static String username="root";
	private static String password="";
	
	private static Connection con=null;
	 

	    public static Connection getConnection()
	    {
	    	try {
	    		Class.forName(driver);
	    	}
	    	catch (Exception e) {
	          System.out.println("ERROR::Unable to load driver");
	    	}
	    	try {
	    		  con=DriverManager.getConnection(url,username,password);
	    		
	    	}
	    	catch (Exception e) {
				System.out.println("ERROR::Unable to establish connection");
			}
			return con;
			
	    }


}
