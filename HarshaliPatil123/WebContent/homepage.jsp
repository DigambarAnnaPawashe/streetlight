<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>AdminLogin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link href="css/home.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
      <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

   	
 </head>

<body>

<%
if(session.getAttribute("wrong_uname_pass") != null)
{
%>
   <script>
    alert("wrong user name or password");
  </script>
<%
   session.removeAttribute("wrong_uname_pass");
}
if(session.getAttribute("This_user_is_blocked") != null){
%>
	<script>
	alert("This user is blocked");
	</script>
<%
session.removeAttribute("This_user_is_blocked");
}
%>
    <div class="container" >
        <div class="row">
			<div class="col-md-5 mx-auto">
			<div id="first">
				<div class="myform form ">
					 <div class="logo mb-3">
						 <div class="col-md-12 text-center">
							<h1>User-Login</h1>
						 </div>
					</div>
                   <form action="user/userlogin.jsp" method="post" name="login">
                           <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="uemail"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="psw" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                          <!--  <div class="form-group">
                              <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                           </div> -->
                           <div class="col-md-12 text-center ">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                           </div>
                           <!-- <div class="col-md-12 ">
                              <div class="login-or">
                                 <hr class="hr-or">
                                 <span class="span-or">or</span>
                              </div>
                           </div>
                           <div class="col-md-12 mb-3">
                              <p class="text-center">
                                 <a href="javascript:void();" class="google btn mybtn"><i class="fa fa-google-plus">
                                 </i> Signup using Google
                                 </a>
                              </p>
                           </div> -->
                           <br>
                           <div class="form-group">
                              <p class="text-center"> <a href="#" id="signup">Admin</a></p>
                           </div>
                        </form>
                 
				</div>
			</div>
			  <div id="second">
			      <div class="myform form ">
                        <div class="logo mb-3">
                           <div class="col-md-12 text-center">
                              <h1 >Admin-Login</h1>
                           </div>
                        </div>
                        <form action="admin/admin_login.jsp" name="registration">
                           <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="admin_email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="admin_password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
                           <!-- <div class="form-group">
                              <label for="exampleInputEmail1">Email address</label>
                              <input type="email" name="email"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                           </div>
                           <div class="form-group">
                              <label for="exampleInputEmail1">Password</label>
                              <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                           </div>
 -->                           <div class="col-md-12 text-center mb-3">
                              <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                           </div>
                           
                           
                           <div class="col-md-12 ">
                              <div class="form-group">
                                 <p class="text-center"><a href="#" id="signin">User</a></p>
                              </div>
                           </div>
                              </form>
                            </div>
                     
                     </div>
			</div>
		</div>
      </div>   
      <script type="text/javascript">
      $("#signup").click(function() {
    	  $("#first").fadeOut("fast", function() {
    	  $("#second").fadeIn("fast");
    	  });
    	  });

    	  $("#signin").click(function() {
    	  $("#second").fadeOut("fast", function() {
    	  $("#first").fadeIn("fast");
    	  });
    	  });


    	    
    	           $(function() {
    	             $("form[name='login']").validate({
    	               rules: {
    	                 
    	            	   uemail: {
    	                   required: true,
    	                   email: true
    	                 },
    	                 psw: {
    	                   required: true,
    	                   
    	                 }
    	               },
    	                messages: {
    	                 email: "Please enter a valid email address",
    	                
    	                 password: {
    	                   required: "Please enter password",
    	                  
    	                 }
    	                 
    	               },
    	               submitHandler: function(form) {
    	                 form.submit();
    	               }
    	             });
    	           });
    	           


    	  $(function() {
    	    
    	    $("form[name='registration']").validate({
    	      rules: {
    	        firstname: "required",
    	        lastname: "required",
    	        admin_email: {
    	          required: true,
    	          email: true
    	        },
    	        admin_password: {
    	          required: true,
    	          minlength: 5
    	        }
    	      },
    	      
    	      messages: {
    	        firstname: "Please enter your firstname",
    	        lastname: "Please enter your lastname",
    	        password: {
    	          required: "Please provide a password",
    	          minlength: "Your password must be at least 5 characters long"
    	        },
    	        email: "Please enter a valid email address"
    	      },
    	    
    	      submitHandler: function(form) {
    	        form.submit();
    	      }
    	    });
    	  });

      
      </script>   
</body>
</html>