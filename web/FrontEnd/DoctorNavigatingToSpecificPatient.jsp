<%-- 
    Document   : PatientPersonalDetailsDatabase
    Created on : 28-Nov-2023, 8:29:02 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Personal Details</title>
        <link rel="stylesheet" href="style.css">
        <script src="script.js"></script>
    </head>
    <body class="personal-details-page">
        <%
       
            // JDBC database connection parameters
            String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
            String dbUser = "hr";
            String dbPassword = "hr1";

            String firstName = null;
            String lastName = null;
            String phoneNumber = null;
            String email = null;
            String gender = null;

            Connection conn = null;
            PreparedStatement ps1 = null;
            ResultSet rs1 = null;

            try {
                String patientId = request.getParameter("patientId");
                session.setAttribute("PatientID", Integer.parseInt(patientId));
                // Load the Oracle JDBC driver
                Class.forName("oracle.jdbc.driver.OracleDriver");

                // Establish a connection
                conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                 
                // Execute the second query using the retrieved PatientLoginID
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM PATIENT WHERE PATIENTID = ?");
                ps.setString(1, patientId);

                ResultSet rs = ps.executeQuery();

                // Process the result set
                if (rs.next()) {
                    // Retrieve patient details from the result set
                    firstName = rs.getString("PATIENT_FNAME");
                    lastName = rs.getString("PATIENT_LNAME");
                    phoneNumber = rs.getString("PATIENT_PHONENO");
                    email = rs.getString("PATIENT_EMAIL");
                    gender = rs.getString("PATIENT_GENDER");
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

        <form id="personalDetailsForm" action="UpdatePatientPersonalDetails.jsp" method="post">
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
