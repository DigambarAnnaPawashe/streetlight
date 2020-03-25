<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	    
    <title></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="../css/main.css">

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
    
</head>
<body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="DashBoard.html">Aderate solution</a>
      <!-- Navbar Right Menu-->
    
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="images\profoundlogo.png" alt="User Image">
        <div>
          <p class="app-sidebar__user-name">Super Admin</p>
        </div>
      </div>
        <div class="vertical-menu">
      	
       <ul class="list-unstyled components mb-5">
          <li >
            <a  href="dashboard.jsp"><span class="fa fa-home"></span>DashBoard</a>
          </li>
          <li>
              <a class="active" href="dptable.jsp"><span class="fa fa-sliders"></span>DP List</a>
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

      </div>
    </aside>
    <main class="app-content">
      <div class="app-title">
       
      </div>       
         <%@include file="db.jsp" %>
 <%
   String name=request.getParameter("name");
   String dpid=request.getParameter("dpid");
   String dp_number=request.getParameter("dp_number");
   String address=request.getParameter("address");
   String phone=request.getParameter("phone");
   String aphone=request.getParameter("admin_phone");
   int phase=Integer.parseInt(request.getParameter("phase"));
   try
   {
	
	Connection conn = DriverManager.getConnection(Url,Username,password);
PreparedStatement ps=null;
   
    

    ps=conn.prepareStatement("select * from dp_info where dpid='" +dpid+ "' and phone='"+phone+"'");
          ResultSet rs = ps.executeQuery();
          if (rs.next()) {
        	  System.out.println("DP already Regitstered");
        	  request.setAttribute("alertMsg", "DP already exist");
            	RequestDispatcher rd=request.getRequestDispatcher("regdpsuperadmin.jsp");  
            	rd.include(request, response);
        
          } 
          else {
	Statement st=conn.createStatement();
    int i=st.executeUpdate("insert into dp_info(name,dpid, dp_number,address,phone,phase,admin_phone)values('"+name+"','"+dpid+"','"+dp_number+"','"+address+"','"+ phone+"','"+ phase+"','"+aphone+"')");
	if(i>0)
	{
	  RequestDispatcher rd=request.getRequestDispatcher("dptable.jsp");
	  rd.forward(request, response);
	}
	else
	{
		out.print("There is problem in adding record...");
	}
	if(phase==1){
	Statement st1=conn.createStatement();
    int j=st1.executeUpdate("insert into onephase(dpid,r,r_voltage,r_current,onoff,on_time,off_time,on_time2,off_time2)values('"+dpid+"',null,null,null,null,null,null,null,null)");
	if(j>0)
	{
	  System.out.println("Record save into onephase");
	  
	}
	else
	{
		out.print("There is problem in adding record ...ONEPHASE");
	}
	}
   
   if(phase==2){
		Statement st2=conn.createStatement();
	    int j=st2.executeUpdate("insert into twophase(dpid,r,r_voltage,r_current,y,y_voltage,y_current,r_onoff,y_onoff,on_time,off_time,on_time2,off_time2)values('"+dpid+"',null,null,null,null,null,null,null,null,null,null,null,null)");
		if(j>0)
		{
		  System.out.println("Record save into Twophase");
		  
		}
		else
		{
			out.print("There is problem in adding record ...ONEPHASE");
		}
		}
   if(phase==3){
		Statement st3=conn.createStatement();
	    int j=st3.executeUpdate("insert into threephase(dpid,r,r_voltage,r_current,y,y_voltage,y_current,b,b_voltage,b_current,r_onoff,y_onoff,b_onoff,on_time,off_time,on_time2,off_time2)values('"+dpid+"',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)");
		if(j>0)
		{
		  System.out.println("Record save into Threephase");
		  
		}
		else
		{
			out.print("There is problem in adding record ...ONEPHASE");
		}
		}
          }
	   }
   catch(Exception e)
   {
	System.out.print(e);
	e.printStackTrace();
   }
%>
<br><br>
</main>
    
    
    <!-- Essential javascripts for application to work-->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="/resources/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="/resources/js/plugins/chart.js"></script>
    <script type="text/javascript">
      var data = {
      	labels: ["January", "February", "March", "April", "May"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [65, 59, 80, 81, 56]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86]
      		}
      	]
      };
      var pdata = [
      	{
      		value: 300,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "Complete"
      	},
      	{
      		value: 50,
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "In-Progress"
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>
