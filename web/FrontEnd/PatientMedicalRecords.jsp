<!-- medical_records.html -->
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Routine Diabetes Encounter</title>
      <link rel="stylesheet" href="style.css" />
    </head>
    <body class="medical-details-page">
    <%
        // JDBC database connection parameters
        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
        String dbUser = "hr";
        String dbPassword = "hr1";

        String user=(String)session.getAttribute("user");
        String pwd = (String)session.getAttribute("pwd");

        Integer age = null;
        Integer height = null;
        Integer weight = null;
        Date date = null;
        Integer HBA1C = null;
        String ef = null;
        String et = null;
        String sif = null;
        String ogm = null;
        String hi = null;
        String pm = null;
        
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
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM MedicalRecords WHERE PATIENTID = ?");
                ps.setInt(1, patientLoginID);

                ResultSet rs = ps.executeQuery();

                // Process the result set
                if (rs.next()) {
                    // Retrieve patient details from the result set
                    //fName = rs.getString("PATIENT_FNAME");
                    age = rs.getInt("P_Age");
                    height = rs.getInt("PHeight");
                    weight = rs.getInt("PWeight");
                    date = rs.getDate("LastHBA1CTestDate");
                    HBA1C = rs.getInt("HBA1CLevel");
                    ef = rs.getString("ExerciseFrequency");
                    et = rs.getString("ExerciseType");
                    sif = rs.getString("SugarIntakeFrequency");
                    ogm = rs.getString("OngoingMedications");
                    hi = rs.getString("HealthIssues");
                    pm = rs.getString("PreferredMeal");
                }

                // Close the result set and statement
                rs.close();
                ps.close();
            } else {
                // Handle the case where the username and password are not valid
                out.println("Invalid username or password");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            System.out.print(e);
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
      <h1>Routine Diabetes Encounter</h1>

      <form id="diabetesEncounterForm" action="UpdatePatientMedicalRecord.jsp" method="post">

        <label for="height">Height:</label>
        <input type="text" id="height" name="height" value="<%= height %>"required />
        <br />

        <label for="weight">Weight:</label>
        <input type="text" id="weight" name="weight" value="<%= weight %>" required />
        <br />

        <label for="age">Age:</label>
        <input type="number" id="age" name="age" value="<%= age %>" required />
        <br />

        <label for="HBAIC">When was the last HBAIC test done?</label>
        <input type="date" id="HBAIC" name="HBAIC" value="<%= date %>" required />
        <br />

        <label for="HBAIClevel">HBAIC level:</label>
        <input type="number" id="HBAIClevel" name="HBAIClevel" value="<%= HBA1C %>"  required />
        <br />

        <label for="exercise">How frequently do you exercise? </label>
        <input type="text" id="exercise" name="exercise" value="<%= ef %>" required />
        <br />

        <label for="exerciseType">What type of exercise exercise? </label>
        <input
          type="text"
          id="exerciseType"
          name="exerciseType"
          rows="4"
          value="<%= et %>"
        />
        <br />

        <label for="sugarIntake">How frequent is sugar intake? </label>
        <input type="text" id="sugarIntake" name="sugarIntake" value="<%= sif %>"  required />
        <br />

        <!-- Patient Status -->
        <label>Any on going medication?:</label>
          <input
          type="text"
          id="ongoingMedication"
          name="ongoingMedication"
          rows="4"
          value="<%= ogm %>"
        />
        <br />

        <label for="healthIssue">Any health issue? :</label>
        <input type="text" id="healthIssue" name="healthIssue" style="width: 200px; height: 30px;" value="<%= hi %>" required>
        <br />

        <label for="preferedMeal">What is your prefered meal? </label>
        <select id="preferedMeal" name="preferedMeal">
            <option value="veg" <%= "veg".equals(pm) ? "selected" : "" %>>Vegetarian</option>
            <option value="nonveg" <%= "nonveg".equals(pm) ? "selected" : "" %>>Non-Vegetarian</option>
            <option value="vegan" <%= "vegan".equals(pm) ? "selected" : "" %>>Vegan</option>
            <option value="any" <%= "any".equals(pm) ? "selected" : "" %>>Any</option>
        </select>
        <br />
        <button class="input-button" type="submit">Submit</button>
        <script src="doctorHome.js"></script>
    </form>
  </body>
</html>
