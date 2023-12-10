<%@ page import="java.sql.*, java.util.List, java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <link rel="stylesheet" href="style.css">
</head>

<body class="Patient_List_page">
    <h1>List of Patients</h1>

    <form id="PatientListForm" action="DeletePatient.jsp">
        <table border="1">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>UserName</th>
                <th>Password</th>
                <th>Delete</th>
                <th>Update</th>
            </tr>
            <!-- Table body for dynamic data -->
            <tbody id="patientTableBody">
                <%
                    try {
                        // Establish a database connection
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr1");
                        // Execute a query to retrieve patient data from the first table
                        Statement statement = conn.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM patient");

                        // Iterate through the result set and populate the table
                        while (resultSet.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultSet.getString("PATIENTID") + "</td>");
                            out.println("<td>" + resultSet.getString("PATIENT_FName") + "</td>");
                            out.println("<td>" + resultSet.getString("PATIENT_LNAME") + "</td>");
                            out.println("<td>" + resultSet.getString("PATIENT_EMAIL") + "</td>");

                            // Retrieve username and password from the second table based on patient id
                            String patientId = resultSet.getString("PATIENTID");
                            Statement secondStatement = conn.createStatement();
                            ResultSet secondResultSet = secondStatement.executeQuery("SELECT * FROM PATIENTLOGIN WHERE PATIENTLOGINID = " + patientId);

                            if (secondResultSet.next()) {
                                out.println("<td>" + secondResultSet.getString("USERNAME") + "</td>");
                                out.println("<td>" + secondResultSet.getString("UPASSWORD") + "</td>");
                            } else {
                                // Handle the case where credentials are not found
                                out.println("<td>N/A</td>");
                                out.println("<td>N/A</td>");
                            }

                            out.println("<td><button class='input-button' type='button' onclick='navigateTo(\"delete\", \"" + patientId + "\")'>Delete</button></td>");
                            out.println("<td><button class='input-button' type='button' onclick='navigateTo(\"personalDetails\", \"" + patientId + "\")'>Update</button></td>");
                            out.println("</tr>");

                            // Close resources for the second table
                            secondResultSet.close();
                            secondStatement.close();
                        }

                        // Close resources for the first table
                        resultSet.close();
                        statement.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </form>

    <script>
        function navigateTo(page, patientId) {
            console.log('Inside navigateTo');
            switch (page) {
                case 'delete':
                    // Redirect to DeletePatient.jsp with patientId as a URL parameter
                    window.location.href = 'DeletePatient.jsp?patientId=' + patientId;
                    break;
                case 'personalDetails':
                    window.location.href = 'PatientPersonalDetailsForAdmin.jsp?patientId=' + patientId;
                    break;
                }
        }
    </script>
</body>

</html>
