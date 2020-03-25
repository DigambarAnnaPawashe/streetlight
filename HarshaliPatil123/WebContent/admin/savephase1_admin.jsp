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
	    
    <title>Delete Dp Recored</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="../css/main.css">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
    
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
					<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
        <ul class="list-unstyled components mb-5">
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
      
<%@include file="db.jsp" %>
<%
String admin_phone=request.getParameter("admin_phone");
String ontime = request.getParameter("on_time");
String offtime=request.getParameter("off_time");
String dpid=request.getParameter("dpid");
System.out.println(ontime);
System.out.println(offtime);
System.out.println(admin_phone);

if(ontime!= null && offtime!=null)
{
Connection con = null;
PreparedStatement ps = null;

try
{

con = DriverManager.getConnection(Url,Username,password);
String sql="Update onephase set on_time=?,off_time=? where dpid="+dpid;
ps = con.prepareStatement(sql);
ps.setString(1,ontime);
ps.setString(2,offtime);

int i = ps.executeUpdate();
if(i > 0)
{
	RequestDispatcher rd=request.getRequestDispatcher("timeset_admin.jsp");
	rd.forward(request, response);
%>


<%
}
else
{
out.print("There is a problem in updating Record.");
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
