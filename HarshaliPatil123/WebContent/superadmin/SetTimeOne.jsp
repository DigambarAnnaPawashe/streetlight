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
         
    <div class="my" style=" line-height: 5px;overflow: scroll;height: 550px;width:80%; margin-left: 50px;">                           
 <%
 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm:ss");
 LocalDateTime now = LocalDateTime.now();
%>
        <%@include file="db.jsp" %>       
 <%
String dpid = request.getParameter("dpid");
Connection connection = null;
Statement statement = null;ResultSet resultSet = null;
Statement statement1 = null;ResultSet resultSet1 = null;
Statement statement2 = null;ResultSet resultSet2 = null;
Statement statement3 = null;ResultSet resultSet3 = null;

%>
<%
try{
connection = DriverManager.getConnection(Url,Username,password);
statement=connection.createStatement();
statement1=connection.createStatement();
statement2=connection.createStatement();
statement3=connection.createStatement();

String sql ="select * from dp_info where dpid="+dpid;
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{
	String phase=resultSet.getString("phase");
    int count = Integer.parseInt(phase);

    
if(count==1)
    {
	String sql1 ="select * from onephase where dpid="+dpid;
	resultSet1 = statement1.executeQuery(sql1);
	while(resultSet1.next())
	{
	
	%>    <form action="savephase1.jsp" method="post" class="myform">
		      	<div>
		      	<h1 style="color: red;">Single Phase</h1>
		      	     <h4>Slot 1</h4>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" name="on_time" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" id="p_assword" name="off_time" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	      <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	     
		    	         
			         <button class="btn btn-primary" type="submit"  style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
					   
		    	  </div>
		    	<div>
		      	<h3>Current Saved Time</h3>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" id="p_assword" value="<%=resultSet1.getString("on_time")%>" type="text" disabled/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Password::</label>
		             <input class="form-control" id="p_assword" value="<%=resultSet1.getString("off_time")%>" type="text" disabled/>
		         </div>
		    	 </div>
		    	 <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		  </form>  
		  <form action=savephase1_slot2.jsp method="post" class="myform" style="margin-top: -5px;">
		      	<div>  
		    	      <h4>Slot 2</h4>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" name="on_time2" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" name="off_time2" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	      <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	     
		    	         
			         <button class="btn btn-primary" type="submit" onclick = "functionAlert();" style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
					  
		    	  </div>
		    	<div style="line-height: 5px;">
		      	<h3>Current Saved Time</h3>
		    	    <div class="form-group" >
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control"  value="<%=resultSet1.getString("on_time2")%>" type="text" disabled/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Password::</label>
		             <input class="form-control" value="<%=resultSet1.getString("off_time2")%>" type="text" disabled/>
		         </div> 
		    </div>
		    	 <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		  </form>	     
<% 
	}
}
if(count==2)
{
	String sql2 ="select * from twophase where dpid="+dpid;
	resultSet2 = statement2.executeQuery(sql2);
	while(resultSet2.next())
	{
%>   
		<form action="savephase2.jsp" method="post" class="myform">
		     <div>
		      	<h1 style="color: red;">Two Phase</h1>
		      	<h4>Slot 1</h4>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control"  name="on_time" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" name="off_time" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	      <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	     
		    	         
			        <button class="btn btn-primary" type="submit"  style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
					   <div id = "confirm">
				        
		    	  </div>
		    	<div>
		      	<h3>Current Saved Time</h3>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" value="<%=resultSet2.getString("on_time")%>" type="text" disabled/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control"  value="<%=resultSet2.getString("off_time")%>" type="text" disabled/>
		         </div>
		    </div>
		    	 <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	   
		    	</form>
		    <form action="savephase2_slot2.jsp" method="post" class="myform" style="margin-top: -5px;">
		     <div>    
		    	   <h4>Slot 2</h4>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control"  name="on_time2" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" name="off_time2" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	      <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	     
		    	         
			        <button class="btn btn-primary" type="submit"  style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
					   
		    	<div style="line-height: 5px;">
		      	<h3>Current Saved Time</h3>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" value="<%=resultSet2.getString("on_time2")%>" type="text" disabled/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" value="<%=resultSet2.getString("off_time2")%>" type="text" disabled/>
		         </div>
		    </div>
		    	 <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	   
		    	</form>	
		    	
    	     
<%
	}
}
if(count==3)
{
	
	String sql3 ="select * from threephase where dpid="+dpid;
	resultSet3 = statement3.executeQuery(sql3);
	while(resultSet3.next())
	{
		%>    <form action="savephase3.jsp" method="post" class="myform">
		      	<div>
		      	<h1 style="color: red;">Three Phase</h1>
		      	<h4>Slot 1</h4>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" id="p_assword" name="on_time" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" id="p_assword" name="off_time" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	      <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	     
		    	         
			        <button class="btn btn-primary" type="submit"  style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
					   <div id = "confirm">
				       
		    	  </div>
		    	<div>
		      	<h3>Current Saved Time</h3>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control" id="p_assword" value="<%=resultSet3.getString("on_time")%>" type="text" disabled/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" id="p_assword" value="<%=resultSet3.getString("off_time")%>" type="text" disabled/>
		         </div>
		    </div>
		    	 <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    </form>
		    <form action="savephase3_slot2.jsp" method="post" class="myform" style="margin-top: -5px;">
		      	<div>     
		    	   	<h4>Slot 2</h4>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control"  name="on_time2" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control"  name="off_time2" value="<%=dtf.format(now)%>" type="text" required/>
		         </div>
		    	      <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    	     
		    	         
			        <button class="btn btn-primary" type="submit"  style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
					   
		    	<div style="line-height: 5px;">
		      	<h3>Current Saved Time</h3>
		    	    <div class="form-group">
		             <label for="exampleInputPassword1">On Time::</label>
		             <input class="form-control"  value="<%=resultSet3.getString("on_time2")%>" type="text" disabled/>
		         </div>
		    	     
		    	     <div class="form-group">
		             <label for="exampleInputPassword1">Off Time::</label>
		             <input class="form-control" value="<%=resultSet3.getString("off_time2")%>" type="text" disabled/>
		         </div> 
		    </div>
		    	 <input type="hidden" name="dpid" value="<%=dpid%>">
		    	        
		    </form>	     
          <%
         }
          %>
         <% 
      }
   }
connection.close();
} 
catch (Exception e) 
{
e.printStackTrace();
}
			
%>
</div>
</div>
</div>


    
    
   
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
