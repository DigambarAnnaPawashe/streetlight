<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
  	<title>SuperAdmin DashBoard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/style2.css">
		<link rel="stylesheet" href="../css/chart.css">
		
  </head>
<body>
<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
					<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>"app-header__logo" href="index.html">Aderate Solution</a>
    
    

      	
       <ul class="list-unstyled components mb-5">
      
       
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
        </nav> <%@include file="db.jsp" %>
      <%
      
        String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
      try{
		
         Connection con=DriverManager.getConnection(Url,Username,password);
         PreparedStatement ps=con.prepareStatement("select * from super_admin");
         
         
         if (email!= null) 
		 {
            String sql = "Select * from super_admin Where email='" + email + "' and password='" + pass + "'";
            ResultSet rs = ps.executeQuery(sql);
            
           if(rs.next())
           {
        	   request.getSession().setAttribute("email", request.getParameter("email"));
        	   String u = (String) request.getSession().getAttribute("email");
        	     if (u != null )
        	     {
        	         response.sendRedirect("dashboard.jsp");
        	     }
           }
           else{
          	   HttpSession sess = request.getSession();
          	   session.setAttribute("wrong_uname_pass", "1");
          	   response.sendRedirect("../superadmin.jsp");
          	 }
		 }  
         
      }	catch (Exception e) 
		{
			e.printStackTrace();
		}   
		 %>  
      </div>
      
</div>
    
      <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
     <script src="../js/chart.js"></script>
    <footer style="margin-top: 13px;">
	   		<div class="footer-copyright" style="margin-top:-5%;width: 100%;">
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>    
  </body>
</html>
