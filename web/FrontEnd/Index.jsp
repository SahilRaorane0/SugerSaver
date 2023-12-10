<%-- 
    Document   : Index
    Created on : 28-Nov-2023, 7:41:31 pm
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sugar Saver</title>
    <link rel="stylesheet" href="style.css" />
  </head>
  <body class="home">
    <div class="options-container">
      <a href="#" onclick="showLogin('patient')">Patient</a>
      <a href="#" onclick="showLogin('doctor')">Doctor</a>
      <a href="#" onclick="showLogin('admin')">Admin</a>
    </div>

    <div id="patientLogin" class="login-container">
      <h2>Patient Login</h2>
      <form id="patientLoginForm" action="IndexDatabaseForPatient2.jsp" method="post">
        <input name="Puser" id="PUsername"  type="text" placeholder="Username" required />
        <br />
        <input name="Ppwd" id="Ppwd" type="password" placeholder="Password" required />
        <br />
        <button type="submit">Login</button>
        <p><a href="#" onclick="forgotPassPatient('patient')">Forgot Password?</a></p>
        <p>
          Don't have an account?
          <a href="#" onclick="showSignup('patient')">Sign Up</a>
        </p>
      </form>
    </div>
      

    <div id="doctorLogin" class="login-container">
      <h2>Doctor Login</h2>
      <form id="doctorLoginForm"action="IndexDatabaseForDoctor.jsp" method="post">
        <input name="Duser" id="DUsername" type="text" placeholder="Username" required />
        <br />
        <input name="Dpwd" id="DPwd" type="password" placeholder="Password" required />
        <br />
        <button type="submit">Login</button>
        <p><a href="#" onclick="forgotPassDoctor('doctor')">Forgot Password?</a></p>
        <p>
          Don't have an account?
          <a href="#" onclick="showSignup('doctor')">Sign Up</a>
        </p>
      </form>
    </div>

    <div id="adminLogin" class="login-container">
      <h2>Admin Login</h2>
      <form id="adminLoginForm" action="IndexDatabaseForAdmin.jsp">
        <input name="Auser" id="AUsername" type="text" placeholder="Username" required />
        <br />
        <input name="Apwd" id="APwd" type="password" placeholder="Password" required />
        <br />
        <button type="submit">Login</button>
        <p><a href="#" onclick="forgotPassAdmin('admin')">Forgot Password?</a></p>
      </form>
    </div>

    <div id="patientSignup" class="signup-container">
      <h2>Patient Sign Up</h2>
      <form id="patientSignupForm" action="PatientSignupDatabase.jsp" method="post">
        <input name="pUsid" type="text" placeholder="Username" required />
        <br />
        <input name="pPwd" type="password" placeholder="Password" required />
        <br />
        <input name="pEmail" type="email" placeholder="Email" required />
        <br />
        <button type="submit">Sign Up</button>
      </form>
    </div>

    <div id="doctorSignup" class="signup-container">
      <h2>Doctor Sign Up</h2>
      <form id="doctorSignupForm" action="DoctorSignupDatabase.jsp" method="post">
        <input name="dUsr" type="text" placeholder="Username" required />
        <br />
        <input name="dPwd" type="password" placeholder="Password" required />
        <br />
        <input name="dEmail" type="email" placeholder="Email" required />
        <br />
        <button type="submit">Sign Up</button>
      </form>
    </div>

    <div id="forgotPasswordPatient" class="f_password-container">
        <h2>Forgot Password</h2>
        <form id="forgetPasswordPatientForm" action="ForgotPasswordForPatient.jsp" method="post">
            <input name="pUsr" type="text" placeholder="Username" required>
            <br>
            <input name="npPwd" type="password" placeholder="New Password" required>
            <br>
            <input name="cpPwd" type="password" placeholder="Confirm Password" required>
            <br>
            <button type="submit">Confirm</button>
        </form>
    </div>

    <div id="forgotPasswordDoctor" class="f_password-container">
        <h2>Forgot Password</h2>
        <form id="forgetPasswordDoctorForm"action="ForgotPasswordForDoctor.jsp" method="post">
            <input name="dUsr"  type="text" placeholder="Username" required>
            <br>
            <input name="ndPwd" type="password" placeholder="New Password" required>
            <br>
            <input name="cdPwd" type="password" placeholder="Confirm Password" required>
            <br>
            <button type="submit">Confirm</button>
        </form>
    </div>

    <div id="forgotPasswordAdmin" class="f_password-container">
        <h2>Forgot Password</h2>
        <form id="forgetPasswordAdminForm" action="ForgotPasswordForAdmin.jsp" method="post">
            <input name="aUsr" type="text" placeholder="Username" required>
            <br>
            <input name="naPwd" type="password" placeholder="New Password" required>
            <br>
            <input name="caPwd" type="password" placeholder="Confirm Password" required>
            <br>
            <button type="submit" >Confirm</button>
        </form>
    </div>

    <script src="script.js"></script>
  </body>
</html>

