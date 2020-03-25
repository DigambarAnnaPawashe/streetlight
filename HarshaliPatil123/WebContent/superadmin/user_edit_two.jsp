<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
String uname=request.getParameter("user_name");
String uemail=request.getParameter("user_email");
String uphone=request.getParameter("user_phone");
String uphone1=request.getParameter("user_phone1");
String upassword=request.getParameter("user_password");
String dpid[]= request.getParameterValues("langOpt2[]");

//int personID = Integer.parseInt(adminephonenumber);
Connection con=null;
	PreparedStatement ps=null;
	
	StringBuilder buffer = new StringBuilder();
	boolean processedFirst = false;
	String firstParam = null;

final String secretKey = "ssshhhhhhhhhhh!!!!";

String originalString = upassword;
String encryptedString = AES.encrypt(originalString, secretKey) ;
String decryptedString = AES.decrypt(encryptedString, secretKey) ;

try {
	
	 con=DriverManager.getConnection(Url,Username,password);
	
	 String sql="Update user set user_name=?,user_email=?,user_phone=?,user_password=?,dpid=? where user_phone="+uphone1;
          
           ps = con.prepareStatement(sql);
           
           ps.setString(1,uname);
           ps.setString(2, uemail);
           ps.setString(3, uphone);
           ps.setString(4, encryptedString);
           List<String> list=new ArrayList<String>();
			for(int loopIndex = 0; loopIndex < dpid.length; loopIndex++){
	            System.out.println(dpid[loopIndex] + "<BR>");
	            list.add(dpid[loopIndex]);
	        }
			System.out.println(list);
			try{
			    for(String record: list){
			        if(processedFirst)
			            buffer.append(",");
			        buffer.append(record);
			        processedFirst = true;
			    }
			    firstParam = buffer.toString();
			}finally{
			    buffer = null;
			}
			ps.setString(5, firstParam);
			System.out.println(firstParam);
           int i = ps.executeUpdate();
           if(i > 0)
           {
		    RequestDispatcher rd=request.getRequestDispatcher("user_info.jsp");
		    rd.forward(request, response);
		 }
           else
           {
        	   System.out.println("Ooop's Record not Update Successfully");	 	
           }   
     }

catch (Exception e) {
	e.printStackTrace();
}


%>
</body>
</html>