<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
  <%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADD User Record</title>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
    <link rel="stylesheet" href="../css/jquery.multiselect.css">
</head>
<body >
<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
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
            <a class="active" href="admin_user_info1.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-users"></span> User Manager</a>
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
    	
    	<div id="content" >

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            
           
          </div>
        </nav>
        
        
           <div class="my" >
            
          <form  name="form1" action="user_registration_two_admin.jsp" method="post" onsubmit="return validation()">
          
              		<div class="form-group">
                    <label for="exampleInputPassword1">Name::</label>
                    <input class="form-control" id="u_name" name="user_name" type="text" required/>
               		</div>
               		
               		<div class="form-group">
                    <label for="exampleInputPassword1">Email::</label>
                    <input class="form-control" id="e_mail" name="user_email" type="text" onkeyup="checkExist5()" required/>
                 	<span id=isE4></span>
                 	</div>
                 	
                 	<div class="form-group"> 
                    <label for="exampleInputPassword1">Mobile::</label>
                    <input class="form-control" id="p_phone" name="user_phone" type="text"  onkeyup="checkExist4()" required/>
            		 <span id=isE3></span>
            		</div>
            		
            		<input class="form-control" id="p_phone" name="admin_phone" type="hidden" value="<%=request.getParameter("admin_phone")%>" required/>
               		
               		<div class="form-group">
		           	<label for="exampleInputPassword1">Password::</label>
		            <input class="form-control" id="p_assword" name="user_password" type="password" required/>
		       		</div>
		       		
		        	<div class="form-group">
		            <label for="exampleInputPassword1"> Confirm Password::</label>
		            <input class="form-control" id="c_password" name="user_password" type="password" required/>
		            
		            
		            <input type="checkbox" onclick="myFunction()"><b>Show Password</b>
		            </div>
		           <%@include file="db.jsp" %> 
		            
<%
ResultSet rs=null;
   try{
	  
			Connection con=DriverManager.getConnection(Url,Username,password);
			
			PreparedStatement ps=con.prepareStatement("select dpid from dp_info");
			 rs=ps.executeQuery();
%>

<select  name="langOpt2[]" multiple id="langOpt2">
<% while(rs.next())
{
%>
<option   value="<%=rs.getString("dpid")%>"><%=rs.getString("dpid") %></option>
<% 
}
%>
</select>

<script src="../js/jquery.min.js"></script>
<script src="../js/jquery.multiselect.js"></script>
<script>


$('#langOpt2').multiselect({
    columns: 1,
    placeholder: 'Select DPID',
    search: true
});

</script>

<%
       }
       catch(Exception e)
       {
            out.println("wrong entry"+e);
       }
%> 
		       <button class="btn btn-primary" type="button" onclick = "functionAlert();" style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Register</button>
				   <div id = "confirm">
			         <div class = "message">Do you Want To Register</div>
			         <button type="submit"  class = "yes">OK</button>
			         <button type="button" class="yes"  style="background: red">Cancel</button>
			       </div>            
		  
   		</form>
     </div>
   </div>
</div>

    
    <% String message = (String)request.getAttribute("alertMsg");
       if(message !=null){
    %>
     
     <script type="text/javascript">
    var msg = "<%=message%>";
    alert(msg);
</script>
   <%} %>
   
    
     <script> 
        function InvalidMsg(textbox) { 
        	 var email= document.getElementById('e_mail').value;
        	 if((email.charAt(email.length-4)!='.') && (email.charAt(email.length-3)!='.')){
        		 email.setCustomValidity 
                      ('Entering an email-id is necessary!'); 
            } else if (email.validity.typeMismatch) { 
            	email.setCustomValidity 
                      ('Please enter an email address which is valid!'); 
            } else { 
            	email.setCustomValidity(''); 
            } 
  
            return true; 
        } 
    </script> 
    
     <script type="text/javascript">
 	 
   function validation(){
 		 var user= document.getElementById('u_name').value;
 		 var email= document.getElementById('e_mail').value;
 		 var phone= document.getElementById('p_hone').value;
 		 var pass= document.getElementById('p_assword').value;
 		 var cpass= document.getElementById('c_password').value;
 			 
 		 
 		/*  if(user ==""){
 			document.getElementById('name').innerHTML=" Name can not be empty";
 			return false;
 		 } */
 		 
 		 
 		
 		 
 		 if(!isNaN(user)){
 			document.getElementById('name').innerHTML="Only Alphabets allowed" ;
 			return false;
 		 }
 		 
 		/* if(email ==""){
	 			document.getElementById('Email').innerHTML="Email_ID can not be empty";
	 			return false;
				 } */
	 		if(email.indexOf('@')<= 0){
	 		document.getElementById('Email').innerHTML="Invalid Email-Id";
	 			return false;
	 		}
	 		
	 		if((email.charAt(email.length-4)!='.') && (email.charAt(email.length-3)!='.')){
	 		document.getElementById('Email').innerHTML="Invalid Email-Id";
			return false;
	 		}
	 		
	 		/* if(phone ==""){
	 	 			document.getElementById('number').innerHTML="Mobile Number can not be empty";
	 	 			return false;
	 	 			} */
	 			if(isNaN(phone)){
	 				document.getElementById('Phone').innerHTML="Only Number allowed";
	 	 			return false;
	 			}
	 			
	 			if(phone.length!=10){
	 				document.getElementById('Phone').innerHTML="Mobile Number must be 10 digit";
	 	 			return false;
	 			}
	 			
 		 
 			/* if(pass ==""){
 	 			document.getElementById('password').innerHTML="Password can not be empty";
 	 			return false;
 			 } */
 			
 			 if((pass.length <= 5) || (pass.length > 20))
 			 {
 			document.getElementById('Password').innerHTML="Password must be 5 to 20";
 			return false;
 			 }
 			 
 			 if(pass!=cpass){
 				document.getElementById('Password').innerHTML="Password are not match ";
 	 			return false;
 				 
 			 } 
 			 
 	 			if(cpass ==""){
 	 	 			document.getElementById('cpassword').innerHTML="Password can not be empty";
 	 	 			return false;
 	 			 }
 	 			
 	  }
 	 
 	function myFunction() {
 		  var x = document.getElementById("c_password");
 		  if (x.type === "password") {
 		    x.type = "text";
 		  } else {
 		    x.type = "password";
 		  }
 		}
 	  
 	 </script>
 	 
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
     <script src="../js/file.js"></script>
    <footer >
	   		<div class="footer-copyright" >
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>     
  </body>
</html>
