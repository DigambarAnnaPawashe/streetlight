<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Admin Manager</title>
   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src=https://code.jquery.com/jquery-3.3.1.js></script> 
   

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
			<link rel="stylesheet" href="../css/style2.css">
	
 </head>


<body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active" >
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
            <a class="active" href="admin_info.jsp"><span class="fa fa-users"></span> Admin Manager</a>
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

        <!-- Page Content  -->
      <div id="content" >

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
         </div>
        </nav>
        
        
            <div class=" pull-right" style="margin-top:5px;">
   			    <label>Search</label>
		          <input type='text' id='txt_searchall' placeholder='Search here...' >&nbsp; 
		          <input class="btn btn-outline-primary " type=button onClick="location.href='admin_registration.jsp'" value='+ Add Admin'>
		          <input class="btn btn-outline-primary" type=button onClick="location.href='timeset.jsp'" value='Back'>
		     </div>
       		
     	 	<div class="table" style="overflow:scroll; height: 350px;width:98%; margin-left: 10px; margin-top: 100px; ">
		 	<table id="example"  class="display" style="table-layout: auto;width:100%;">
        	<thead>
            <tr>
              <th>Name</th>
              <th>Email</th>
              <th>Mobile</th>
              <th>Password</th>
              <th>Category</th>
              <th>Status</th>
              <th>Reason</th>
              <th>Update</th>
              <th>Delete</th>
              <th>Active/Block</th>
              <th>Add DP</th>
              <th>Add User</th>
              
           </tr>
        </thead>
         <tbody>  
         <%@include file="db.jsp" %>
              <%
              
              Connection con=DriverManager.getConnection(Url,Username,password);
              PreparedStatement ps=con.prepareStatement("select admin_name,admin_email,admin_phone,admin_password,category,status,reason from admin");
              ResultSet rs=ps.executeQuery();
             while(rs.next()){
              %>  
        
               <tr>
                  <td><%=rs.getString("admin_name")%></td>
		          <td><%=rs.getString("admin_email")%></td>
		          <td><%= rs.getString("admin_phone") %></td>
		          <td><%= rs.getString("admin_password")%></td>
		          <td><%= rs.getString("category")%></td>
		          <td><%= rs.getString("status")%></td>
		          <td><%= rs.getString("reason")%></td>
		          <td><a href="admin_edit.jsp?admin_phone=<%=rs.getString("admin_phone")%>">Edit</a></td>
		          <td><a href="admin_delete.jsp?admin_phone=<%=rs.getString("admin_phone")%>">Delete</a></td>
		          <td><a href="active_block.jsp?admin_phone=<%=rs.getString("admin_phone")%>">Active/Block</a></td>
		          <td><a href="regdpsuperadmin.jsp?admin_phone=<%=rs.getString("admin_phone")%>">Add DP</a></td>
                 <td><a href="user_registration.jsp?admin_phone=<%=rs.getString("admin_phone")%>">Add User</a></td>
             
               </tr>
			           <%
			               }
			          %>

        </tbody>
  	  </table>
  	</div>
   </div>
</div>
    
   <script type="text/javascript">
    
    $(document).ready(function(){

  	  // Search all columns
  	  $('#txt_searchall').keyup(function(){
  	    // Search Text
  	    var search = $(this).val();

  	    // Hide all table tbody rows
  	    $('table tbody tr').hide();

  	    // Count total search result
  	    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;

  	    if(len > 0){
  	      // Searching text in columns and show match row
  	      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
  	        $(this).closest('tr').show();
  	      });
  	    }else{
  	      $('.notfound').show();
  	    }

  	  });

  	 

  	});

  	// Case-insensitive searching (Note - remove the below script for Case sensitive search )
  	
</script>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
 	<footer style="margin-top: 13px;">
	   		<div class="footer-copyright" style="margin-top:-5%;width: 100%;">
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>    
  </body>
</html>
