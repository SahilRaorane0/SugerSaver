<%-- 
    Document   : PatientSignup
    Created on : 28-Nov-2023, 11:22:22?pm
    Author     : shubh
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String height = request.getParameter("height");
    String weight = request.getParameter("weight");
    String age = request.getParameter("age");
    String HBAIC = request.getParameter("HBAIC");
    String HBAIClevel = request.getParameter("HBAIClevel");
    String exercise = request.getParameter("exercise");
    String exerciseType = request.getParameter("exerciseType");
    String sugarIntake = request.getParameter("sugarIntake");
    String ongoingMedication = request.getParameter("ongoingMedication");
    String healthIssue = request.getParameter("healthIssue");
    String preferedMeal = request.getParameter("preferedMeal");

    String user=(String)session.getAttribute("user");
    String pwd = (String)session.getAttribute("pwd");

    
    // JDBC database connection parameters
    String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:XE";
    String dbUser = "hr";
    String dbPassword = "hr1";

    Connection conn = null;
    PreparedStatement ps1 = null;
    PreparedStatement ps2 = null;
    ResultSet rs2 = null;

    try {
        // Load the Oracle JDBC driver
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // Establish a connection
        conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        ps2 = conn.prepareStatement("SELECT PatientLoginID FROM PatientLogin WHERE USERNAME = ? AND UPASSWORD = ?");
        ps2.setString(1, user);
        ps2.setString(2, pwd); 
        
        rs2 = ps2.executeQuery();
        
        if (rs2.next()) {
            // Retrieve the PatientLoginID
            int patientLoginID = rs2.getInt("PatientLoginID");

            // Execute the second query using the retrieved PatientLoginID
            ps1 = conn.prepareStatement("UPDATE MedicalRecords SET PatientID = ?, P_Age = ?, PHeight = ?, PWeight = ?, LastHBA1CTestDate = TO_DATE(?, 'YYYY-MM-DD'),HBA1CLevel = ?, ExerciseFrequency = ?, ExerciseType = ?, SugarIntakeFrequency = ?, OngoingMedications = ?, HealthIssues = ?, PreferredMeal = ? WHERE PatientID = ?");

            ps1.setInt(1, patientLoginID);
            ps1.setString(2, age);
            ps1.setString(3, height);
            ps1.setString(4, weight);            
            ps1.setString(5, HBAIC);
            ps1.setString(6, HBAIClevel);
            ps1.setString(7, exercise);
            ps1.setString(8, exerciseType);
            ps1.setString(9, sugarIntake);
            ps1.setString(10, ongoingMedication);
            ps1.setString(11, healthIssue);
            ps1.setString(12, preferedMeal);
            ps1.setInt(13, patientLoginID);
            
            
            int rowsAffected = ps1.executeUpdate();
            if (rowsAffected > 0) {
                // If rows were affected, the insert was successful
                response.sendRedirect("PatientHomepage.jsp");
            } else {
                // If no rows were affected, the insert failed
                response.sendRedirect("Index.jsp");
            }
        }
        
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // You might want to add code to log or display the error message
        System.out.print(e);
    } catch(Exception e){
        e.printStackTrace();
        System.out.print(e);
    } 
    
    finally {
        // Close the resources in a finally block
        try {
            if (ps1 != null) ps1.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e);
        }
    }
%>