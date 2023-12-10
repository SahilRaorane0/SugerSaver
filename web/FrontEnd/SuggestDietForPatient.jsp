<!-- suggest-diet-form.html -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suggest Diet Form</title>
    <!-- Add your CSS styles if needed -->
    <link rel="stylesheet" href="style.css">
    <script src="doctorHome.js"></script>
</head>
<body class="submitDiet_page">
    <h1>Suggest Diet</h1>
    <% 
        String patientId = request.getParameter("patientId");
        session.setAttribute("PatientID", Integer.parseInt(patientId));
    %>
    <form action="SuggestDietForPatientDatabase.jsp" method="post">
        <!-- Add form fields for diet suggestion -->
        <label for="patientId">Patient ID:</label>
        <input type="text" id="patientId" name="patientId" value = <%= patientId %> required>
        <br>

        <label for="dietSuggestion">Diet Suggestion:</label>
        <input id="dietSuggestion" name="dietplan"  style="width: 200px; height: 30px;"  required/>
        <br>

        <button class="input-button" type="submit">Submit</button>
    </form>


</body>
</html>
