<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>welcome to the details page</title>
<style>
    body {font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
	  background-color: rgb(138, 11, 64);
color: #f1f1f1;
    text-align: center;
	}
    #users {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#users td, #users th {
  border: 1px solid #ddd;
  padding: 8px;
}

#users tr:nth-child(even){background-color:rgb(138, 11, 64);}

#users tr:hover {background-color:rgb(138, 11, 64);}

#users th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: black;
  color: white;
}
    </style>
</head>
<body>
<% 
try
{
       String em=request.getParameter("users_email");
         String pass=request.getParameter("users_pass");
         if(em.equals("admin@gmail.com") && pass.equals("Admin123")){
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Seenuselvi@17");
        String sql = "select * from users";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()==false)
        {
            out.println("No Records in the table");
        }
        else
        {%>
        <div>
        <table id="users">
        <tr><th>Email</th><th>Password</th><th>Balance</th><th>Phone number</th><th>Account number</th></tr>
        <%
            do
            {%>
           
            <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getInt(3)%></td><td><%= rs.getString(4)%></td><td><%= rs.getString(5)%></td></tr>
           
            <%}while(rs.next());
 
}}
else{
String redirectURL = "inv2.html";
response.sendRedirect(redirectURL);
}
}
catch(Exception e)
{
    System.out.println(e.getMessage());
    e.getStackTrace();
}
%>
        </div>
<br>
<br>
<div>
<a href="login.jsp"><button>Back to Home</button></a>
</div>
<br>
        </body>
</html>