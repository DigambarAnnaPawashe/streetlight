<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.Base64"%>
<%@page import="javax.crypto.Cipher"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="javax.crypto.spec.SecretKeySpec"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Arrays" %>
<%@ page import="java.sql.*" 
         import="com.grocery.AES"
         import="com.grocery.Admin_RegisterController"
         %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Edit Admin Record</title>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style2.css">
</head>
<body>
	
    <div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<a href="index.html" class="logo"><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br> AdeRate Solution</a>
        <ul class="list-unstyled components mb-5">
          <li >
            <a  href="dashboard.jsp"><span class="fa fa-home"></span>DashBoard</a>
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
            <a class="active" href="user_info.jsp"><span class="fa fa-users"></span> User Manager</a>
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
   			    <input class="btn btn-outline-primary" type=button onClick="location.href='user_info.jsp'" value='Back'>
		   </div>
 <%@include file="db.jsp" %>
<%!
private static SecretKeySpec secretKey;
 private static byte[] key;

 public static void setKey(String myKey) 
{
    MessageDigest sha = null;
    try {
        key = myKey.getBytes("UTF-8");
        sha = MessageDigest.getInstance("SHA-1");
        key = sha.digest(key);
        key = Arrays.copyOf(key, 16); 
        secretKey = new SecretKeySpec(key, "AES");
    } 
    catch (NoSuchAlgorithmException e) {
        e.printStackTrace();
    } 
    catch (UnsupportedEncodingException e) {
        e.printStackTrace();
    }
}
%>
<%! 
 public static String encrypt(String strToEncrypt, String secret) 
{
    try
    {
        setKey(secret);
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes("UTF-8")));
    } 
    catch (Exception e) 
    {
        System.out.println("Error while encrypting: " + e.toString());
    }
    return null;
}
%>
<%! 
 public static String decrypt(String strToDecrypt, String secret) 
{
    try
    {
        setKey(secret);
        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
    } 
    catch (Exception e) 
    {
        System.out.println("Error while decrypting: " + e.toString());
    }
    return null;
}

%>
<%
String user_phone = request.getParameter("user_phone");


Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(Url,Username,password);
statement=connection.createStatement();
String sql ="select * from user where user_phone="+user_phone;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	String one=resultSet.getString("user_password");
	final String secretKey = "ssshhhhhhhhhhh!!!!";

	//String originalString = adminepassword;
	String encryptedString = one;
	String decryptedString = AES.decrypt(encryptedString, secretKey) ;
%>


	<div class="my" >
		<form  name="form1" action="user_edit_two.jsp" method="post" onsubmit="return validation()">
      
		   <div class="form-group">
		    <label for="exampleInputPassword1">Name::</label>
		     <input class="form-control" id="u_name" name="user_name" type="text" value="<%=resultSet.getString("user_name")%>" required/>
		   </div>
			
			<div class="form-group">
		    <label for="exampleInputPassword1">Email::</label>
		     <input class="form-control" id="e_mail" name="user_email" type="text" onkeyup="checkExist5()" value="<%=resultSet.getString("user_email")%>">
			 <span id=isE4></span>		   
		   </div>
			
			<div class="form-group">
		    <label for="exampleInputPassword1">Mobile::</label>
		     <input class="form-control" id="p_hone" name="user_phone" type="text" value="<%=resultSet.getString("user_phone")%>">
		   	<input type="hidden" name="user_phone1" placeholder="Phone"  id="adminphone" autocomplete="off" onkeyup="checkExist4()" value="<%=resultSet.getString("user_phone")%>">
		  	<span id=isE3></span>
		   </div>
		   
		   <div class="form-group">
		    <label for="exampleInputPassword1">Password::</label>
		     <input class="form-control" id="p_assword" name="user_password" type="text" value="<%=decryptedString%>">
		   </div>
		  
		   <div class="form-group">
		    <label for="exampleInputPassword1"> Previous DP ID::</label>
		     <input class="form-control" id="p_assword" name="dpid" type="text" value="<%=resultSet.getString("dpid")%>" disabled>
		   </div>
 <%
ResultSet rs=null;
   try{
	 
			Connection con=DriverManager.getConnection(Url,Username,password);
			
			PreparedStatement ps=con.prepareStatement("select dpid from dp_info");
			 rs=ps.executeQuery();
%>

<select  name="langOpt2[]" multiple id="langOpt2" >
<% while(rs.next())
{
%>
<option   value="<%=rs.getString("dpid")%>"><%=rs.getString("dpid") %></option>
<% 
}
%>
</select>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.multiselect.js"></script>
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
		   <button class="btn btn-primary" type="button" onclick = "functionAlert();" style="margin-left: 20%"><i class="fa fa-save"></i>Save</button>
				   <div id = "confirm">
			         <div class = "message">Do you Want To Save</div>
			         <button type="submit"  class = "yes">OK</button>
			         <button type="button" class="yes"  style="background: red">Cancel</button>
			       </div>

		  
    </form>
    
  
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
			
%>
       </div>
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
