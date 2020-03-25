<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>DP Details</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src=https://code.jquery.com/jquery-3.3.1.js></script> 
   

    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		
			<link rel="stylesheet" href="../css/style2.css">
	  
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
      	  <li>
              <a href="dptable_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-sliders"></span> DP List</a>
          </li>
           <li>
              <a  href="timeset_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-clock-o"></span> Time Manager</a>
          </li>
          <li>
          <li>
            <a href="admin_user_info1.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-users"></span> User Manager</a>
          </li>
          <li>
            <a href="onoff_admin.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><span class="fa fa-toggle-on"></span> ON/OFF</a>
          </li>
          <li>
            <a href="show_admin_notification.jsp?admin_phone=<%=request.getParameter("admin_phone")%>" ><span class="fa fa-bell"></span> Show Notifications</a>
          </li>
           <li>
            <a href="newadmin_notification_info.jsp?admin_phone=<%=request.getParameter("admin_phone") %>" ><span class="fa fa-bell"></span>Notifications</a>
          </li>
         
           <li>
            <a href="../homepage.jsp"><span class="fa fa-power-off"></span>Logout</a>
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
      
      		<div class="pull-right" style="margin-right: 20px; margin-top: 20px;">
             <br>
             Unit :
             <br>
             <button type="button" class="btn btn-success btn-rounded"></button> On
             <br>
            <button type="button" class="btn btn-danger btn-rounded"></button> Off
           </div>
           <%@include file="db.jsp" %>
             
<%
				String dpid = request.getParameter("dpid");
      
				
				
				
				
				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
				try
				{ 
				connection = DriverManager.getConnection(Url,Username,password);
				statement=connection.createStatement();
				String sql ="SELECT * FROM dp_info where dpid="+dpid;
				
				resultSet = statement.executeQuery(sql);
				while(resultSet.next())
				{
%>
				<div>
				<table id="t1"  cellpadding="2" cellspacing="7" width="50%" style="margin-left: 25%; margin-top: 15%;">
				
				<div id="t2">
				
				<tr>
				<td><b>Name</b></td>
				<td><%=resultSet.getString("name") %></td>
				</tr>
				
				<tr>
				<td><b>DP_NO</b></td>
				<td><%=resultSet.getString("dp_number") %></td>
				</tr>
				
				<tr>
				<td><b>DP_ID</b></td>
				<td><%=resultSet.getString("dpid") %></td>
				</tr>
				
				<tr>
				<td><b>Address</b></td>
				<td><%=resultSet.getString("address") %></td>
				</tr>
				
			
				</div>
				</table>
				</div>
				
				<%
				String phase=resultSet.getString("phase");
				int count=Integer.parseInt(phase);
				if(count==1)
				{%>
				
				
			    <table align="center" cellpadding="3" cellspacing="5" border="2">
			  
				 
				  <%
                      Statement statement1 = null;
                	  ResultSet resultSet1 =null;
                	  try
				      {
                       connection =DriverManager.getConnection(Url,Username,password);
					   statement1=connection.createStatement();
				       String sql1="SELECT r_voltage, r_current FROM onephase where dpid="+dpid;
					   resultSet1=statement1.executeQuery(sql1);
					   while(resultSet1.next())
					   {
				 %>
				 <tr>
				 <td colspan="3"><h2 align="center"><font><strong>R</strong></font></h2></td>
				 </tr>
				 
			     <tr>
			        <th>r_voltage</th>
				    <th><%=resultSet1.getString("r_voltage") %></th>
				    <th rowspan="2">
                     <%
                     int volt=resultSet1.getInt("r_voltage");
                     if(volt>100)
                     {
                     %><center><button type="button" class="btn btn-success btn-rounded"></button></center>
                     <%
                     }
                     else
                     {
                     %><center><button type="button" class="btn btn-danger btn-rounded"></button></center>
                    <%
                    }%>
				    </th>
				</tr>
				   
			    <tr>
				   <th>r_current</th>
				   <th><%=resultSet1.getString("r_current") %></th>
			   </tr>
			     <% 
			           }
			         }
			         catch (Exception e) 
                	  {
					    e.printStackTrace();
			          }
				 %>
			
		         </table>
		        
				<% 			
			    }
				if(count==2)
				{%>
			     <table align="center" cellpadding="5" cellspacing="5" border="1">
			     
			     
			      <%
                      Statement statement2 = null;
                	  ResultSet resultSet2=null;
                	  try
				      {
                       connection =DriverManager.getConnection(Url,Username,password);
					   statement2=connection.createStatement();
				       String sql2="SELECT r_voltage, r_current FROM twophase where dpid="+dpid;
					   resultSet2=statement2.executeQuery(sql2);
					   while(resultSet2.next())
					   {
				 %>
			      <tr>
				  <td colspan="3"><h2 align="center"><font><strong>R</strong></font></h2></td>
				  </tr>
			        <tr>
			        <th>r_voltage</th>
				    <th><%=resultSet2.getString("r_voltage") %></th>
				    <th rowspan="2">
				    <%
                     int volt=resultSet2.getInt("r_voltage");
                     if(volt>100)
                     {
                     %><center><button type="button" class="btn btn-success btn-rounded"></button></center>
                     <%
                     }
                     else
                     {
                     %><center><button type="button" class="btn btn-danger btn-rounded"></button></center>
                    <%
                    }%>
				    </th>
				   </tr>
				   <tr>
				   <th>r_current</th>
				   <th><%=resultSet2.getString("r_current") %></th>
				   </tr>
			     <% 
				        }
				     }
				     catch (Exception e) 
	                  {
					e.printStackTrace();
				      }
			%>
			<tr></tr>
				  
                 <%
                      Statement statement2_1 = null;
                	  ResultSet resultSet2_1 =null;
                	  try
				      {
                       connection =DriverManager.getConnection(Url,Username,password);
					   statement2_1=connection.createStatement();
				       String sql2_1="SELECT y_voltage, y_current FROM twophase where dpid="+dpid;
					   resultSet2_1=statement2_1.executeQuery(sql2_1);
					   while(resultSet2_1.next())
					   {
				 %>
			       <tr>
				  <td colspan="3"><h2 align="center"><font><strong>Y</strong></font></h2></td>
				  </tr>
			        <tr>
			        <th>y_voltage</th>
				    <th><%=resultSet2_1.getString("y_voltage") %></th>
				    <th rowspan="2">
				    <%
                     int volt=resultSet2_1.getInt("y_voltage");
                     if(volt>100)
                     {
                     %><center><button type="button" class="btn btn-success btn-rounded"></button></center>
                     <%
                     }
                     else
                     {
                     %><center><button type="button" class="btn btn-danger btn-rounded"></button></center>
                    <%
                    }%>
				    </th>
				   </tr>
				   <tr>
				   <th>y_current</th>
				   <th><%=resultSet2_1.getString("y_current") %></th>
				   </tr>
			     
			     <% 
				        }
				     }
				     catch (Exception e) 
	                  {
					e.printStackTrace();
				      }
			%>
			  
			 </table>	    
		    <% }
				if(count==3)
				{%>
			    <table align="center" cellpadding="5" cellspacing="5" border="1">
			   
				  <%
                      Statement statement3 = null;
                	  ResultSet resultSet3 =null;
                	  try
				      {
                       connection =DriverManager.getConnection(Url,Username,password);
					   statement3=connection.createStatement();
				       String sql3="SELECT r_voltage, r_current FROM threephase where dpid="+dpid;
					   resultSet3=statement3.executeQuery(sql3);
					   while(resultSet3.next())
					   {
				 %>
			        <tr>
				  <td colspan="3"><h2 align="center"><font><strong>R</strong></font></h2></td>
				  </tr>
			        <tr>
			        <th>r_voltage</th>
				    <th><%=resultSet3.getString("r_voltage") %></th>
				    <th rowspan="2">
				    <%
                     int volt=resultSet3.getInt("r_voltage");
                     if(volt>100)
                     {
                     %><center><button type="button" class="btn btn-success btn-rounded"></button></center>
                     <%
                     }
                     else
                     {
                     %><center><button type="button" class="btn btn-danger btn-rounded"></button></center>
                    <%
                    }%>
				    
				    </th>
				   </tr>
				   <tr>
				   <th>r_current</th>
				   <th><%=resultSet3.getString("r_current") %></th>
				   </tr>
			        
			     <% 
				        }
				     }
				     catch (Exception e) 
	                  {
					e.printStackTrace();
				      }
			%>
			 	
			    <tr>
				  
				  </tr>
				  
                 <%
                      Statement statement3_1 = null;
                	  ResultSet resultSet3_1 =null;
                	  try
				      {
                       connection =DriverManager.getConnection(Url,Username,password);
					   statement3_1=connection.createStatement();
				       String sql3_1="SELECT y_voltage, y_current FROM threephase where dpid="+dpid;
					   resultSet3_1=statement3_1.executeQuery(sql3_1);
					   while(resultSet3_1.next())
					   {
				 %>
			        <tr>
				  <td colspan="3"><h2 align="center"><font><strong>Y</strong></font></h2></td>
				  </tr>
			        <tr>
			        <th>y_voltage</th>
				    <th><%=resultSet3_1.getString("y_voltage") %></th>
				    <th rowspan="2">
				    <%
                     int volt=resultSet3_1.getInt("y_voltage");
                     if(volt>100)
                     {
                     %><center><button type="button" class="btn btn-success btn-rounded"></button></center>
                     <%
                     }
                     else
                     {
                     %><center><button type="button" class="btn btn-danger btn-rounded"></button></center>
                    <%
                    }%>
				    </th>
				   </tr>
				   <tr>
				   <th>y_current</th>
				   <th><%=resultSet3_1.getString("y_current") %></th>
				   </tr>
			     
			        
			     <% 
				        }
				     }
				     catch (Exception e) 
	                  {
					e.printStackTrace();
				      }
			%>
			  <tr>
		      </tr>
				  
                 <%
                      Statement statement3_2 = null;
                	  ResultSet resultSet3_2 =null;
                	  try
				      {
                       connection =DriverManager.getConnection(Url,Username,password);
					   statement3_2=connection.createStatement();
				       String sql3_2="SELECT b_voltage, b_current FROM threephase where dpid="+dpid;
					   resultSet3_2=statement3_2.executeQuery(sql3_2);
					   while(resultSet3_2.next())
					   {
				 %>
			        <tr>
				  <td colspan="3"><h2 align="center"><font><strong>B</strong></font></h2></td>
				  </tr>
			        <tr>
			        <th>b_voltage</th>
				    <th><%=resultSet3_2.getString("b_voltage") %></th>
				    <th rowspan="2">
				    <%
                     int volt=resultSet3_2.getInt("b_voltage");
                     if(volt>100)
                     {
                     %><center><button type="button" class="btn btn-success btn-rounded"></button></center>
                     <%
                     }
                     else
                     {
                     %><center><button type="button" class="btn btn-danger btn-rounded"></button></center>
                    <%
                    }%>
				 
				    </th>
				   </tr>
				   <tr>
				   <th>b_current</th>
				   <th><%=resultSet3_2.getString("b_current") %></th>
				   </tr>		     <% 
				        }
				     }
				     catch (Exception e) 
	                  {
					e.printStackTrace();
				      }
			%>
		
			  </table>		    
		 		    
		 	    
		    <% }
		  }
	    }
	    catch (Exception e) 
	     {
	      e.printStackTrace();
		  }
		 %>
				
 </div>            
       
</div>
  
   
    <script>
            
            function selectRow(){
        
                var radios = document.getElementsByName("select");
                for( var i = 0; i < radios.length; i++ )
                {
                    radios[i].onclick = function()
                    {
                        // remove class from the other rows
                        
                        var el = document.getElementById("first-tr");
                        
                        // go to the nex sibing
                        while(el = el.nextSibling)
                        {
                            if(el.tagName === "TR")
                            {
                                // remove the selected class
                                el.classList.remove("selected");
                            }
                        }
                        
                     // radio  -      td      -          tr 
                        this.parentElement.parentElement.classList.toggle("selected");
                    };
                }
        
            }
            selectRow();
        </script>
         <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <footer style="margin-top: -5%;" >
	   		<div class="footer-copyright" >
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>     
    
  </body>
</html>