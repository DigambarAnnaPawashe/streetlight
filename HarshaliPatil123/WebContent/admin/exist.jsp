<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="db.jsp" %>
<%
    try{
    	String dpid=request.getParameter("dpid");
    	String phone=request.getParameter("phone");
    	System.out.println();
    	System.out.println(request.getParameter("phone"));
        
        Connection con =(Connection) DriverManager.getConnection(Url,Username,password);
        /*registration.jsp and regdpsuperadmin.jsp for admin and superadmin adddp*/
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM dp_info WHERE dpid = ?");
            ps.setString(1,request.getParameter("dpid"));
            
            ResultSet res = ps.executeQuery();
            if(res.next()){
                out.print("DP Id already exists...");
            }
            	   
            	  
           PreparedStatement ps1 = con.prepareStatement("SELECT  * FROM dp_info WHERE phone = ?");
	            
	            ps1.setString(1,request.getParameter("phone"));
	            ResultSet res1 = ps1.executeQuery();
	            if(res1.next()){
	                out.print("Phone Number already exists...");
	            }
	               
	              
/*admin_registration phone-checkExist2() email-checkExist3()*/
   			 PreparedStatement ps2 = con.prepareStatement("SELECT  * FROM admin WHERE admin_phone = ?");
            ps2.setString(1,request.getParameter("admin_phone"));
            
            ResultSet res2 = ps2.executeQuery();
            if(res2.next()){
                out.print("User already exists...");
            }
            	   
            	  
           PreparedStatement ps3 = con.prepareStatement("SELECT  * FROM admin WHERE admin_email = ?");
	            
	            ps3.setString(1,request.getParameter("admin_email"));
	            ResultSet res3 = ps3.executeQuery();
	            if(res3.next()){
	                out.print("User already exists...");
	            }
	            
	    /*user_registration.jsp and user_registration_admin.jsp phone-checkExist4() email-checkExist5() ADMIN & SUPERADMIN*/            
	               
	            PreparedStatement ps4 = con.prepareStatement("SELECT  * FROM user WHERE user_phone = ?");
	            ps4.setString(1,request.getParameter("user_phone"));
	            
	            ResultSet res4 = ps4.executeQuery();
	            if(res4.next()){
	                out.print("Phone Number already exists...");
	            }
	            	   
	            	  
	           PreparedStatement ps5 = con.prepareStatement("SELECT  * FROM user WHERE user _email = ?");
		            
		            ps5.setString(1,request.getParameter("user_email"));
		            ResultSet res5 = ps5.executeQuery();
		            if(res5.next()){
		                out.print("EmaidID already exists...");
		            }
		            
	               }catch (Exception e){
	            System.out.println(e);  
	        }

%>
</body>
</html>