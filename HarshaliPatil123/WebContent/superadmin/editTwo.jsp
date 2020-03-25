<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Update Dp Recored</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/style2.css">
</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" class="active">
			<a href="index.html" class="logo">Aderate Solution</a>
			 <ul class="list-unstyled components mb-5">
          <li >
            <a class="active" href="dashboard.jsp"><span class="fa fa-home"></span>DashBoard</a>
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
            <a href="user_notification_info.jsp"><span class="fa fa-bell"></span> User Notifications</a>
          </li>
           <li>
            <a href="logout.jsp"><span class="fa fa-power-off"></span>Logout</a>
          </li>
        </ul>
   </nav>
		<div id="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="btn btn-primary">
						<i class="fa fa-bars"></i> <span class="sr-only">Toggle
							Menu</span>
					</button>


				</div>
			</nav>
  <%@include file="db.jsp" %>
			<%
				

				String name = request.getParameter("name");
				//String dpid = request.getParameter("dpid");
				String dpid1 = request.getParameter("dpid1");
				String dp_number = request.getParameter("dp_number");
				String address = request.getParameter("address");
				String phone = request.getParameter("phone");
				String phase = request.getParameter("phase");

				if (dpid1!= null) {
					Connection con = null;
					PreparedStatement ps = null;
					int personID = Integer.parseInt(dpid1);
					try {
						
						con = DriverManager.getConnection(Url,Username,password);
						String sql = "Update dp_info set name=?,dpid=?,dp_number=?,address=?,phone=?,phase=? where dpid="+personID ;
						ps = con.prepareStatement(sql);
						ps.setString(1, name);
						ps.setString(2,dpid1);
						ps.setString(3, dp_number);
						ps.setString(4, address);
						ps.setString(5, phone);
						ps.setString(6, phase);
						
						int i = ps.executeUpdate();
						
						if (i > 0) {
							System.out.println(i);
							RequestDispatcher rd = request.getRequestDispatcher("dptable.jsp");
							rd.forward(request, response);
						} else {
							out.print("There is a problem in updating Record.");
						}
					} catch (SQLException sql) {
						request.setAttribute("error", sql);
						out.println(sql);
					}
				}
			%>
		</div>
	</div>

	<script src="../js/jquery.min.js"></script>
	<script src="../js/popper.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/main.js"></script>


</body>
</html>
