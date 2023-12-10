<%-- 
    Document   : PatientSignup
    Created on : 28-Nov-2023, 11:22:22?pm
    Author     : shubh
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String user = request.getParameter("pUsr");
    String newpwd = request.getParameter("npPwd");
    String connewpwd = request.getParameter("cpPwd");

    // JDBC database connection parameters
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";

    Connection conn = null;
    PreparedStatement ps1 = null;

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        String sql = "UPDATE PatientLogin SET UPASSWORD = ? WHERE USERNAME= ?";
        // Prepare the insert statement
        ps1 = conn.prepareStatement(sql);

        // Set parameters for the insert statement
        ps1.setString(1, newpwd);
        ps1.setString(2, user);

        
        // Execute the update

        int rowsAffected = ps1.executeUpdate();
        
        
        if (rowsAffected > 0) {
            // If rows were affected, the insert was successful
            response.sendRedirect("Index.jsp");
        } else {
            // If no rows were affected, the insert failed
            response.sendRedirect("PatientHomepage.jsp");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        System.out.print(e);
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