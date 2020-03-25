<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%> 
<%@ page import ="java.time.format.DateTimeFormatter"
    import="java.time.LocalDateTime"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>DP LIST</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src=https://code.jquery.com/jquery-3.3.1.js></script> 
   

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
			<link rel="stylesheet" href="../css/style2.css">
	  <style>
	#link
	{
	color: #009688 ;
	}
   </style>
    <style>
.notfound{
  display: none;
}

tr:nth-child(even) {background-color: #F9E79F;}
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
th{
background-color: #282C34;
color: white;
}
tr:hover {background-color:#f5f5f5;}
</style> 
 </head>

<body>
<%@include file="db.jsp" %>
    <div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active" >
	<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>       
	 <ul class="list-unstyled components mb-5">

<%
    Connection con1=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
    String aphone=request.getParameter("admin_phone");
  %>
  <% 
   try
   {
	   
     con1=DriverManager.getConnection(Url,Username,password);
     ps1=con1.prepareStatement("select * from user");
     
    String sql = "Select * from user Where admin_phone=" + aphone;
      rs1 = ps1.executeQuery(sql);
      if(rs1.next())
      {
        
%>
      <li ><a  href="userdplist_user.jsp?dpid=<%=rs1.getString("dpid")%>&admin_phone=<%=request.getParameter("admin_phone")%>" ><span class="fa fa-info-circle"></span>User Details</a>
           </li>
           
          <li ><a  href="timeset_user.jsp?dpid=<%=rs1.getString("dpid")%>&admin_phone=<%=request.getParameter("admin_phone")%>" ><span class="fa fa-clock-o"></span>Time Manager</a>
        </li>
        
        <li ><a  href="onoff_user.jsp?dpid=<%=rs1.getString("dpid")%>&admin_phone=<%=request.getParameter("admin_phone")%>" ><span class="fa fa-toggle-on"></span>ON/OFF</a>
        </li>
        
        <li ><a  href="show_user_notification.jsp?admin_phone=<%=request.getParameter("admin_phone")%>" ><span class="fa fa-bell"></span>Show Notifications</a>
        </li> 
        
       <li ><a  href="show_myuser_notification.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><span class="fa fa-bell"></span>Show My Notifications</a>
        </li>      
            
        <li ><a  href="../homepage.jsp" ><span class="fa fa-power-off"></span>Logout</a>
        </li>
        
        
      </ul>
      </nav>
<%
      
}
}
catch (Exception e) 
{
e.printStackTrace();
}
%><div id="content" >
	        <nav class="navbar navbar-expand-lg navbar-light bg-light">
	          <div class="container-fluid">
	
	            <button type="button" id="sidebarCollapse" class="btn btn-primary">
	              <i class="fa fa-bars"></i>
	              <span class="sr-only">Toggle Menu</span>
	            </button>
         		</div>
         		</nav>
 <div class="my" style=" line-height: 5px;overflow: scroll;height: 550px;width:80%; margin-left: 50px; margin-top: 10%;">                          
 <%
 DateTimeFormatter dtf = DateTimeFormatter.ofPattern(" HH:mm:ss");
 LocalDateTime now = LocalDateTime.now();
%>
              
             <%
String dpid = request.getParameter("dpid");

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(Url,Username,password);
statement=connection.createStatement();
String sql ="select * from dp_info where dpid="+dpid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String phase=resultSet.getString("phase");
    int count = Integer.parseInt(phase);
    if(count==1)
    {
    	%><form action="savephase1_user.jsp" method="post" class="myform">
      	<div>
      	<h3 style="color: red;"><center>Single Phase</center></h3>
      	<h4>Slot 1</h4>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm" name="on_time" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm" name="off_time" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	      <input type="hidden" name="dpid" value="<%=dpid%>">
    	        
    	     
    	     <button class="btn btn-primary" type="submit" id="myBtn"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>
    	  </div>
    	<div>
      	<h3>Current Saved Time</h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("on_time")%>" type="text" disable/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Password::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("off_time")%>" type="text" disabled/>
         </div>
    </div>
    	 <input type="hidden" name="dpid" value="<%=dpid%>">
   </form>
   <form action="savephase1_user_slot2.jsp" method="post" class="myform">
      	<div>
      	<h4>Slot 2</h4>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm" name="on_time2" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm" name="off_time2" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	      <input type="hidden" name="dpid" value="<%=dpid%>">
    	        
    	     
    	     <button class="btn btn-primary" type="submit" id="myBtn"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>
    	  </div>
    	<div>
      	<h3>Current Saved Time</h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("on_time2")%>" type="text" disable/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Password::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("off_time2")%>" type="text" disabled/>
         </div>
    </div>
    	 <input type="hidden" name="dpid" value="<%=dpid%>">
   </form>
   
   
   <% 
    }
    if(count==2)
    {
    	%><form action="savephase2_user.jsp" method="post" class="myform">
      	<div>
      	<h3 style="color: red;"><center>Two Phase</center></h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm" name="on_time" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm"  name="off_time" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	      <input type="hidden" name="dpid" value="<%=dpid%>">
    	        
    	     
    	     <button class="btn btn-primary" type="submit" id="myBtn"><i class="fa fa-fw fa-lg fa-check-circle"></i>submit</button>
    	  </div>
    	<div>
      	<h3>Current Saved Time</h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("on_time")%>" type="text" disable/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("off_time")%>" type="text" disabled/>
         </div>
    	     
    </div>
    	 <input type="hidden" name="dpid" value="<%=dpid%>">
   </form>
   <form action="savephase2_user_slot2.jsp" method="post" class="myform">
      	<div>
      	<h4>Slot 2</h4>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm" name="on_time2" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm" name="off_time2" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	      <input type="hidden" name="dpid" value="<%=dpid%>">
    	        
    	     
    	     <button class="btn btn-primary" type="submit" id="myBtn"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>
    	  </div>
    	<div>
      	<h3>Current Saved Time</h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("on_time2")%>" type="text" disable/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Password::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("off_time2")%>" type="text" disabled/>
         </div>
    </div>
    	 <input type="hidden" name="dpid" value="<%=dpid%>">
   </form>
   <%
    }
    if(count==3)
    {
    	%><form action="savephase3_user.jsp" method="post" class="myform">
      	<div>
      	<h3 style="color: red;"><center>Three Phase</center></h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  name="on_time" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm"  name="off_time" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	      <input type="hidden" name="dpid" value="<%=dpid%>">
    	        
    	     
    	     <button class="btn btn-primary" type="submit" id="myBtn"><i class="fa fa-fw fa-lg fa-check-circle"></i>submit</button>
    	  </div>
    	<div>
      	<h3>Current Saved Time</h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("on_time")%>" type="text" disable/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("off_time")%>" type="text" disabled/>
         </div>
   </div>
    	 <input type="hidden" name="dpid" value="<%=dpid%>">
   </form>
   <form action="savephase3_user_slot2.jsp" method="post" class="myform">
      	<div>
      	<h4>Slot 2</h4>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm" name="on_time2" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Off Time::</label>
             <input class="form-control form-control-sm" name="off_time2" value="<%=dtf.format(now)%>" type="text" required/>
         </div>
    	      <input type="hidden" name="dpid" value="<%=dpid%>">
    	        
    	     
    	     <button class="btn btn-primary" type="submit" id="myBtn"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save</button>
    	  </div>
    	<div>
      	<h3>Current Saved Time</h3>
    	    <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">On Time::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("on_time2")%>" type="text" disable/>
         </div>
    	     
    	     <div class="form-group">
             <label class="col-form-label col-form-label-sm" for="inputSmall">Password::</label>
             <input class="form-control form-control-sm"  value="<%=resultSet.getString("off_time2")%>" type="text" disabled/>
         </div>
    </div>
    	 <input type="hidden" name="dpid" value="<%=dpid%>">
   </form>
   
   <%
    }
    
    	%>
    	
    
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
