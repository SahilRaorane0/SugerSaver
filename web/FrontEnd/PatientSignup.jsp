<%-- 
    Document   : PatientSignup
    Created on : 29-Nov-2023, 12:09:44 am
    Author     : shubh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css" />
        
    </head>
    <body class="home">
        <div id="patientSignup" class="login-container"">
        <h2>Patient Sign Up</h2>
        <form id="patientSignupForm1" action="PatientSignupDatabase.jsp" method="post">
          <input name="pUsid" type="text" placeholder="Username" required />
          <br />
          <input name="pPwd" type="password" placeholder="Password" required />
          <br />
          <input name="pEmail"type="email" placeholder="Email" required />
          <br />
          <button type="submit">Sign Up</button>
        </form>
      </div>
    </body>
</html>
