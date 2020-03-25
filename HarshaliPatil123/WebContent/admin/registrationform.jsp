<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="db.jsp" %>

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add DP Recored</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
					<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
                <ul class="list-unstyled components mb-5">
      
     
          <li>
              <a class="active" href="dptable_admin.jsp?admin_phone=<%=request.getParameter("admin_phone")%>"><span class="fa fa-sliders"></span> DP List</a>
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
      
				<form name="form1" method="post" action="DataBaseConnection_admin.jsp">
				  <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">Name::</label>
                    <input class="form-control" name="name" type="text" required/>
                   </div>
             
                 <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">DP id::</label>
                    <input class="form-control" name="dpid" type="text" onkeyup="checkExist()">
                     <span id="isE"></span>
                  </div>
                  
                   <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">DP_Number::</label>
                    <input class="form-control" name="dp_number" type="text">
                  </div>
                  
                   <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">Address::</label>
                    <input class="form-control" name="address" type="text">
                  </div>
                  <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">Phone Number::</label>
                    <input class="form-control" name="phone" type="text" onkeyup="checkExist1()">
                    <span id="isEF"></span>
                  </div>
                  
                   <!-- <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall"> Admin Phone Number::</label> --> 
                    <input class="form-control" name="admin_phone" type="hidden" value="<%=request.getParameter("admin_phone")%>">
                   <!-- </div>  -->
                  
                  <div class="form-group">
                    <label class="col-form-label col-form-label-sm" for="inputSmall">Phase::</label>
                    <input class="form-control" name="phase" type="text">
                  </div>
                  
                  
              
            
       <button class="btn btn-primary" type="button" onclick = "functionAlert();" style="margin-left: 30%"><i class="fa fa-fw fa-lg fa-check-circle"></i>Add</button>
		   <div id = "confirm">
	         <div class = "message">Do you Want To Add?</div>
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
