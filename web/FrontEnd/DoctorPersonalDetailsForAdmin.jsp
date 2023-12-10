<%-- 
    Document   : PatientPersonalDetails
    Created on : 28-Nov-2023, 8:24:04 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!-- personal_details.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personal Details</title>
    <link rel="stylesheet" href="style.css">
    
</head>

<body class="personal-details-page">
<%
    // JDBC database connection parameters
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";

    String doctorId = request.getParameter("doctorId");
    
    session.setAttribute("doctorId",doctorId);
    
    
    String firstName = null;
    String lastName = null;
    String phoneNumber = null;
    String email = null;
    String gender = null;

    Connection conn = null;
    PreparedStatement ps1 = null;
    ResultSet rs1 = null;

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

        // Retrieve the PatientLoginID

        // Execute the second query using the retrieved PatientLoginID
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM DOCTOR WHERE DOCTORID = ?");
        ps.setString(1, doctorId);

        ResultSet rs = ps.executeQuery();

        // Process the result set
        if (rs.next()) {
            // Retrieve patient details from the result set
            firstName = rs.getString("DOCTOR_FNAME");
            lastName = rs.getString("DOCTOR_LNAME");
            phoneNumber = rs.getString("DOCTOR_PHONENO");
            email = rs.getString("DOCTOR_EMAIL");
            gender = rs.getString("DOCTOR_GENDER");
        }

        // Close the result set and statement
        rs.close();
        ps.close();

    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    } finally {
        // Close the resources in a finally block
        try {
            if (rs1 != null) rs1.close();
            if (ps1 != null) ps1.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
        
<h1>Personal Details</h1>

<form id="personalDetailsForm" method="post" action="UpdateDoctorPersonalDetailsFromAdmin.jsp">
    <label for="fname">First Name:</label>
        <input type="text" id="fname" name="fname" value="<%= firstName %>" required>
        <br>

        <label for="lname">Last Name:</label>
        <input type="text" id="lname" name="lname" value="<%= lastName %>" required>
        <br>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" value="<%= phoneNumber %>" required>
        <br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>" required>
        <br>

        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender" value="<%= gender %>" required>
        <br>

        <button class="input-button" type="submit">Submit</button>
</form>

</body>
</html>

