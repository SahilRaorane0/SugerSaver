<%@ page import="java.sql.*" %>
<%
    // Retrieve values from the form
    String patientId = request.getParameter("patientId");
    String dietplan = request.getParameter("dietplan");

    Connection conn = null;
    PreparedStatement ps1 = null;

    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Execute the query to insert the diet plan
        String sql = "INSERT INTO dietplan VALUES (11,?, ?)";
        ps1 = conn.prepareStatement(sql);
        ps1.setString(1, patientId);
        ps1.setString(2, dietplan);

        int rowsAffected = ps1.executeUpdate();

        if (rowsAffected > 0) {
            // If rows were affected, the insert was successful
            response.sendRedirect("DoctorHomePage.jsp");
        } else {
            // If no rows were affected, the insert failed
            response.sendRedirect("Index.jsp");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.print(e);
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
