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
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="index.html">Aderate Solution</a>
      <!-- Navbar Right Menu-->
    
    </header>
    
       <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images\profoundlogo.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Admin</p>
        </div>
      </div>
      
       <div class="vertical-menu">
      	
      <ul class="app-menu">
      <li><a class="app-menu__item" href="dptable_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">DP List</span></a>
       </li>
       
        <li><a class="app-menu__item" href="timeset_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">Time Manager</span></a>
        </li>
      
         <li><a class="app-menu__item" href="admin_user_info1.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><i class="app-menu__icon fa fa-laptop"></i><span class="app-menu__label">User Manager</span></a>
       </li>
       
       <li ><a class="app-menu__item" href="onoff_admin.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><i class="app-menu__icon fa fa-history" ></i><span class="app-menu__label">ON/OFF</span></a>
        </li>
        
        <li ><a class="app-menu__item" href="show_admin_notification.jsp?admin_phone=<%=request.getParameter("admin_phone")%>" ><i class="app-menu__icon fa fa-history" ></i><span class="app-menu__label">Show Notifications</span></a>
         </li>
        
         <li ><a class="app-menu__item" href="newadmin_notification_info.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><i class="app-menu__icon fa fa-history" ></i><span class="app-menu__label">Notifications</span></a>
       </li>
       
       <li ><a class="app-menu__item" href="../homepage.jsp" ><i class="app-menu__icon fa fa-history" ></i><span class="app-menu__label">Logout</span></a>
        </li>
                 		            	
       </ul>
      </div>
    </aside>
    <main class="app-content">
      <div class="app-title">
       
      </div>
    
       <br><br><br><br>
 <div>
 <%@include file="db.jsp" %>
	
		<%
			int sr_no=Integer.parseInt(request.getParameter("sr_no"));
			String notification=request.getParameter("notification");
			String time=request.getParameter("time");
			String aphone=request.getParameter("admin_phone");

			
			try
			{
			
			Connection conn = DriverManager.getConnection(Url,Username,password);
			Statement st=conn.createStatement();
			
			int i=st.executeUpdate("insert into admin_notification(sr_no,notification,time,admin_phone)values('"+sr_no+"','"+notification+"','"+time+"','"+aphone+"')");
             if(i>0){
			 RequestDispatcher rd=request.getRequestDispatcher("newadmin_notification_info.jsp");
			 rd.forward(request, response);	
             }
             else{
            	 out.print("error while adding admin notification");
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
    
    
  </body>
</html>
