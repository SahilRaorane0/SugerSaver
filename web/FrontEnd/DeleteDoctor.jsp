<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Patient</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="delete-patient-page">

<%
    // JDBC database connection parameters
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";
    
    String doctorId = request.getParameter("doctorId");

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        // SQL query with a parameterized DELETE statement
        String deleteQuery = "DELETE FROM DOCTOR WHERE DOCTORID = ?";
        String deleteQuery2 = "DELETE FROM DOCTORLOGIN WHERE DOCTORLoginID = ?";
        
        // Create a PreparedStatement
        PreparedStatement preparedStatement2 = connection.prepareStatement(deleteQuery2);
        PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);

        // Set the parameter values
        preparedStatement.setString(1, doctorId);
        preparedStatement2.setString(1, doctorId);


        // Execute the DELETE statements
        preparedStatement2.executeUpdate();
        int rowsAffected = preparedStatement.executeUpdate();


        // Check the result and print HTML response
        if (rowsAffected > 0) {
            response.sendRedirect("AdminHomePage.jsp");
        } else {
            response.sendRedirect("INDEX.jsp");
        }

        // Close the resources
        preparedStatement.close();
        preparedStatement2.close();
        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<h1>Error deleting patient: " + e.getMessage() + "</h1>");
    }
%>

</body>
</html>
