<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" 
    import ="java.time.format.DateTimeFormatter"
    import="java.time.LocalDateTime"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Set Time</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
    <style type="text/css">
    .form-control{
    width: 30%
    
    }
 
    
    </style>
</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
					<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
      <ul class="list-unstyled components mb-5">
          <li >
            <a href="dashboard.jsp"><span class="fa fa-home"></span>DashBoard</a>
          </li>
          <li>
              <a href="dptable.jsp"><span class="fa fa-sliders"></span>DP List</a>
          </li>
            <li>
            <a href="onoff.jsp"><span class="fa fa-toggle-on"></span>ON/OFF</a>
          </li>
           <li>
              <a  class="active" href="timeset.jsp"><span class="fa fa-clock-o"></span> Time Manager</a>
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
   					<input class="btn btn-outline-primary" type=button onClick="location.href='timeset.jsp'" value='Back'>
		      </div>

<h5><center>Slot 1</center></h5>
<div class="container py-5">
    <div class="row">
        <div class="col-md-10 mx-auto">
            <form action="" method="post">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label for="inputFirstname"></label>
                        <input type="text" class="form-control" id="inputFirstname" placeholder="First name">
                    </div>
                    <div class="col-sm-6">
                        <label for="inputLastname"></label>
                        <input type="text" class="form-control" id="inputLastname" placeholder="Last name">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label for="inputAddressLine1"></label>
                        <input type="text" class="form-control" id="inputAddressLine1" placeholder="Street Address">
                    </div>
                    <div class="col-sm-6">
                        <label for="inputAddressLine2"></label>
                        <input type="text" class="form-control" id="inputAddressLine2" placeholder="Line 2">
                        <br>
                         <button type="button" class="btn btn-primary px-4" >Save</button>
                    </div>
                </div>
           </form>
           
        </div>
    </div>
</div>

<h5><center>Slot 2</center></h5>
<div class="container py-5">
    <div class="row">
        <div class="col-md-10 mx-auto">
          
            <form action="" method="post">
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label for="inputFirstname"></label>
                        <input type="text" class="form-control" id="inputFirstname" placeholder="First name">
                    </div>
                    <div class="col-sm-6">
                        <label for="inputLastname"></label>
                        <input type="text" class="form-control" id="inputLastname" placeholder="Last name">
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6">
                        <label for="inputAddressLine1"></label>
                        <input type="text" class="form-control" id="inputAddressLine1" placeholder="Street Address">
                    </div>
                    <div class="col-sm-6">
                        <label for="inputAddressLine2"></label>
                        <input type="text" class="form-control" id="inputAddressLine2" placeholder="Line 2">
                         <br>
                         <button type="button" class="btn btn-primary px-4 ">Save</button>
                    </div>
                </div>
            </form>
            
        </div>
    </div>
</div>	      
	
	<footer >
	   		<div class="footer-copyright" >
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>     
	</div>	      
            <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
  
    
  </body>
</html>
         