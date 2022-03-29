<%-- 
    Document   : logout
    Created on : 28-Jan-2022, 2:29:53 am
    Author     : hp
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 response.setContentType("text/html;charset=UTF-8");
try {
            session.invalidate();
            String redirectURL = "index.html";
                response.sendRedirect(redirectURL);
        } 
        finally {
            out.close();
        }
%>
