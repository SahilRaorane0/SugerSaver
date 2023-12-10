<!-- admin_personal_details.html -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Personal Details</title>
    <link rel="stylesheet" href="style.css">
    <script src="adminHome.js"></script>
</head>

<body class="admim_personal_details_page">
    <h1>Admin Personal Details</h1>
    <%
        // JDBC database connection parameters
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr1";

        String user=(String)session.getAttribute("Auser");
        String pwd = (String)session.getAttribute("Apwd");

        String firstName = null;
        String lastName = null;
        String email = null;

        Connection conn = null;
        PreparedStatement ps1 = null;
        ResultSet rs1 = null;

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            ps1 = conn.prepareStatement("SELECT ADMINLOGINID FROM ADMINLOGIN WHERE USERNAME = ? AND UPASSWORD = ?");
            ps1.setString(1, user);
            ps1.setString(2, pwd);

            rs1 = ps1.executeQuery();

            if (rs1.next()) {
                // Retrieve the PatientLoginID
                int adminLoginID = rs1.getInt("ADMINLOGINID");

                // Execute the second query using the retrieved PatientLoginID
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM Admin WHERE AdminID = ?");
                ps.setInt(1, adminLoginID);

                ResultSet rs = ps.executeQuery();

                // Process the result set
                if (rs.next()) {
                    // Retrieve patient details from the result set
                    firstName = rs.getString("ADMIN_FNAME");
                    lastName = rs.getString("ADMIN_LNAME");
                    email = rs.getString("ADMIN_EMAIL");
                }

                // Close the result set and statement
                rs.close();
                ps.close();
            } else {
                // Handle the case where the username and password are not valid
                out.println("Invalid username or password");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println(e);
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
    <form id="adminPersonalDetailsForm">
        <label for="fname">First Name:</label>
        <input type="text" id="fname" name="fname" value="<%= firstName %>" required>
        <br>

        <label for="lname">Last Name:</label>
        <input type="text" id="lname" name="lname" value="<%= lastName %>" required>
        <br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= email %>"  required>
        <br>
        <button class="input-button" type="SUBMIT">Submit</button>
    </form>
</body>
</html>