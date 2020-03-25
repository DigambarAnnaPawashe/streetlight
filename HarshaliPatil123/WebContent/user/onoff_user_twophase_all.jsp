<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  	<title>User twophase all onoff</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/style2.css">
		
  </head>
<body>
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active" >
				<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" >Aderate Solution</a>
 <%
    Connection con1=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
    String admin_phone=request.getParameter("admin_phone");
  %>
  <%@include file="db.jsp" %>
  <% 
   try
   {
   
     con1=DriverManager.getConnection(Url,Username,password);
     ps1=con1.prepareStatement("select * from user");
     
    String sql = "Select * from user Where admin_phone=" + admin_phone;
      rs1 = ps1.executeQuery(sql);
      if(rs1.next())
      {
        
   %>
      	
      <ul class="list-unstyled components mb-5">
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
  %> 
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
     <div>
     <%
String id = request.getParameter("dpid");
String data=request.getParameter("data"); 
String data1=request.getParameter("data1"); 


Connection connection = null;
PreparedStatement ps=null;

try
{ 
connection = DriverManager.getConnection(Url,Username,password);
String sql="Update twophase set r_onoff=?,y_onoff=? where dpid="+id;
ps = connection.prepareStatement(sql);
ps.setString(1,data);
ps.setString(2,data1);

int i = ps.executeUpdate();

if(i > 0)
{
	RequestDispatcher rd=request.getRequestDispatcher("onoffdetail_user.jsp?dpid="+id);
	rd.forward(request,response);
}	  
else
{
	out.print("record not updated");
}  


}
catch (Exception e) {
				
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
 	<footer class="footer" >
	   		<div class="footer-copyright" style="width: 100%;">
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>   
  </body>
</html>
