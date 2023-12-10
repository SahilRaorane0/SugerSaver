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
    <h1>List of Doctors</h1>

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
            <tbody id="DoctorTableBody">
                <%
                    try {
                        // Establish a database connection
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr1");
                        // Execute a query to retrieve patient data from the first table
                        Statement statement = conn.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM Doctor");

                        // Iterate through the result set and populate the table
                        while (resultSet.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultSet.getString("DOCTORID") + "</td>");
                            out.println("<td>" + resultSet.getString("DOCTOR_FName") + "</td>");
                            out.println("<td>" + resultSet.getString("DOCTOR_LNAME") + "</td>");
                            out.println("<td>" + resultSet.getString("DOCTOR_EMAIL") + "</td>");

                            // Retrieve username and password from the second table based on patient id
                            String doctorId = resultSet.getString("DOCTORID");
                            Statement secondStatement = conn.createStatement();
                            ResultSet secondResultSet = secondStatement.executeQuery("SELECT * FROM DOCTORLOGIN WHERE DOCTORLOGINID = " + doctorId);

                            if (secondResultSet.next()) {
                                out.println("<td>" + secondResultSet.getString("USERNAME") + "</td>");
                                out.println("<td>" + secondResultSet.getString("UPASSWORD") + "</td>");
                            } else {
                                // Handle the case where credentials are not found
                                out.println("<td>N/A</td>");
                                out.println("<td>N/A</td>");
                            }

                            out.println("<td><button class='input-button' type='button' onclick='navigateTo(\"Delete\", \"" + doctorId + "\")'>Delete</button></td>");
                            out.println("<td><button class='input-button' type='button' onclick='navigateTo(\"personalDetails\", \"" + doctorId + "\")'>Update</button></td>");
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
        function navigateTo(page, doctorId) {
            console.log('Inside navigateTo');
            switch (page) {
                case 'Delete':
                    // Redirect to DeletePatient.jsp with patientId as a URL parameter
                    window.location.href = 'DeleteDoctor.jsp?doctorId=' + doctorId;
                    break;
                case 'personalDetails':
                    // Redirect to DeletePatient.jsp with patientId as a URL parameter
                    window.location.href = 'DoctorPersonalDetailsForAdmin.jsp?doctorId=' + doctorId;
                    break;
            }
        }
    </script>
</body>

</html>
