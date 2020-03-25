<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ADD Admin Record</title>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>
<body >
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
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
            <a  class="active" href="admin_info.jsp"><span class="fa fa-users"></span> Admin Manager</a>
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
    	
    	<div id="content" >

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
          </div>
        </nav>
        
              <div class=" pull-right" style="margin-top:5px;">
   			     <input class="btn btn-outline-primary" type=button onClick="location.href='admin_info.jsp'" value='Back'>
		      </div>    
   
   <div class="my" >
				<form name="form1" method="post" action="DataBaseConnection.jsp">
						
				   <div class="form-group">
                    <label for="exampleInputPassword1">Name::</label>
                    <input type="text" class="form-control" name="name"  required/>
                   </div>
             
                 <div class="form-group">
                    <label for="exampleInputPassword1">DP id::</label>
                    <input type="text" class="form-control" onkeyup="checkExist()" name="dpid">
                    <span id=isE></span>
                  </div>
                  
                   <div class="form-group">
                    <label for="exampleInputPassword1">DP_Number::</label>
                    <input  type="text" class="form-control" name="dp_number">
                  </div>
                  
                   <div class="form-group">
                    <label for="exampleInputPassword1">Address::</label>
                    <input type="text" class="form-control" name="address" >
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Phone Number::</label>
                    <input  type="text" class="form-control" onkeyup="checkExist1()" name="phone">
                    <span id=isEF></span>
                  </div>
                  
                   
                    <input class="form-control" name="admin_phone" type="hidden" value="<%=request.getParameter("admin_phone")%>">
                 
                  
               <div class="form-group">
                    <label for="exampleInputPassword1">Phase::</label>
                    <input type="text" class="form-control" name="phase" >
                  </div>
                  
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

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <script type="text/javascript">
      
    $(document).ready(function () {
    	
    	$(function () {
			$("form[name='form1']").validate({
				rules:{
					
					s_firstname:"required",
					s_middlename:"required",
					s_lastname:"required",
					s_dob:"required",
					s_gender:"required",
					s_passyear:"required",
					s_branch:"required",
					s_degree:"required",
					s_collegename:"required",
					
					s_degreepercentage:{
						required:true,
						maxlength:6
					},
					s_sscpassyear:"required",
					
					s_sscpercentage:{
						required:true,
						maxlength:6
					},
					
					s_address:{
						required:true,
						minlength:10
					},				
					s_nativecity:"required",
					
					s_email:{
						required:true,
						email:true
					},					
					s_mobile:{
						required:true,
						maxlength:10
					},
					s_coursename:"required",
					s_coursetype:"required",
					s_joindate:"required",
										
					s_fees:{
						required:true,
						maxlength:10
					},
					
					s_govtidno:{
						required:true,
						maxlength:40
					}			
					
				},			
				submitHandler:function(form){
				form.submit();
		}
    	});
    });
});
</script>
  <% String message = (String)request.getAttribute("alertMsg");
       if(message !=null){
    %>
     
     <script type="text/javascript">
    var msg = "<%=message%>";
    alert(msg);
</script>
   <%} %>  

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
