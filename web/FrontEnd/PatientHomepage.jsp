<%-- 
    Document   : PatientHomepage
    Created on : 28-Nov-2023, 8:15:19 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Home Page</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .form_style {
            position: absolute;
            right: 0;
            width: 100px;
            height: 120px;
        }
    </style>
</head>
<body class="home-page">
    <h1>Welcome to Your Home Page</h1>

    <div class="options-container">
        <button class="input-button" onclick="navigateTo('personalDetails')">Personal Details</button>
        <button class="input-button" onclick="navigateTo('medicalRecords')">Medical Records</button>
        <button class="input-button" onclick="navigateTo('dietHistory')">Diet History</button>
    </div>
    <div class="form_style">
        <button class="input-button" onclick="navigateTo('logOut')">LogOut</button>
    </div>
    <script src="home.js"></script>
</body>
</html>

