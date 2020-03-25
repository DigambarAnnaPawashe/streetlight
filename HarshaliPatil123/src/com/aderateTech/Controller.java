package com.aderateTech;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.aderateTech.ConnectionManager;
import com.mysql.jdbc.Statement;
import com.mysql.jdbc.StringUtils;

public class Controller extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Connection con=null;
	PreparedStatement pstmt=null;
    Statement statement1=null;ResultSet resultSet1=null;
    Statement statement2=null;ResultSet resultSet2=null;
    Statement statement3=null;ResultSet resultSet3=null;

	//int phase=Integer.parseInt(req.getParameter("phase"));
	String str=req.getParameter("EnterString");
	String var=null;
	
	String[] words=str.split(":");//splits the string based on whitespace  
	 List<String> itemList = new ArrayList<String>();
     for (String w : words) 
     {
        itemList.add(w);
     }
     System.out.println(itemList);
  int phase=itemList.size();
		

	 for(int j=0;j<itemList.size();j++) 
	 {
		 var=itemList.get(1);
		 
	 }
	try
	{
		con=ConnectionManager.getConnection();
		
			
		if(phase==5) 
		{
			
            String sql1="Update onephase set r=?,r_voltage=?,r_current=? where dpid='"+var+"'";
            
            PreparedStatement ps1 = con.prepareStatement(sql1);
            
          for(int i=0;i<itemList.size();i++)
		  {
			if(itemList.get(0).equals("#"))
			{
		     switch(i)
		      {
		           
		          case 2:ps1.setString(1,itemList.get(i));
		          case 3:ps1.setString(2,itemList.get(i));
		          case 4:ps1.setString(3,itemList.get(i));
		       }
		    }
			else
			{
				RequestDispatcher rd=req.getRequestDispatcher("error.jsp");
			    rd.forward(req, resp);
		    }
		  }
		int count=ps1.executeUpdate();
	    if(count>0)
		{
	        resp.setContentType("text/html");
	        PrintWriter out = resp.getWriter();
			System.out.println("Record id added successfully");
			
		}
	      
	    statement1=(Statement)con.createStatement();
	    String query="SELECT * FROM onephase where dpid="+var;
		resultSet1=statement1.executeQuery(query);
		   while(resultSet1.next())
		   {
		        String onoff=resultSet1.getString("onoff");
		        System.out.println("onoff info::"+onoff);
		        req.setAttribute("onoff",onoff);
		        RequestDispatcher rd=req.getRequestDispatcher("showresult.jsp");
		        rd.forward(req, resp);
		        
		    }	 			
	}
		
		
		if(phase==8)
		{ 
			String sql1="Update twophase set r=?,r_voltage=?,r_current=?,y=?,y_voltage=?,y_current=? where dpid='"+var+"'";
        
        PreparedStatement ps1 = con.prepareStatement(sql1);
			for(int i=0;i<itemList.size();i++)
			{
				if(itemList.get(0).equals("#"))
				{
			     switch(i)
			     {
			       
			        case 2:ps1.setString(1,itemList.get(i));
					case 3:ps1.setString(2,itemList.get(i));
					case 4:ps1.setString(3,itemList.get(i));
					case 5:ps1.setString(4,itemList.get(i));
					case 6:ps1.setString(5,itemList.get(i));
					case 7:ps1.setString(6,itemList.get(i));
					
					  
			     }
			    }
				else
				{
					RequestDispatcher rd=req.getRequestDispatcher("error.jsp");
				rd.forward(req, resp);
		 	    }
			 }
			int count=ps1.executeUpdate();
			if(count>0)
			{
				System.out.println(" twophase Record id added successfully");
		        resp.setContentType("text/html");
		        PrintWriter out = resp.getWriter();
		        out.print("Record updated in twophase...");
			}
			statement2=(Statement)con.createStatement();
		    String query="SELECT * FROM twophase where dpid="+var;
			resultSet2=statement2.executeQuery(query);
			while(resultSet2.next())
		    {
			   String r_onoff=resultSet2.getString("r_onoff");
			   String y_onoff=resultSet2.getString("y_onoff");
               resp.setContentType("text/html");
			   PrintWriter out = resp.getWriter();
			   out.print(r_onoff+","+y_onoff);
			    }
		}
		if(phase==11)
		{
			String sql1="Update threephase set r=?,r_voltage=?,r_current=?,y=?,y_voltage=?,y_current=?,b=?,b_voltage=?,b_current=? where dpid='"+var+"'";
	        
	        PreparedStatement ps1 = con.prepareStatement(sql1);
			for(int i=0;i<itemList.size();i++)
			{
				if(itemList.get(0).equals("#"))
				{
			     switch(i)
			     {
			        
				    case 2:ps1.setString(1,itemList.get(i));
					case 3:ps1.setString(2,itemList.get(i));
					case 4:ps1.setString(3,itemList.get(i));
					case 5:ps1.setString(4,itemList.get(i));
					case 6:ps1.setString(5,itemList.get(i));
					case 7:ps1.setString(6,itemList.get(i));
					case 8:ps1.setString(7,itemList.get(i));
					case 9:ps1.setString(8,itemList.get(i));
					case 10:ps1.setString(9,itemList.get(i));
					
			      }
			     }
				else
				{
					RequestDispatcher rd=req.getRequestDispatcher("error.jsp");
				rd.forward(req, resp);
			    }
			}
			int count=ps1.executeUpdate();
			if(count>0)
			{
				System.out.println("Record id added successfully");
				  resp.setContentType("text/html");
			      PrintWriter out = resp.getWriter();
			      out.print("Record updated in threephase...");
			}
			statement3=(Statement)con.createStatement();
		       String query="SELECT * FROM threephase where dpid="+var;
			   resultSet3=statement3.executeQuery(query);
			   while(resultSet3.next())
			   {
			        String r_onoff=resultSet3.getString("r_onoff");
			        String y_onoff=resultSet3.getString("y_onoff");
			        String b_onoff=resultSet3.getString("b_onoff");

			        resp.setContentType("text/html");
			        PrintWriter out = resp.getWriter();
			        out.print(r_onoff+","+y_onoff+","+b_onoff);
			    }
		}
		
		

   }
	catch (Exception e) {
		System.out.println(e);
	}
}
}
