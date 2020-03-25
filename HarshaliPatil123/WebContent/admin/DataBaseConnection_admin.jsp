<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit DP Recored</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>
<body >
    <div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<a href="index.html" class="logo" >AdeRate Solution</a>
                <ul class="list-unstyled components mb-5">
      
     
          <li>
              <a href="dptable_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-sliders"></span> DP List</a>
          </li>
           <li>
              <a  href="timeset_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-clock-o"></span> Time Manager</a>
          </li>
          <li>
          <li>
            <a href="admin_user_info1.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-users"></span> User Manager</a>
          </li>
          <li>
            <a href="onoff_admin.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><span class="fa fa-toggle-on"></span> ON/OFF</a>
          </li>
          <li>
            <a href="show_admin_notification.jsp?admin_phone=<%=request.getParameter("admin_phone")%>" ><span class="fa fa-bell"></span> Show Notifications</a>
          </li>
           <li>
            <a href="newadmin_notification_info.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><span class="fa fa-bell"></span>Notifications</a>
          </li>
         
           <li>
            <a href="../homepage.jsp"><span class="fa fa-power-off"></span>Logout</a>
          </li>
      </ul>  
      </nav>
      
      <div id="content" >

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            
           
          </div>
        </nav>
        <%@include file="db.jsp" %>
        
 <%
   String name=request.getParameter("name");
   String dpid=request.getParameter("dpid");
   String dp_number=request.getParameter("dp_number");
   String address=request.getParameter("address");
   String phone=request.getParameter("phone");
   String aphone=request.getParameter("admin_phone");
   int phase=Integer.parseInt(request.getParameter("phase"));
   try
   {
	
    Connection conn = DriverManager.getConnection(Url,Username,password);
    PreparedStatement ps=null;
   
    

    ps=conn.prepareStatement("select * from dp_info where dpid='" +dpid+ "' and phone='"+phone+"'");
          ResultSet rs = ps.executeQuery();
          if (rs.next()) {
        	  System.out.println("User already Regitstered");
        	  request.setAttribute("alertMsg", "DP already exist");
          	RequestDispatcher rd=request.getRequestDispatcher("registrationform.jsp");  
          	rd.include(request, response);
          	/* RequestDispatcher rd=request.getRequestDispatcher("success.jsp");
				rd.forward(request, response); */
          } 
          else 
          {
	Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into dp_info(name,dpid, dp_number,address,phone,phase,admin_phone)values('"+name+"','"+dpid+"','"+dp_number+"','"+address+"','"+ phone+"','"+ phase+"','"+aphone+"')");
	if(i>0)
	{	
		
	  RequestDispatcher rd=request.getRequestDispatcher("dptable_admin.jsp");
	  rd.forward(request, response);
	}
	else
	{
		out.print("There is problem in adding record..");
	}
           
     if(phase==1){
		Statement st1=conn.createStatement();
	    int j=st1.executeUpdate("insert into onephase(dpid,r,r_voltage,r_current,onoff,on_time,off_time,on_time2,off_time2)values('"+dpid+"',null,null,null,null,null,null,null,null)");
		if(j>0)
		{
		  System.out.println("Record save into onephase");
		  
		}
		else
		{
			out.print("There is problem in adding record ...ONEPHASE");
		}
		}
	   
	   if(phase==2){
			Statement st2=conn.createStatement();
		    int j=st2.executeUpdate("insert into twophase(dpid,r,r_voltage,r_current,y,y_voltage,y_current,r_onoff,y_onoff,on_time,off_time,on_time2,off_time2)values('"+dpid+"',null,null,null,null,null,null,null,null,null,null,null,null)");
			if(j>0)
			{
			  System.out.println("Record save into Twophase");
			  
			}
			else
			{
				out.print("There is problem in adding record ...ONEPHASE");
			}
			}
	   if(phase==3){
			Statement st3=conn.createStatement();
		    int j=st3.executeUpdate("insert into threephase(dpid,r,r_voltage,r_current,y,y_voltage,y_current,b,b_voltage,b_current,r_onoff,y_onoff,b_onoff,on_time,off_time,on_time2,off_time2)values('"+dpid+"',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)");
			if(j>0)
			{
			  System.out.println("Record save into Threephase");
			  
			}
			else
			{
				out.print("There is problem in adding record ...ONEPHASE");
			}
			
	  
   }
          
          }
          
   }
   catch(Exception e)
	{
	 System.out.print(e);
	 e.printStackTrace();
	}
%>
<br><br>
</div>
</div>
    
    
   
  </body>
</html>
