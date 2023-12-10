<%-- 
    Document   : PatientSignup
    Created on : 28-Nov-2023, 11:22:22?pm
    Author     : shubh
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String gender = request.getParameter("gender");
    
    // JDBC database connection parameters
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";

    Connection conn = null;
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    ResultSet rs2 = null;

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Retrieve the PatientLoginID
        String patientId=(String)session.getAttribute("patientId");
         
        // Execute the second query using the retrieved PatientLoginID
        ps1 = conn.prepareStatement("UPDATE PATIENT SET Patient_FName = ?,Patient_LName = ?,Patient_Email = ?,Patient_PhoneNo = ?,Patient_Gender =?  WHERE PatientId = ?");

        ps1.setString(1, fname);
        ps1.setString(2, lname);
        ps1.setString(4, phone);
        ps1.setString(3, email);
        ps1.setString(5, gender);
        ps1.setString(6, patientId);

        int rowsAffected = ps1.executeUpdate();
        if (rowsAffected > 0) {
            // If rows were affected, the insert was successful
            response.sendRedirect("PatientListForAdmin.jsp");
        } else {
            // If no rows were affected, the insert failed
            response.sendRedirect("Index.jsp");
        }
        
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // You might want to add code to log or display the error message
        System.out.print(e);
    } catch(Exception e){
        e.printStackTrace();
        System.out.print(e);
    } 
    
    finally {
        // Close the resources in a finally block
        try {
            if (ps1 != null) ps1.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e);
        }
    }
%>