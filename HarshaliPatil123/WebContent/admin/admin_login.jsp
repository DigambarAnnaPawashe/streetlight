<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" 
    import="java.util.ArrayList"
    import="java.util.List" 
 %>
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
  	<title>Admin DashBoard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/style2.css">
		
  </head>


<body>

    <div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<a href="index.html" class="logo" ><img src="images/logo.jpg" style="width: 25px;height: 25px;" >Aderate Solution</a>
    
   </nav>
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
  Connection con=null;
  PreparedStatement ps=null;
  ResultSet rs=null;
  
  String amailid=request.getParameter("admin_email");
  String apassword=request.getParameter("admin_password");
  
%>
<% 
  try
  {
    
    con=DriverManager.getConnection(Url,Username,password);
    ps=con.prepareStatement("select * from admin");
    final String secretKey = "ssshhhhhhhhhhh!!!!";
    String originalString = apassword;
    String encryptedString = AES.encrypt(originalString, secretKey) ;
    String decryptedString = AES.decrypt(encryptedString, secretKey) ;
    if (amailid!= null && encryptedString!=null) 
    {
     String sql = "Select * from admin Where admin_email='" + amailid + "' and admin_password='" + encryptedString + "'";
     rs = ps.executeQuery(sql);
     if(rs.next())
     {
    	 String status=rs.getString("status");
    	 System.out.println(status);
    	 String check="active";
    	 if(check.equals(status))
    	 {		 
    		
    		 RequestDispatcher rd=request.getRequestDispatcher("dashboard_admin.jsp");
    		 rd.forward(request, response);
         }
    	 else
    	 {
    	     HttpSession sess = request.getSession();
    	     session.setAttribute("This_user_is_blocked", "1");
    	     response.sendRedirect("../homepage.jsp");
    	 }
     }
     else{
    	   HttpSession sess = request.getSession();
    	   session.setAttribute("wrong_uname_pass", "1");
    	   response.sendRedirect("../homepage.jsp");
    	 }
     }
   
  }
  catch (Exception e) 
  {
   e.printStackTrace();
  }
%>
</div>
    
    <script src="../js/jquery.min.js"></script>
    <script src="../js/popper.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
    <footer style="margin-top: 13px;">
	   		<div class="footer-copyright" style="margin-top:-5%;width: 100%;">
	        <p class="footer-company">All Rights Reserved. &copy; 2020 <a href="https://wss.mahadiscom.in/wss/wss" target="blank">MAHARASHTRA STATE ELECTRICITY BOARD</a> Design By :
	            <a  href="https://aderatesolutions.com/" target="blank"> AdeRate Tech Solutions</a></p>
	    	</div>
	</footer>    
   
  </body>
</html>
