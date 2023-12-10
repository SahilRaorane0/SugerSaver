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
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr1";

        String DP = null;
        String PID = null;
        
        String user=(String)session.getAttribute("user");
        String pwd = (String)session.getAttribute("pwd");
            
        Connection conn = null;
        PreparedStatement ps1 = null;
        ResultSet rs1 = null;

        try {
           
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Establish a connection
            conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);

            ps1 = conn.prepareStatement("SELECT PatientLoginID FROM PatientLogin WHERE USERNAME = ? AND UPASSWORD = ?");
            ps1.setString(1, user);
            ps1.setString(2, pwd);

            rs1 = ps1.executeQuery();

            if (rs1.next()) {
                // Retrieve the PatientLoginID
                int patientLoginID = rs1.getInt("PatientLoginID");

                // Execute the second query using the retrieved PatientLoginID
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM DietPlan WHERE PATIENTID = ?");
                ps.setInt(1, patientLoginID);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                  // Retrieve patient details from the result set
                  DP = rs.getString("Dietplan");
                  PID = rs.getString("PATIENTID");
                  
                rs.close();
                ps.close();
              }
            }
        }catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
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
    <form>
        <!-- Add form fields for diet suggestion -->
        <label for="patientId">Patient ID:</label>
        <input type="text" id="patientId" name="patientId" value = <%= PID %> required>
        <br>

        <label for="dietSuggestion">Diet Suggestion:</label>
        <textarea id="dietSuggestion" name="dietplan" style= "width: 200px; height: 30px;" required><%= DP %> </textarea>
        <br>

    </form>


</body>
</html>
