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
    <%@include file="db.jsp" %>
<!DOCTYPE html>
<html>
<head>
  	<title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="../css/style2.css">
	    <link rel="stylesheet" href="../css/chart.css">
		
  </head>

<body>
<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar" class="active">
				<a href="index.html" class="logo" ><img src="images/logo.jpg" style="width: 25px;height: 25px;" ><br>AdeRate Solution</a>
     
   
   
      
      
      <ul class="list-unstyled components mb-5">
       <%
       /***** Post Parameters From The Request *****/
       String param1 = request.getParameter("admin_email");
       if (param1 != null && !param1.equals("")) {

           int timeout = 300;
           HttpSession sessionObj = request.getSession(true);

          
           /***** Setting The Updated Session Time Out *****/
           sessionObj.setMaxInactiveInterval(timeout);
           
           /***** Once The Time Out Is Reached. This Line Will Automatically Refresh The Page *****/
           response.setHeader("Refresh", timeout + "; URL=../homepage.jsp");
       } else {
           //out.println("<p id='errMsg' style='color: red; font-size: larger; margin-left: 564px'>Please Enter a Correct Name!</p>");
           RequestDispatcher rdObj = request.getRequestDispatcher("../homepage.jsp");
           rdObj.include(request, response);
       }

       %>
       <%!String admin_phone=null; %>
   <%
  
    Connection con1=null;
	PreparedStatement ps1=null;
	ResultSet rs1=null;
	
	String amailid1=request.getParameter("admin_email");
    String apassword1=request.getParameter("admin_password");
   %>
   <% 
   try
   {
     con1=DriverManager.getConnection(Url,Username,password);
     ps1=con1.prepareStatement("select * from admin");
     final String secretKey = "ssshhhhhhhhhhh!!!!";
     String originalString = apassword1;
     String encryptedString = AES.encrypt(originalString, secretKey) ;
     String decryptedString = AES.decrypt(encryptedString, secretKey) ;
     if (amailid1!= null && encryptedString!=null) 
     {
      String sql = "Select * from admin Where admin_email='" + amailid1 + "' and admin_password='" + encryptedString + "'";
      rs1 = ps1.executeQuery(sql);
      if(rs1.next())
      {
         admin_phone=rs1.getString("admin_phone");
         System.out.println(admin_phone);
   %>
          
          <li>
              <a href="dptable_admin.jsp?admin_phone=<%=rs1.getString("admin_phone")%>"><span class="fa fa-sliders"></span> DP List</a>
          </li>
           <li>
              <a href="timeset_admin.jsp?admin_phone=<%=rs1.getString("admin_phone")%>"><span class="fa fa-clock-o"></span> Time Manager</a>
          </li>
          <li>
          <li>
            <a href="admin_user_info1.jsp?admin_phone=<%=rs1.getString("admin_phone")%>"><span class="fa fa-users"></span> User Manager</a>
          </li>
          <li>
            <a href="onoff_admin.jsp?admin_phone=<%=rs1.getString("admin_phone") %>" ><span class="fa fa-toggle-on"></span> ON/OFF</a>
          </li>
          <li>
            <a href="show_admin_notification.jsp?admin_phone=<%=rs1.getString("admin_phone") %>" ><span class="fa fa-bell"></span> Show Notifications</a>
          </li>
           <li>
            <a href="newadmin_notification_info.jsp?admin_phone=<%=rs1.getString("admin_phone") %>" ><span class="fa fa-bell"></span>Notifications</a>
          </li>
         
           <li>
            <a href="../homepage.jsp"><span class="fa fa-power-off"></span>Logout</a>
          </li>
      </ul>  
          </nav>
      
   <%
      }
    }
  }
  catch (Exception e) 
  {
    e.printStackTrace();
  }
  %>
        
    
      
  <div id="content" >

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            
           
          </div>
        </nav>
        

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

<%!String c1=null,dpid,c3=null,c4=null,c5=null,c6=null,c7=null,
 c9=null,c10=null,c11=null,c12=null,c13=null,c14=null,c15=null,
 c16=null,c17=null,c18=null,c19=null,c20=null,c21=null;  %>
 
 <%!int v1=0,v3=0,v4=0,v5=0,v6=0,v7=0,v9=0,v10=0,add,sub,v11=0,
  v12=0,v13=0,v14=0,v15=0,v16=0,v17=0,v18=0,v19=0,v20=0,v21=0; %>
 
<%

int sum3=0,sum4=0,sum5=0,sum6=0,sum7=0,sum8=0,sum9=0,sum10=0,sum11=0,sum12=0,sum13=0,sum14=0,sum15=0,sum16=0,sum17=0,sum18=0,sum19=0,sum20=0,sum21=0;
System.out.println("admin phone ::"+admin_phone);

Statement statement1=null;ResultSet resultSet1=null;
Statement statement2=null;ResultSet resultSet2=null;
Statement statement3=null;ResultSet resultSet3=null;
Statement statement4=null;ResultSet resultSet4=null;
Statement statement5=null;ResultSet resultSet5=null;
Statement statement6=null;ResultSet resultSet6=null;
Statement statement7=null;ResultSet resultSet7=null;
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
Statement statement20=null;ResultSet resultSet20=null;
Statement statement21=null;ResultSet resultSet21=null;

try
{
	con1 = DriverManager.getConnection(Url, Username, password);
    statement1=con1.createStatement();
    statement2=con1.createStatement();
    statement3=con1.createStatement();
    statement4=con1.createStatement();
    statement5=con1.createStatement();
    statement6=con1.createStatement();
    statement7=con1.createStatement();
    statement9=con1.createStatement();
    statement10=con1.createStatement();
    statement11=con1.createStatement();
    statement12=con1.createStatement();
    statement13=con1.createStatement();
    statement14=con1.createStatement();
    statement15=con1.createStatement();
    statement16=con1.createStatement();
    statement17=con1.createStatement();
    statement18=con1.createStatement();
    statement19=con1.createStatement();
    statement20=con1.createStatement();
    statement21=con1.createStatement();

    String sql1 ="SELECT COUNT(dpid)FROM dp_info WHERE admin_phone="+admin_phone ;
    resultSet1 = statement1.executeQuery(sql1);
    ResultSetMetaData rsmd1 = resultSet1.getMetaData();
    int columnsNumber1 = rsmd1.getColumnCount();
    
    while(resultSet1.next())
    {
     for (int i = 1; i <= columnsNumber1; i++) 
 	 {
       c1=resultSet1.getString(i);
       v1=Integer.parseInt(c1);
       System.out.println("Total DP:"+v1);

 	 }
    }

    String sql2 ="SELECT * FROM dp_info WHERE admin_phone="+admin_phone ;
    ArrayList<String> idlist=new ArrayList<>();
    resultSet2 = statement2.executeQuery(sql2);

    while(resultSet2.next())
    {
    	 dpid=resultSet2.getString("dpid");
    	 idlist.add(dpid);
    }
    System.out.println("dp list::"+idlist);
	for(String n: idlist)
	{ 
		
		String sql3="SELECT COUNT(dpid) FROM onephase WHERE dpid="+n;
		resultSet3=statement3.executeQuery(sql3);
		ResultSetMetaData rsmd3 = resultSet3.getMetaData();
	    int columnsNumber3 = rsmd3.getColumnCount();
	   
	    while(resultSet3.next())
	    {
	     for (int i = 1; i <= columnsNumber3; i++) 
	 	 {
	    	 
	       c3=resultSet3.getString(i);
	       v3=Integer.parseInt(c3);
		     sum3=sum3+v3;
           }
	     }
    
         String sql4="SELECT COUNT(dpid) FROM onephase WHERE r_voltage>100 AND dpid="+(n);
		resultSet4=statement4.executeQuery(sql4);
	    ResultSetMetaData rsmd4 = resultSet4.getMetaData();
	    int columnsNumber4 = rsmd4.getColumnCount();
	    while(resultSet4.next())
	    {
	     for (int i = 1; i <= columnsNumber4; i++) 
	 	 {
	    	 
	       c4=resultSet4.getString(i);
	       v4=Integer.parseInt(c4);
	       sum4=sum4+v4;
	 	 }
	    }
	    
	    String sql5="SELECT COUNT(dpid) FROM onephase WHERE r_voltage<100 AND dpid="+(n);
		resultSet5=statement5.executeQuery(sql5);
	    ResultSetMetaData rsmd5 = resultSet5.getMetaData();
	    int columnsNumber5 = rsmd5.getColumnCount();
	    while(resultSet5.next())
	    {
	     for (int i = 1; i <= columnsNumber5; i++) 
	 	 {
	    	 
	       c5=resultSet5.getString(i);
	       v5=Integer.parseInt(c5);
	       sum5=sum5+v5;
	 	 }
	    }
	    
	    String sql6="SELECT COUNT(dpid) FROM twophase WHERE dpid="+(n);
		resultSet6=statement6.executeQuery(sql6);
	    ResultSetMetaData rsmd6 = resultSet6.getMetaData();
	    int columnsNumber6 = rsmd6.getColumnCount();
	    while(resultSet6.next())
	    {
	     for (int i = 1; i <= columnsNumber6; i++) 
	 	 {
	    	 
	       c6=resultSet6.getString(i);
	       v6=Integer.parseInt(c6);
	       sum6=sum6+v6;
	 	 }
	    }
	   
	    String sql7="SELECT COUNT(dpid) FROM twophase WHERE (r_voltage>100 OR y_voltage>100) AND dpid="+(n);
		resultSet7=statement7.executeQuery(sql7);
	    ResultSetMetaData rsmd7 = resultSet7.getMetaData();
	    int columnsNumber7 = rsmd7.getColumnCount();
	    while(resultSet7.next())
	    {
	     for (int i = 1; i <= columnsNumber7; i++) 
	 	 {
	    	 c7=resultSet7.getString(i);
	         v7=Integer.parseInt(c7);
             sum7=sum7+v7;
	 	  }
	    }
	    
	    String sql9="SELECT COUNT(dpid) FROM threephase WHERE dpid="+(n);
		resultSet9=statement9.executeQuery(sql9);
	    ResultSetMetaData rsmd9 = resultSet9.getMetaData();
	    int columnsNumber9 = rsmd9.getColumnCount();
	    while(resultSet9.next())
	    {
	     for (int i = 1; i <= columnsNumber9; i++) 
	 	 {
	    	 
	       c9=resultSet9.getString(i);
	       v9=Integer.parseInt(c9);
	       sum9=sum9+v9;
	 	 }
	    }
	    
	    String sql10="SELECT COUNT(dpid) FROM threephase WHERE (r_voltage>100 OR y_voltage>100 OR b_voltage>100) AND dpid="+(n);
		resultSet10=statement10.executeQuery(sql10);
	    ResultSetMetaData rsmd10 = resultSet10.getMetaData();
	    int columnsNumber10 = rsmd10.getColumnCount();
	    while(resultSet10.next())
	    {
	     for (int i = 1; i <= columnsNumber10; i++) 
	 	 {
	    	 
	       c10=resultSet10.getString(i);
	       v10=Integer.parseInt(c10);
	       sum10=sum10+v10;
	 	  }
	    }
	    
	    String sql12="SELECT COUNT(dpid) FROM twophase WHERE r_voltage>100 AND dpid="+(n);
		resultSet12=statement12.executeQuery(sql12);
	    ResultSetMetaData rsmd12 = resultSet12.getMetaData();
	    int columnsNumber12 = rsmd12.getColumnCount();
	    while(resultSet12.next())
	    {
	     for (int i = 1; i <= columnsNumber12; i++) 
	 	 {
	    	 
	       c12=resultSet12.getString(i);
	       v12=Integer.parseInt(c12);
	       sum12=sum12+v12;
	 	 }
	    }    
	    
	    String sql13="SELECT COUNT(dpid) FROM twophase WHERE r_voltage<100 AND dpid="+(n);
		resultSet13=statement13.executeQuery(sql13);
	    ResultSetMetaData rsmd13 = resultSet13.getMetaData();
	    int columnsNumber13 = rsmd13.getColumnCount();
	    while(resultSet13.next())
	    {
	     for (int i = 1; i <= columnsNumber13; i++) 
	 	 {
	    	 
	       c13=resultSet13.getString(i);
	       v13=Integer.parseInt(c13);
	       sum13=sum13+v13;
	 	 }
	    }    
	    String sql14="SELECT COUNT(dpid) FROM twophase WHERE y_voltage>100 AND dpid="+(n);
		resultSet14=statement14.executeQuery(sql14);
	    ResultSetMetaData rsmd14 = resultSet14.getMetaData();
	    int columnsNumber14 = rsmd14.getColumnCount();
	    while(resultSet14.next())
	    {
	     for (int i = 1; i <= columnsNumber14; i++) 
	 	 {
	    	 
	       c14=resultSet14.getString(i);
	       v14=Integer.parseInt(c14);
	       sum14=sum14+v14;
	 	 }
	    }    
	    
	    String sql15="SELECT COUNT(dpid) FROM twophase WHERE y_voltage<100 AND dpid="+(n);
		resultSet15=statement15.executeQuery(sql15);
	    ResultSetMetaData rsmd15 = resultSet15.getMetaData();
	    int columnsNumber15 = rsmd15.getColumnCount();
	    while(resultSet15.next())
	    {
	     for (int i = 1; i <= columnsNumber15; i++) 
	 	 {
	    	 
	       c15=resultSet15.getString(i);
	       v15=Integer.parseInt(c15);
	       sum15=sum15+v15;
	 	 }
	    }    
	    String sql16="SELECT COUNT(dpid) FROM threephase WHERE r_voltage>100 AND dpid="+(n);
		resultSet16=statement16.executeQuery(sql16);
	    ResultSetMetaData rsmd16 = resultSet16.getMetaData();
	    int columnsNumber16 = rsmd16.getColumnCount();
	    while(resultSet16.next())
	    {
	     for (int i = 1; i <= columnsNumber16; i++) 
	 	 {
	    	 
	       c16=resultSet16.getString(i);
	       v16=Integer.parseInt(c16);
	       sum16=sum16+v16;
	 	 }
	    }    
	    
	    String sql17="SELECT COUNT(dpid) FROM threephase WHERE r_voltage<100 AND dpid="+(n);
		resultSet17=statement17.executeQuery(sql17);
	    ResultSetMetaData rsmd17= resultSet17.getMetaData();
	    int columnsNumber17 = rsmd17.getColumnCount();
	    while(resultSet17.next())
	    {
	     for (int i = 1; i <= columnsNumber17; i++) 
	 	 {
	    	 
	       c17=resultSet17.getString(i);
	       v17=Integer.parseInt(c17);
	       sum17=sum17+v17;
	 	 }
	    }    
	    String sql18="SELECT COUNT(dpid) FROM threephase WHERE y_voltage>100 AND dpid="+(n);
		resultSet18=statement18.executeQuery(sql18);
	    ResultSetMetaData rsmd18 = resultSet18.getMetaData();
	    int columnsNumber18 = rsmd18.getColumnCount();
	    while(resultSet18.next())
	    {
	     for (int i = 1; i <= columnsNumber18; i++) 
	 	 {
	    	 
	       c18=resultSet18.getString(i);
	       v18=Integer.parseInt(c18);
	       sum18=sum18+v18;
	 	 }
	    }    
	    
	    String sql19="SELECT COUNT(dpid) FROM threephase WHERE y_voltage<100 AND dpid="+(n);
		resultSet19=statement19.executeQuery(sql19);
	    ResultSetMetaData rsmd19 = resultSet19.getMetaData();
	    int columnsNumber19 = rsmd19.getColumnCount();
	    while(resultSet19.next())
	    {
	     for (int i = 1; i <= columnsNumber19; i++) 
	 	 {
	    	 
	       c19=resultSet19.getString(i);
	       v19=Integer.parseInt(c19);
	       sum19=sum19+v19;
	 	 }
	    }          
	    String sql20="SELECT COUNT(dpid) FROM threephase WHERE b_voltage>100 AND dpid="+(n);
	  		resultSet20=statement20.executeQuery(sql20);
	  	    ResultSetMetaData rsmd20 = resultSet20.getMetaData();
	  	    int columnsNumber20 = rsmd20.getColumnCount();
	  	    while(resultSet20.next())
	  	    {
	  	     for (int i = 1; i <= columnsNumber20; i++) 
	  	 	 {
	  	    	 
	  	       c20=resultSet20.getString(i);
	  	       v20=Integer.parseInt(c20);
	  	       sum20=sum20+v20;
	  	 	 }
	  	    }    
	  	    
	  	    String sql21="SELECT COUNT(dpid) FROM threephase WHERE b_voltage<100 AND dpid="+(n);
	  		resultSet21=statement21.executeQuery(sql21);
	  	    ResultSetMetaData rsmd21 = resultSet21.getMetaData();
	  	    int columnsNumber21 = rsmd21.getColumnCount();
	  	    while(resultSet21.next())
	  	    {
	  	     for (int i = 1; i <= columnsNumber21; i++) 
	  	 	 {
	  	    	 
	  	       c21=resultSet21.getString(i);
	  	       v21=Integer.parseInt(c21);
	  	       sum21=sum21+v21;
	  	 	 }
	  	    }            
	    
	  }		
	
	 String sql11="SELECT COUNT(id) FROM user WHERE admin_phone="+admin_phone;
		resultSet11=statement11.executeQuery(sql11);
	    ResultSetMetaData rsmd11 = resultSet11.getMetaData();
	    int columnsNumber11 = rsmd11.getColumnCount();
	    while(resultSet11.next())
	    {
	     for (int i = 1; i <= columnsNumber11; i++) 
	 	 {
	    	 
	       c11=resultSet11.getString(i);
	       v11=Integer.parseInt(c11);
	 	  }
	    }
	    sum8=sum6-sum7;
	    sum11=sum9-sum10;
	
    System.out.println("Total DP onephase:"+sum3);	
    System.out.println("Total ON DP onephase:"+sum4);
    System.out.println("Total OFF DP onephase:"+sum5);
    System.out.println("Total DP twophase:"+sum6);
    System.out.println("Total ON DP twophase:"+sum7);
    System.out.println("Total OFF DP twophase:"+sum8); 
    System.out.println("Total DP threephase:"+sum9);
    System.out.println("Total ON DP threephase:"+sum10);
    System.out.println("Total OFF DP threephase:"+sum11);
 
    add=sum4+sum7+sum10;
    sub=sum5+sum8+sum11;
    System.out.println("Total ONNNNNNNN DPPPPPP="+add);
    System.out.println("Total OFFFFFFFF DPPPPPP="+sub); 
    System.out.println("Total Users:"+v11);
    
    System.out.println("Total on(R)twophase :"+sum12);
    System.out.println("Total off(R)twophase :"+sum13);
    System.out.println("Total on(Y)twophase :"+sum14);
    System.out.println("Total off(Y)twophase :"+sum15);

    System.out.println("Total on(R)threephase :"+sum16);
    System.out.println("Total off(R)threephase :"+sum17);
    System.out.println("Total on(Y)threephase :"+sum18);
    System.out.println("Total off(Y)threephase :"+sum19);  
    System.out.println("Total on(B)threephase :"+sum20);
    System.out.println("Total off(B)threephase :"+sum21);  

   }
 catch (Exception e)
 {
 e.printStackTrace();
 }

 %> 

 <div class="bg-style">
<!--   <h1 class="p-3">Canvas circular progressbar </h1>
 -->  <div class="wrapper">
    <div class="row pt-5 pb-5">
  
  <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=v1%>" data-cp-color="#00bfeb">
        </div>
        <h4>Total DP</h4>
     </div>
  
  <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=add%>" data-cp-color="#EA4C89"></div>
        <h4>Total On DP</h4>
  </div>
 
  <div class="col-6 col-sm-3">
      <div class="counter" data-cp-percentage="<%=sub%>" data-cp-color="#FF675B"></div>
      <h4>Total Off DP</h4>
    </div>
  
   <div class="col-6 col-sm-3">
        <div class="counter" data-cp-percentage="<%=v11%>" data-cp-color="#0008ff"></div>
        <h4>Total Users</h4>
    </div>
    
<br>    
   
    <div class="col-sm my" >
     <b>
     <br>
     <label id="font">ONE PHASE(<%=sum3%>)</label><br>
     <label>ON(R)::<%=sum4%></label>
     <progress id="on" value="<%=sum4%>" max="<%=sum3%>" ></progress>

     <label>OFF(R)::<%=sum5%></label>
     <progress id="off" value="<%=sum5%>" max="<%=sum3%>"></progress> 
     </b>
   </div> 
   
   <br>
    <div class="my1 mt-5" >
     <b>
     <br>
     <label id="font">TWO PHASE(<%=sum6%>)</label><br>
     <label>ON(R)::<%=sum12%></label>
     <progress id="on" value="<%=sum12%>" max="<%=sum6%>" ></progress>

     <label>OFF(R)::<%=sum13%></label>
     <progress id="off" value="<%=sum13%>" max="<%=sum6%>"></progress> 
    <br>   
     <label>ON(Y)::<%=sum14%></label>
     <progress id="on" value="<%=sum14%>" max="<%=sum6%>" ></progress>

     <label>OFF(Y)::<%=sum15%></label>
     <progress id="off" value="<%=sum15%>" max="<%=sum6%>"></progress> 
     </b>
   </div> 
    
   <br>
    <div class="my2 mt-5" >
     <b>
     <br>
     <label id="font">THREE PHASE(<%=sum9%>)</label><br>
     <label>ON(R)::<%=sum16%></label>
     <progress id="on" value="<%=sum16%>" max="<%=sum9%>" ></progress>

     <label>OFF(R)::<%=sum17%></label>
     <progress id="off" value="<%=sum17%>" max="<%=sum9%>"></progress> 
    <br>   
     <label>ON(Y)::<%=sum18%></label>
     <progress id="on" value="<%=sum18%>" max="<%=sum9%>" ></progress>

     <label>OFF(Y)::<%=sum19%></label>
     <progress id="off" value="<%=sum19%>" max="<%=sum9%>"></progress> 
      <br>   
     <label>ON(B)::<%=sum20%></label>
     <progress id="on" value="<%=sum20%>" max="<%=sum9%>" ></progress>

     <label>OFF(B)::<%=sum21%></label>
     <progress id="off" value="<%=sum21%>" max="<%=sum9%>"></progress> 
     </b>
   </div>   
  </div>
  </div>
 
</div>
<p class="p-3">
</p>

</div>
 </div>
          
          
     <script src="../js/chart.js"></script>
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
