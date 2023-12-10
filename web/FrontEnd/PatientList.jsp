<%@ page import="java.sql.*, java.util.List, MainPackage.Patient, MainPackage.DatabaseUtility" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details</title>
    <link rel="stylesheet" href="style.css">

    <script>
        function checkUserRole() {
            console.log('calling checkUserRole');
            const urlParams = new URLSearchParams(window.location.search);
            const role = urlParams.get('role');
            console.log('role - ' + role);
        }
        
        function navigateToPatientDetails(patientId) {
            window.location.href = 'DoctorNavigatingToSpecificPatient.jsp?patientId=' + patientId;
        }
        
        function navigateToPatientMedicalRecords(patientId) {
            window.location.href = 'DoctorNavigatingToSpecificMedicalRecords.jsp?patientId=' + patientId;
        }
        function navigateToPatientSuggestDiet(patientId) {
            window.location.href = 'SuggestDietForPatient.jsp?patientId=' + patientId;
        }
    </script>
</head>

<body class="Patient_List_page" onload="checkUserRole()">

    <h1>List of Patients</h1>
    <!-- HTML content -->
    <form id="PatientListForm"action="DoctorNavigatingToSpecificPatient.jsp" method="post">
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Personal Details</th>
                    <th>Medical Details</th>
                    <th>Action</th>
                </tr>
            </thead>
            <!-- Table body for dynamic data -->
            <tbody id="patientTableBody">
                <%
                    // Call a method to get patient details from the database
                    List<Patient> patients = DatabaseUtility.getPatientDetailsFromDatabase();
                    for (Patient patient : patients) {
                    session.setAttribute("PatientID",patient.getId());
                %>
                <tr>
                    <td><%= patient.getId() %></td>
                    <td><%= patient.getName() %></td>
                    <td><%= patient.getEmail() %></td>
                    <td><button class="input-button" type="button" onclick="navigateToPatientDetails(<%= patient.getId() %>)">Patient Details</button></td>
                    <td><button class="input-button" type="button" onclick="navigateToPatientMedicalRecords(<%= patient.getId() %>)">Patient Medical Records</button></td>
                    <td><button class="input-button" type="button" onclick="navigateToPatientSuggestDiet(<%= patient.getId() %>)">SuggestDiet</button></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </form>

</body>

</html>
