<!-- adminHome.html -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home Page</title>
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
        <button class="input-button" onclick="navigateTo('adminPersonalDetails')">Admin Personal Details</button>
        <button class="input-button" onclick="navigateTo('patients')">Patients</button>
        <button class="input-button" onclick="navigateTo('doctors')">Doctors</button>
    </div>
    <div class="form_style">
        <button class="input-button" onclick="navigateTo('logOut')">LogOut</button>
    </div>
    <script src="adminHome.js"></script>
</body>
</html>




