<%-- 
    Document   : depo
    Created on : 28-Jan-2022, 1:04:20 am
    Author     : harin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<TITLE>Withdrawal</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Add icon library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

body {font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
	  background-color: rgb(138, 11, 64);
    text-align: center;
	}



.modal-content {
  background-color: white;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: none;
  width: 50%; /* Could be more or less, depending on screen size */
}
button {
  background-color:rgb(138, 11, 64);
  color:white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
  opacity: 0.9;
}

button:hover {
  opacity:1;
}
.container {
  padding: 16px;
  align-content: center;
  background-color: white;
}

</style></head>

<body>
<%
String em = session.getAttribute("userid").toString();
         String pass=request.getParameter("users_pass");
String b=request.getParameter("amount");
int h = 0;
int ba =  Integer.parseInt(b);
        try {
        PreparedStatement pst;
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver"); //load driver
	Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Seenuselvi@17"); //create connection	
	Statement st= con.createStatement();
         ResultSet rs=st.executeQuery("select * from users where email='"+em+"' and pass='"+pass+"'");
        try{
if(rs.next()== false){
String redirectURL = "inv3.html";
response.sendRedirect(redirectURL);}
if(rs.getString("pass").equals(pass)&&rs.getString("email").equals(em))
{
//execute query
h = rs.getInt("balance")-ba;

if(h<0){
String redirectURL = "inv1.html";
response.sendRedirect(redirectURL);
    }
    else{   
        pst = con.prepareStatement("UPDATE users SET balance = ? WHERE email=? and pass=?");
		pst.setInt(1,h);
                pst.setString(2,em);     
		pst.setString(3,pass);
     
        pst.executeUpdate();   
    }
}
else{
String redirectURL = "inv3.html";
response.sendRedirect(redirectURL);
}
        
       


//execute query



	con.close(); //close connection
//                String url = "home.html";
//                File file = new File(url);
//                Desktop.getDesktop().browse(file.toURI());

        } catch(Exception e)
{
	out.println(e);
}}
        catch(Exception e)
{
	out.println(e);
}
%>
<div class="container">
    <h3 style="text-align: center; color: black;"> <br>The amount has been successfully Deposited!! <br>
        Your Current balance is <%=h%></h3>
	<a href="Userhome.html"><button>Back to Home</button></a>


	</div>
</body>
</html>

