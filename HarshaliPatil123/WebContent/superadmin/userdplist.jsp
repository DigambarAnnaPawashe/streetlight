<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" 
    import="java.util.ArrayList"
import="java.util.List"  %>
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
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active" >
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
              <a href="timeset.jsp"><span class="fa fa-clock-o"></span> Time Manager</a>
          </li>
          <li>
          <li>
            <a href="admin_info.jsp"><span class="fa fa-users"></span> Admin Manager</a>
          </li>
          <li>
            <a class="active"  href="user_info.jsp"><span class="fa fa-users"></span> User Manager</a>
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
   					<input class="btn btn-outline-primary" type=button onClick="location.href='user_info.jsp'" value='Back'>
		        </div>
	 <%@include file="db.jsp" %>
 <% 
 Connection connection = null;
 Statement statement = null;
 Statement statement1 = null;
 ResultSet resultSet = null;
 ResultSet resultSet1 = null;
 String dpid1=request.getParameter("dpid");
 System.out.println(dpid1);

 %>
 <%
 try{
 connection = DriverManager.getConnection(Url,Username,password);
 statement=connection.createStatement();
 statement1=connection.createStatement();
 String sql ="select dpid from dp_info";
 resultSet = statement.executeQuery(sql);
 ArrayList<String> idlist = new ArrayList<>();
 String sql1="select dpid from user where dpid='"+dpid1+"'";
 resultSet1 = statement1.executeQuery(sql1);
 if(resultSet1.next()){
 	 String str=resultSet1.getString("dpid");
  
 	 String[] words=str.split(",");//splits the string based on whitespace  
 	 List<String> itemList = new ArrayList<String>();
 	 for (String w : words) {
 	    itemList.add(w);
 	 }
 	  
 while(resultSet.next()){
 	 String id=resultSet.getString("dpid");
 	 idlist.add(id);
 	 //System.out.println("dpid list from dp_info"+idlist);
 	 System.out.println(idlist);
 }
 //Find the common elements 
 idlist.retainAll(itemList); 
%> 
      		<div class=" pull-right" style="margin-top:5px;">
   			<label>Search</label>
		          <input type='text' id='txt_searchall' placeholder='Search here...' >&nbsp; 
		          
		      </div>
      <div class="table" style="overflow:scroll; height: 350px;width:98%; margin-left: 10px; margin-top: 100px; ">
	  <table id="example"  class="display" style="table-layout: auto;width:100%;">
        <thead>
            <tr>
              <th>Name</th>
              <th>DPID</th>
              <th>DP_No</th>
              <th>Address</th>
              <th>Phase</th>  
             <th>Details</th>     
            </tr>
        </thead>
        <%for (String n : idlist) {
                    
        			Connection con=DriverManager.getConnection(Url,Username,password);
        			 PreparedStatement ps=con.prepareStatement("select * from dp_info where dpid="+(n));
                    ResultSet rs=ps.executeQuery();
                   while(rs.next()){
	     %>
         <tbody>
             
               <tr>
                  <td><%=rs.getString("name")%></td>
                  <td><%=rs.getString("dpid")%></td>
                  <td><%= rs.getString("dp_number") %></td>
                  <td><%= rs.getString("address") %></td>
                  <td><%= rs.getString("phase") %></td>
                  <td><a href="user_dpdetails.jsp?dpid=<%=rs.getString("dpid")%>">Details</a></td>
             </tr>
          
        </tbody>
        
 <%
    }
  }
}
connection.close();
} 
catch (Exception e) {
e.printStackTrace();
}
%>
        
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
 	<footer >
	   		<div class="footer-copyright" style="margin-top:-5%;width: 100%;">
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>    
    
    
    
  </body>
</html>
