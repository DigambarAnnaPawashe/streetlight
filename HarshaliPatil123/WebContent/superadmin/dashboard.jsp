<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
   <%@ page import="java.sql.*" %>
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
	<style>
	progress:before{
	content: 'valu' attr(value);
	position: relative;
	top: 5px;
	
	
	}
	</style>	
  </head>
  <body>
		
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
					<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
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

        <!-- Page Content  -->
      <div id="content" >

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            
           
          </div>
        </nav>
      
      <%@include file="sessioncache.jsp" %>
     <%@include file="db.jsp" %>
<%

Connection connection = null;

Statement statement1 = null;ResultSet resultSet1 = null;
Statement statement2=null;ResultSet resultSet2=null;
Statement statement2_1=null;ResultSet resultSet2_1=null;
Statement statement2_2=null;ResultSet resultSet2_2=null;
Statement statement4=null;ResultSet resultSet4=null;
Statement statement5=null;ResultSet resultSet5=null;
Statement statement6=null;ResultSet resultSet6=null;
Statement statement7=null;ResultSet resultSet7=null;
Statement statement8=null;ResultSet resultSet8=null;
Statement statement9=null;ResultSet resultSet9=null;
Statement statement10=null;ResultSet resultSet10=null;
Statement statement11=null;ResultSet resultSet11=null;
Statement statement12=null;ResultSet resultSet12=null;
Statement statement13=null;ResultSet resultSet13=null;
Statement statement14=null;ResultSet resultSet14=null;
Statement statement15=null;ResultSet resultSet15=null;
Statement statement16=null;ResultSet resultSet16=null;
Statement statement17=null;ResultSet resultSet17=null;
Statement statement18=null;ResultSet resultSet18=null;
Statement statement19=null;ResultSet resultSet19=null;

%>
<%
try
{
    connection = DriverManager.getConnection(Url,Username,password);
    statement1=connection.createStatement();
    statement2=connection.createStatement();
    statement2_1=connection.createStatement();
    statement2_2=connection.createStatement();

    statement4=connection.createStatement();
    statement5=connection.createStatement();
    statement6=connection.createStatement();
    statement7=connection.createStatement();
    statement8=connection.createStatement();
    statement9=connection.createStatement();
    statement10=connection.createStatement();
    statement11=connection.createStatement();
    statement12=connection.createStatement();
    statement13=connection.createStatement();
    statement14=connection.createStatement();
    statement15=connection.createStatement();
    statement16=connection.createStatement();
    statement17=connection.createStatement();
    statement18=connection.createStatement();
    statement19=connection.createStatement();

    
    String sql1 ="SELECT COUNT(dpid)FROM dp_info" ;
    resultSet1 = statement1.executeQuery(sql1);
    ResultSetMetaData rsmd1 = resultSet1.getMetaData();
    
    String sql2="SELECT COUNT(dpid) FROM onephase WHERE r_voltage>100";
    String sql2_1="SELECT COUNT(dpid) FROM twophase WHERE r_voltage>100 OR y_voltage>100";
    String sql2_2="SELECT COUNT(dpid) FROM threephase WHERE r_voltage>100 OR y_voltage>100 OR b_voltage>100";
    resultSet2=statement2.executeQuery(sql2);
    resultSet2_1=statement2_1.executeQuery(sql2_1);
    resultSet2_2=statement2_2.executeQuery(sql2_2);

   ResultSetMetaData rsmd2 = resultSet2.getMetaData();
   ResultSetMetaData rsmd2_1 = resultSet2_1.getMetaData();
   ResultSetMetaData rsmd2_2 = resultSet2_2.getMetaData();

   
   String sql4="SELECT COUNT(id)FROM admin";
   resultSet4=statement4.executeQuery(sql4);
   ResultSetMetaData rsmd4 = resultSet4.getMetaData();

   String sql5="SELECT COUNT(id)FROM user";
   resultSet5=statement5.executeQuery(sql5);
   ResultSetMetaData rsmd5 = resultSet5.getMetaData();
   
   String sql6="SELECT COUNT(r_voltage)FROM onephase where r_voltage<100";
   resultSet6=statement6.executeQuery(sql6);
   ResultSetMetaData rsmd6 = resultSet6.getMetaData();
   
   String sql7="SELECT COUNT(r_voltage)FROM twophase where r_voltage>100";
   resultSet7=statement7.executeQuery(sql7);
   ResultSetMetaData rsmd7 = resultSet7.getMetaData();
   
   String sql8="SELECT COUNT(r_voltage)FROM twophase where r_voltage<100";
   resultSet8=statement8.executeQuery(sql8);
   ResultSetMetaData rsmd8 = resultSet8.getMetaData();
   
   String sql9="SELECT COUNT(y_voltage)FROM twophase where y_voltage>100";
   resultSet9=statement9.executeQuery(sql9);
   ResultSetMetaData rsmd9 = resultSet9.getMetaData();
   
   String sql10="SELECT COUNT(y_voltage)FROM twophase where y_voltage<100";
   resultSet10=statement10.executeQuery(sql10);
   ResultSetMetaData rsmd10 = resultSet10.getMetaData();
   
   String sql11="SELECT COUNT(r_voltage)FROM threephase where r_voltage>100";
   resultSet11=statement11.executeQuery(sql11);
   ResultSetMetaData rsmd11 = resultSet11.getMetaData();
   
   String sql12="SELECT COUNT(r_voltage)FROM threephase where r_voltage<100";
   resultSet12=statement12.executeQuery(sql12);
   ResultSetMetaData rsmd12 = resultSet12.getMetaData();
   
   String sql13="SELECT COUNT(y_voltage)FROM threephase where y_voltage>100";
   resultSet13=statement13.executeQuery(sql13);
   ResultSetMetaData rsmd13 = resultSet13.getMetaData();
   
   String sql14="SELECT COUNT(y_voltage)FROM threephase where y_voltage<100";
   resultSet14=statement14.executeQuery(sql14);
   ResultSetMetaData rsmd14 = resultSet14.getMetaData();
   
   String sql15="SELECT COUNT(b_voltage)FROM threephase where b_voltage>100";
   resultSet15=statement15.executeQuery(sql15);
   ResultSetMetaData rsmd15 = resultSet15.getMetaData();
   
   String sql16="SELECT COUNT(b_voltage)FROM threephase where b_voltage<100";
   resultSet16=statement16.executeQuery(sql16);
   ResultSetMetaData rsmd16 = resultSet16.getMetaData();
   
   String sql17="SELECT COUNT(dpid) FROM onephase";
   resultSet17=statement17.executeQuery(sql17);
   ResultSetMetaData rsmd17 = resultSet17.getMetaData();
   
   String sql18="SELECT COUNT(dpid) FROM twophase";
   resultSet18=statement18.executeQuery(sql18);
   ResultSetMetaData rsmd18 = resultSet18.getMetaData();
 
   String sql19="SELECT COUNT(dpid) FROM threephase";
   resultSet19=statement19.executeQuery(sql19);
   ResultSetMetaData rsmd19 = resultSet19.getMetaData();
 
 
   int columnsNumber1 = rsmd1.getColumnCount();
   int columnsNumber2 = rsmd2.getColumnCount();
   int columnsNumber2_1 = rsmd2_1.getColumnCount();
   int columnsNumber2_2 = rsmd2_2.getColumnCount();

   int columnsNumber4 = rsmd4.getColumnCount();
   int columnsNumber5 = rsmd5.getColumnCount();
   int columnsNumber6 = rsmd6.getColumnCount();
   int columnsNumber7 = rsmd7.getColumnCount();
   int columnsNumber8 = rsmd8.getColumnCount();
   int columnsNumber9 = rsmd9.getColumnCount();
   int columnsNumber10 = rsmd10.getColumnCount();
   int columnsNumber11 = rsmd11.getColumnCount();
   int columnsNumber12 = rsmd12.getColumnCount();
   int columnsNumber13= rsmd13.getColumnCount();
   int columnsNumber14 = rsmd14.getColumnCount();
   int columnsNumber15 = rsmd15.getColumnCount();
   int columnsNumber16 = rsmd16.getColumnCount();
   int columnsNumber17 = rsmd17.getColumnCount();
   int columnsNumber18 = rsmd18.getColumnCount();
   int columnsNumber19 = rsmd19.getColumnCount();


%>  
    <%!String check=null,count1=null, count2=null,count3=null; %>
    <%!int var1,var2,var3,var4,sum,sub; %>   
   <div class="bg-style">
<!--   <h1 class="p-3">Canvas circular progressbar </h1>
 -->  <div class="wrapper">
    <div class="row pt-5 pb-5">
  
   <%
   while(resultSet1.next())
   {
    for (int i = 1; i <= columnsNumber1; i++) 
	{
      System.out.println("total DP="+resultSet1.getString(i));
      check=resultSet1.getString(i);
      var4=Integer.parseInt(check);
	}
   } 
   %>
      <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=var4%>" data-cp-color="#00bfeb">
        </div>
        <h4>Total DP</h4>
     </div>
  
 
   <%
  
  while(resultSet2.next())
   {
    for (int i = 1; i <= columnsNumber2; i++) 
	{
      System.out.println("total ON DP(onephase)::"+resultSet2.getString(i));
     count1=resultSet2.getString(i);
       var1=Integer.parseInt(count1);
     }  
   }
  while(resultSet2_1.next())
  {
   for (int i = 1; i <= columnsNumber2_1; i++) 
	{
     System.out.println("total ON DP(twophase)::"+resultSet2_1.getString(i));
     count2=resultSet2_1.getString(i);
      var2=Integer.parseInt(count2);
    }  
  }

  while(resultSet2_2.next())
  {
   for (int i = 1; i <= columnsNumber2_2; i++) 
	{
     System.out.println("total ON DP(threephase)::"+resultSet2_2.getString(i));
     count3=resultSet2_2.getString(i);
      var3=Integer.parseInt(count3);
   
     } 
  }
sum=var1+var2+var3;
System.out.println("sum is::"+sum);
   
  %>  
     
    <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=sum%>" data-cp-color="#EA4C89"></div>
        <h4>Total On DP</h4>
     </div>
 <%
 sub=var4-sum;
 System.out.println("Total no. of OFF dp::"+sub);
 %>  
 
    <div class="col-6 col-sm-3">
      <div class="counter" data-cp-percentage="<%=sub%>" data-cp-color="#FF675B"></div>
      <h4>Total Off DP</h4>
    </div>
  
  <%
   while(resultSet4.next())
   {
    for (int i = 1; i <= columnsNumber4; i++) 
	{
      System.out.println("total Admin="+resultSet4.getString(i));
      
   %>
     <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=resultSet4.getString(i) %>" data-cp-color="#FF9900"></div>
        <h4>Total Admins</h4>
    </div>
    <%
	}
   } 	 
  %>
  <%
   while(resultSet5.next())
   {
    for (int i = 1; i <= columnsNumber5; i++) 
	{
      System.out.println("total Users="+resultSet5.getString(i));
   %>
      <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=resultSet5.getString(i) %>" data-cp-color="#0008ff"></div>
        <h4>Total Users</h4>
    </div>
    <%
      }
   }  
  %>
   
<%!String check6=null,check7=null,check8=null,check9=null,check10=null,check11=null,
   check12=null,check13=null,check14=null,check15=null,check16=null,check17=null,check18=null,check19=null; %>
<%!int var6,var7,var8,var9,var10,var11,var12,var13,var14,var15,var16,var17,var18,var19; %>
<%
while(resultSet6.next())
{
 for (int j = 1; j<= columnsNumber6; j++) 
	{
    check6=resultSet6.getString(j);
    var6=Integer.parseInt(check6);
    System.out.println("off dp onephase:::"+var6);
  }  
}

while(resultSet7.next())
{
 for (int j = 1; j<= columnsNumber7; j++) 
	{
    check7=resultSet7.getString(j);
    var7=Integer.parseInt(check7);
    System.out.println("ON dp twophase(R):::"+var7);
  }  
}
while(resultSet8.next())
{
 for (int j = 1; j<= columnsNumber8; j++) 
	{
    check8=resultSet8.getString(j);
    var8=Integer.parseInt(check8);
    System.out.println("Off dp twophase(R):::"+var8);
  }  
}
while(resultSet9.next())
{
 for (int j = 1; j<= columnsNumber9; j++) 
	{
    check9=resultSet9.getString(j);
    var9=Integer.parseInt(check9);
    System.out.println("ON dp twophase(Y):::"+var9);
  }  
}
while(resultSet10.next())
{
 for (int j = 1; j<= columnsNumber10; j++) 
	{
    check10=resultSet10.getString(j);
    var10=Integer.parseInt(check10);
    System.out.println("Off dp twophase(Y):::"+var10);
  }  
}
while(resultSet11.next())
{
 for (int j = 1; j<= columnsNumber11; j++) 
	{
    check11=resultSet11.getString(j);
    var11=Integer.parseInt(check11);
    System.out.println("ON dp Threephase(R):::"+var11);
  }  
}
while(resultSet12.next())
{
 for (int j = 1; j<= columnsNumber12; j++) 
	{
    check12=resultSet12.getString(j);
    var12=Integer.parseInt(check12);
    System.out.println("Off dp threephase(R):::"+var12);
  }  
}
while(resultSet13.next())
{
 for (int j = 1; j<= columnsNumber13; j++) 
	{
    check13=resultSet13.getString(j);
    var13=Integer.parseInt(check13);
    System.out.println("ON dp Threephase(Y):::"+var13);
  }  
}
while(resultSet14.next())
{
 for (int j = 1; j<= columnsNumber14; j++) 
	{
    check14=resultSet14.getString(j);
    var14=Integer.parseInt(check14);
    System.out.println("Off dp threephase(Y):::"+var14);
  }  
}
while(resultSet15.next())
{
 for (int j = 1; j<= columnsNumber15; j++) 
	{
    check15=resultSet15.getString(j);
    var15=Integer.parseInt(check15);
    System.out.println("ON dp Threephase(B):::"+var15);
  }  
}
while(resultSet16.next())
{
 for (int j = 1; j<= columnsNumber16; j++) 
	{
  check16=resultSet16.getString(j);
    var16=Integer.parseInt(check16);
    System.out.println("Off dp threephase(B):::"+var16);
  }  
}
while(resultSet17.next())
{
 for (int j = 1; j<= columnsNumber17; j++) 
	{
    check17=resultSet17.getString(j);
    var17=Integer.parseInt(check17);
    System.out.println("Total DP(onephase):::"+var17);
  }  
}
while(resultSet18.next())
{
 for (int j = 1; j<= columnsNumber18; j++) 
	{
    check18=resultSet18.getString(j);
    var18=Integer.parseInt(check18);
    System.out.println("Total DP(twophase):::"+var18);
  }  
}
while(resultSet19.next())
{
 for (int j = 1; j<= columnsNumber19; j++) 
	{
    check19=resultSet19.getString(j);
    var19=Integer.parseInt(check19);
    System.out.println("Total DP(threephase):::"+var19);
  }  
}

%> 

<div class="col-sm my" >
<b>
<br><label id="font">ONE PHASE</label><br>
     <label>ON(R)::<%=var1%></label>
     
     <progress  id="on" value="<%=var1%>" max="<%=var17%>" ></progress>

    <label>OFF(R)::<%=var6%></label>
     <progress id="off" value="<%=var6 %>" max="<%=var17%>"></progress> 
     </b>
    </div>
    
    <div class="my1 mt-5">
    <b>
    <br><label id="font">TWO PHASE</label><br>
     <label>ON(R)::<%=var7%></label>
     <progress id="on"  value="<%=var7%>" max="<%=var18%>" ></progress> 
        
     <label>OFF(R)::<%=var8%></label>
     <progress id="off" value="<%=var8%>" max="<%=var18%>"></progress> 
     <br>
      <label>ON(Y)::<%=var9%></label>
      <progress id="on" value="<%=var9%>" max="<%=var18%>"></progress> 
      
      <label>OFF(Y)::<%=var10%></label>
       <progress  id="off" value="<%=var10%>" max="<%=var18%>" ></progress> 
 </b>    
    </div>
    
    <div class="my2 mt-5">
    <b>
    <br><label id="font">THREE PHASE</label><br>
      <label>ON(R)::<%=var11%></label>
      <progress id="on" value="<%=var11%>" max="<%=var19%>" > </progress> 
          
      <label>OFF(R)::<%=var12%></label>
      <progress  id="off" value="<%=var12%>" max="<%=var19%>"></progress>
       <br>
      <label>ON(Y)::<%=var13%></label>
     <progress id="on" value="<%=var13%>"max="<%=var19%>"></progress> 
     
      <label>OFF(Y)::<%=var14%></label>
     <progress  id="off" value="<%=var14%>" max="<%=var19%>"></progress>
     <br>
      <label>ON(B)::<%=var15%></label>
     <progress id="on" value="<%=var15%>" max="<%=var19%>">  </progress> 
        
      <label>ON(B)::<%=var16%></label>
      <progress  id="off" value="<%=var16%>" max="<%=var19%>">  </progress>
    </b>   
    </div>
    
      
    </div>
  </div>
 
</div>
<p class="p-3">
</p>
  <%
  connection.close();
}
catch (Exception e)
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