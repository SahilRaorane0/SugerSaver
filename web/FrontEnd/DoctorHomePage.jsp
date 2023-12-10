<%-- 
    Document   : DoctorHomePage
    Created on : 28-Nov-2023, 10:03:56 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- doctorHome.html -->
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Home Page</title>
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
        <button class='input-button' onclick="navigateDoctorTo('doctorPersonalDetails');">
            Personal Details
        </button>
        <button class='input-button' onclick="navigateDoctorTo('patientsList');">
            Patients List
        </button>
    </div>
    <div class="form_style">
        <button class="input-button" onclick="navigateTo('logOut')">LogOut</button>
    </div>
</body>
<script type="text/javascript" src="home.js"></script>
<script type="text/javascript" src="doctorHome.js"></script>
</html>
