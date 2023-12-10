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
    
    String patientId = request.getParameter("patientId");

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        // SQL query with a parameterized DELETE statement
        String deleteQuery = "DELETE FROM PATIENT WHERE PATIENTID = ?";
        String deleteQuery2 = "DELETE FROM PATIENTLogin WHERE PATIENTLoginID = ?";
        String deleteQuery3 = "DELETE FROM dietplan WHERE PATIENTID = ?";
        String deleteQuery4 = "DELETE FROM medicalrecords WHERE PATIENTID = ?";
        
        // Create a PreparedStatement
        PreparedStatement preparedStatement4 = connection.prepareStatement(deleteQuery4);
        PreparedStatement preparedStatement3 = connection.prepareStatement(deleteQuery3);
        PreparedStatement preparedStatement2 = connection.prepareStatement(deleteQuery2);
        PreparedStatement preparedStatement = connection.prepareStatement(deleteQuery);

        // Set the parameter values
        preparedStatement.setString(1, patientId);
        preparedStatement2.setString(1, patientId);
        preparedStatement3.setString(1, patientId);
        preparedStatement4.setString(1, patientId);

        // Execute the DELETE statements
        preparedStatement4.executeUpdate();
        preparedStatement3.executeUpdate();
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
        preparedStatement3.close();
        connection.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        out.println("<h1>Error deleting patient: " + e.getMessage() + "</h1>");
    }
%>

</body>
</html>
