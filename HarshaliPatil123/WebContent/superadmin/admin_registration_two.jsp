<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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

%>  <%@include file="db.jsp" %>
<%
String adminname=request.getParameter("admin_name");
String adminemailid=request.getParameter("admin_email");
String adminephonenumber=request.getParameter("admin_phone");
String adminepassword=request.getParameter("admin_password");

final String secretKey = "ssshhhhhhhhhhh!!!!";

String originalString = adminepassword;
String encryptedString = AES.encrypt(originalString, secretKey) ;
String decryptedString = AES.decrypt(encryptedString, secretKey) ;

try {
	
	
	
	Connection con=null;
	PreparedStatement ps=null;

	 con=DriverManager.getConnection(Url,Username,password);

		PreparedStatement ps1=con.prepareStatement("select * from admin where admin_phone='"+adminephonenumber+"'");
	     ResultSet rs = ps1.executeQuery();
	     if (rs.next()) {
	   	  System.out.println("User already Regitstered");
	   	   request.setAttribute("alertMsg", "Admin already exist");
	     	RequestDispatcher rd=request.getRequestDispatcher("admin_registration.jsp");  
	     	rd.include(request, response);
	     	
	     } 
	     else 
	     {
            	ps=con.prepareStatement("insert into admin values(?,?,?,?,?,?,?,?)");
    			ps.setString(1, null);
    			ps.setString(2,adminname);
    			ps.setString(3, adminemailid);
    			ps.setString(4,adminephonenumber );
    			ps.setString(5, encryptedString);
    			ps.setString(6, "admin");
    			ps.setString(7, "active");
    			ps.setString(8, "null");

    			int i=ps.executeUpdate();
    			 if(i>0) 
    		     {  
    			  System.out.println("admin added successfully");
    			  RequestDispatcher rd=request.getRequestDispatcher("admin_info.jsp");
    			  rd.forward(request, response);
    			 }
          
         
          }
}

catch (Exception e) {
						
	e.printStackTrace();
}


%>


</body>
</html>