<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
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
<body>
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
					<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="#"><span class="fa fa-home"></span> DashBoard</a>
          </li>
          <li>
              <a href="dptable.jsp"><span class="fa fa-sliders"></span> DP List</a>
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
            <a href="onoff.jsp"><span class="fa fa-toggle-on"></span>ON/OFF</a>
          </li>
           <li>
            <a href="../superadmin.jsp"><span class="fa fa-power-off"></span>Logout</a>
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
   			
		          <input class="btn btn-outline-primary" type=button onClick="location.href='dptable.jsp'" value='Back'>
		      </div>


<%
String dpid = request.getParameter("dpid");


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
  <%@include file="db.jsp" %>
<%
try{
connection = DriverManager.getConnection(Url,Username,password);
statement=connection.createStatement();
String sql ="select * from dp_info where dpid="+dpid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<div class="my" >
       <form name="form1" method="post" action="editTwo.jsp" class="my1">
  <div class="form-group">
    <label for="exampleInputEmail1">Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp" value="<%=resultSet.getString("name") %>" required/>
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">DP ID</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="dpid" onkeyup="checkExist()" value="<%=resultSet.getString("dpid") %>" disabled="disabled" >
    <input type="hidden" class="form-control" id="exampleInputPassword1" name="dpid1" value="<%=resultSet.getString("dpid") %>" >
    <span id=isE></span>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">DP Number</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="dp_number" value="<%=resultSet.getString("dp_number") %>">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Address</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="address" value="<%=resultSet.getString("address") %>">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Phone</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="phone" onkeyup="checkExist1()" value="<%=resultSet.getString("phone") %>">
    <span id=isEF></span>
  </div>
   <div class="form-group">
    <label for="exampleInputPassword1">Phase</label>
    <input type="text" class="form-control" id="exampleInputPassword1" name="phase" value="<%=resultSet.getString("phase") %>" >
  </div>
 
   <button class="btn btn-primary" type="button"  onclick = "functionAlert();" style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
		   <div id = "confirm">
	         <div class = "message">Do you Want To Register</div>
	         <button type="submit"  class = "yes">OK</button>
	         <button type="button" class="yes"  style="background: red">Cancel</button>
	       </div>

</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
			
%>      

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
    <footer >
	   		<div class="footer-copyright" >
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>     
    
  </body>
</html>
