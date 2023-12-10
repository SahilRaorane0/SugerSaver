<%-- 
    Document   : PatientSignup
    Created on : 28-Nov-2023, 11:22:22?pm
    Author     : shubh
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String user = request.getParameter("pUsid");
    String pwd = request.getParameter("pPwd");
    String email = request.getParameter("pEmail");

    // JDBC database connection parameters
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";

    Connection conn = null;
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    PreparedStatement ps3 = null;

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
         
        ps3 = conn.prepareStatement("INSERT INTO MedicalRecords(MRECORDID,PATIENTID) VALUES (11,11)");
        
        
        ps2 = conn.prepareStatement("INSERT INTO Patient(PATIENTID ,PATIENT_EMAIL) VALUES (11,?)");
        ps2.setString(1, email);
        // Prepare the insert statement
        ps1 = conn.prepareStatement("INSERT INTO PatientLogin(PATIENTLOGINID, USERNAME, UPASSWORD) VALUES (11,?, ?)");

        // Set parameters for the insert statement
        ps1.setString(1, user);
        ps1.setString(2, pwd);

        
        // Execute the update
        
        int rowsAffected2 = ps2.executeUpdate();
        int rowsAffected3 = ps3.executeUpdate();
        int rowsAffected = ps1.executeUpdate();
        
        if(rowsAffected3 > 0){        
            if(rowsAffected2 > 0){
                if (rowsAffected > 0) {
                    // If rows were affected, the insert was successful
                    response.sendRedirect("Index.jsp");
                } else {
                    // If no rows were affected, the insert failed
                    response.sendRedirect("Index.jsp");
                }
            }
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // You might want to add code to log or display the error message
        response.sendRedirect("ErrorPage.jsp");
    } finally {
        // Close the resources in a finally block
        try {
            if (ps1 != null) ps1.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
