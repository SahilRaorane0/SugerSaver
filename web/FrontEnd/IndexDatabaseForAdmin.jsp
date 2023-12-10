<%-- 
    Document   : IndexDatabaseForDoctor
    Created on : 28-Nov-2023, 9:59:13 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : IndexDatabase
    Created on : 28-Nov-2023, 8:11:16?pm
    Author     : shubh
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String user = request.getParameter("Auser");
    String pwd = request.getParameter("Apwd");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr1");

        // Use PreparedStatement to prevent SQL injection
        PreparedStatement ps = conn.prepareStatement("SELECT AdminLoginID FROM adminlogin  WHERE UserName = ? AND UPassword = ?");
        ps.setString(1, user);
        ps.setString(2, pwd);   
        
        session.setAttribute("Auser",user);
        session.setAttribute("Apwd",pwd);
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Valid user, redirect to a new page
            response.sendRedirect("AdminHomePage.jsp");
        } else {
            // Invalid user, display an error message
            response.sendRedirect("Index.jsp"); // You might want to include an error parameter
        }

        // Close resources
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

