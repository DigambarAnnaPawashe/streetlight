<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	    
    <title>Resistration form by Aderate</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="../css/main.css">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
    <style type="text/css">
     table,th,td,tr
     {
     border:1px solid #777;
     }
     
     #first-tr
     {
        background-color:black;
        color: white;
     }
     
       #second-tr
     {
        background-color:#ffece5;
        color: black;
     }
    </style>
</head>

<body class="app sidebar-mini">
<!-- 	only topdown scroll-->
 			html {
 				 overflow-y: scroll;
				}
   
    <header class="app-header"><a class="app-header__logo" href="index.html">Aderate Solution</a>
   
    </header>
    
   
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images\profoundlogo.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Super Admin</p>
        </div>
      </div>
      
       <div class="vertical-menu">
      	
     <ul class="list-unstyled components mb-5">
          <li >
            <a class="active" href="dashboard.jsp"><span class="fa fa-home"></span>DashBoard</a>
          </li>
          <li>
              <a href="dptable.jsp"><span class="fa fa-sliders"></span>DP List</a>
          </li>
            <li>
            <a href="onoff.jsp"><span class="fa fa-toggle-on"></span>ON/OFF</a>
          </li>
           <li>
              <a href="timeset.jsp"><span class="fa fa-clock-o"></span> Time Manager</a>
          </li>
          <li>
          <li>
            <a href="admin_info.jsp"><span class="fa fa-users"></span> Admin Manager</a>
          </li>
          <li>
            <a href="user_info.jsp"><span class="fa fa-users"></span> User Manager</a>
          </li>
          <li>
            <a href="admin_notification_info.jsp"><span class="fa fa-bell"></span> Admin Notifications</a>
          </li>
           <li>
            <a href="user_notification_info.jsp"><span class="fa fa-bell"></span> User Notifications</a>
          </li>
           <li>
            <a href="logout.jsp"><span class="fa fa-power-off"></span>Logout</a>
          </li>
        </ul>
      </div>
    </aside>
    <main class="app-content">
      <div class="app-title">
       
      </div>
     <%@include file="db.jsp" %>
       <br><br><br><br>
 <div>
	
		<%
			int sr_no=Integer.parseInt(request.getParameter("sr_no"));
			String notification=request.getParameter("notification");
			String time=request.getParameter("time");
			
			
			try
			{
			
			Connection conn = DriverManager.getConnection(Url,Username,password);
			Statement st=conn.createStatement();
			
			int i=st.executeUpdate("insert into user_notification(sr_no,notification,time)values('"+sr_no+"','"+notification+"','"+time+"')");
             if(i>0){
			 RequestDispatcher rd=request.getRequestDispatcher("user_notification_info.jsp");
			 rd.forward(request, response);	
             }
             else{
            	 out.print("error while adding user notification...");
             }
			}
			catch(Exception e)
			{
			System.out.print(e);
			e.printStackTrace();
			}
			%>
			
 </div>
     
           
           </main>
    
    <!-- Essential javascripts for application to work-->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/resources/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="/resources/js/plugins/chart.js"></script>
 
    
  </body>
</html>
