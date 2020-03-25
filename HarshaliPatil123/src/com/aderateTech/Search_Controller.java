package com.aderateTech;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

public class Search_Controller extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		String dpid = request.getParameter("dpid");
		String driverName = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost/myproject";
		String userId = "root";
		String password = "";
		
	   try
	   {
		Class.forName(driverName);
	   } 
	   catch (ClassNotFoundException e) 
	   {
	    e.printStackTrace();
	   }
	    
	   Connection connection = null;
	   Statement statement = null; ResultSet resultSet = null;
	   Statement statement1 = null; ResultSet resultSet1 =null;
 	  Statement statement2 = null;ResultSet resultSet2 =null;
  	  Statement statement3 = null;ResultSet resultSet3 =null;
	   try
	   { 
	     connection = DriverManager.getConnection(connectionUrl, userId, password);
		 statement=(Statement) connection.createStatement();
		 String sql ="SELECT * FROM dp_info where dpid="+dpid;
			
		 resultSet = statement.executeQuery(sql);
		 while(resultSet.next())
		 {
			String phase=resultSet.getString("phase");
			int count=Integer.parseInt(phase);
			if(count==1)
			{
				 
            	  try
			      {
				   statement1=(Statement)connection.createStatement();
			       String sql1="SELECT * FROM onephase where dpid="+dpid;
				   resultSet1=statement1.executeQuery(sql1);
				   while(resultSet1.next())
				   {
				        String onoff=resultSet1.getString("onoff");
				        System.out.println("onoff info::"+onoff);
				        response.setContentType("text/html");
				        PrintWriter out = response.getWriter();
				        out.print(onoff);
				        
				    }
			       }
            	   catch (Exception e) 
                   {
          		    e.printStackTrace();
          	       }
			  }  
               if(count==2)
      			{
      				
                  	  try
      			      {
      				   statement2=(Statement)connection.createStatement();
      			       String sql2="SELECT * FROM twophase where dpid="+dpid;
      				   resultSet2=statement2.executeQuery(sql2);
      				   while(resultSet2.next())
      				   {
      				        String r_onoff=resultSet2.getString("r_onoff");
      				        String y_onoff=resultSet2.getString("y_onoff");

      				        response.setContentType("text/html");
      				        PrintWriter out = response.getWriter();
      				        out.print(r_onoff+","+y_onoff);
      				    }
      			       }
                  	   catch (Exception e) 
                       {
                		    e.printStackTrace();
                	   }
				 }
               
               if(count==3)
     			{
     				
                 	  try
     			      {
     				   statement3=(Statement)connection.createStatement();
     			       String sql3="SELECT * FROM threephase where dpid="+dpid;
     				   resultSet3=statement3.executeQuery(sql3);
     				   while(resultSet3.next())
     				   {
     				        String r_onoff=resultSet3.getString("r_onoff");
     				        String y_onoff=resultSet3.getString("y_onoff");
     				        String b_onoff=resultSet3.getString("b_onoff");

     				        response.setContentType("text/html");
     				        PrintWriter out = response.getWriter();
     				        out.print(r_onoff+","+y_onoff+","+b_onoff);
     				    }
     			       }
                 	   catch (Exception e) 
                      {
               		    e.printStackTrace();
               	   }
				 }
				
				
		 }
			
	   }
	   catch (Exception e) 
        {
		  e.printStackTrace();
	    }
	}
}
