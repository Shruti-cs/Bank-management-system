/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hp
 */
public class sign extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String em=request.getParameter("sign_email");
String pass=request.getParameter("sign_pass");
String p=request.getParameter("sign_phone");
String a=request.getParameter("sign_acc");
String b=request.getParameter("sign_bal");
int ba =  Integer.parseInt(b);
HttpSession session = request.getSession();
session.setAttribute("userid",em);
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Seenuselvi@17"); //create connection	
	PreparedStatement pstmt=null; //create statement
	pstmt=con.prepareStatement("insert into users(email,pass,balance,phone,acc) values(?,?,?,?,?)"); //sql insert query
	pstmt.setString(1,em);
	pstmt.setString(2,pass);
	pstmt.setInt(3,ba);
        pstmt.setString(4,p);
        pstmt.setString(5,a);
	pstmt.executeUpdate(); //execute query
	con.close(); //close connection
//                String url = "home.html";
//                File file = new File(url);
//                Desktop.getDesktop().browse(file.toURI());
out.println("Welcome ");
	String redirectURL = "Userhome.html";
response.sendRedirect(redirectURL);
}
catch(Exception e)
{
	out.println(e);
}
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
