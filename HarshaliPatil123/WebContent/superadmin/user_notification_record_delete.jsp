<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	    
    <title>Delete Admin Recored</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="../css/main.css">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
    
</head>
<body class="app sidebar-mini">
	html {
 				 overflow-y: scroll;
				}
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.html">Aderate Solution</a>
    
    </header>
    <!-- Sidebar menu-->
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
      
      <div> <%@include file="db.jsp" %>
     
<%
	   String sr_no = request.getParameter("sr_no");
	   if(sr_no!= null)
     	{
			Connection con = null;
			PreparedStatement ps = null;
	int personID = Integer.parseInt(sr_no);
 	try
	{
		
			con = DriverManager.getConnection(Url,Username,password);
			String sql="delete from user_notification where sr_no="+personID;
			ps = con.prepareStatement(sql);
			
			 
			int i = ps.executeUpdate();
			if(i > 0)
			{
			  RequestDispatcher rd=request.getRequestDispatcher("user_notification_info.jsp");
			 rd.forward(request, response);	
			}
			else
			{
			out.print("There is a problem in deleting Record.");
			}
	}
	catch(SQLException sql)
	{
	 request.setAttribute("error", sql);
	out.println(sql);
     }
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
