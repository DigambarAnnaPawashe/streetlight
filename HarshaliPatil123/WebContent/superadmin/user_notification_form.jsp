<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" 
    import ="java.time.format.DateTimeFormatter"
    import="java.time.LocalDateTime"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Add Admin </title>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>

<body >

		<div class="wrapper d-flex align-items-stretch">
					<nav id="sidebar" class="active">
						<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
		          <ul class="list-unstyled components mb-5">
          <li >
            <a  href="dashboard.jsp"><span class="fa fa-home"></span>DashBoard</a>
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
            <a class="active" href="user_notification_info.jsp"><span class="fa fa-bell"></span> User Notifications</a>
          </li>
           <li>
            <a href="logout.jsp"><span class="fa fa-power-off"></span>Logout</a>
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
  <div class=" pull-right" style="margin-top:5px;">
    <input class="btn btn-outline-primary" type=button onClick="location.href='user_notification_info.jsp'" value='Back'>
    </div>   
<%
 DateTimeFormatter dtf = DateTimeFormatter.ofPattern(" HH:mm:ss");
 LocalDateTime now = LocalDateTime.now();
%>
       <div class="my" >
           			
				<form name="form1" method="post" action="user_notification_db.jsp">
						
				   <div class="form-group">
                    <label for="exampleInputPassword1">Sr_no::</label>
                    <input class="form-control" name="sr_no" type="text" required />
                   
                   </div>
             
                 <div class="form-group">
                    <label for="exampleInputPassword1">Notification::</label>
                    <textarea class="form-control" name="notification" type="text" cols="30" rows="5"></textarea>
                  </div>
                  
                   <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">Time::</label>
                    <input class="form-control" name="time" type="text" value="<%=dtf.format(now)%>">
                  </div>
                  
             <button class="btn btn-primary" type="button" onclick = "functionAlert();" style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
				   <div id = "confirm">
			         <div class = "message">Do you Want To Register</div>
			         <button type="submit"  class = "yes">OK</button>
			         <button type="button" class="yes"  style="background: red">Cancel</button>
			       </div>             
		  
            <div class="tile-footer">
		<button class="btn btn-secondary" onClick="location.href='user_notification_form.jsp' " ><i class="fa fa-fw fa-lg fa-times-circle"></i>Reset</button>
            </div>
            
            </form>
         </div>
    </div>
</div>
      
    
     <script>
         function functionAlert(msg, myYes) 
         {
            var confirmBox = $("#confirm");
            confirmBox.find(".message").text(msg);
            confirmBox.find(".yes").unbind().click(function() {
               confirmBox.hide();
            });
            confirmBox.find(".yes").click(myYes);
            confirmBox.show();
         }
     </script>  	
    <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <footer style="margin-top:-5% ">
	   		<div class="footer-copyright" >
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>    
  </body>
</html>
