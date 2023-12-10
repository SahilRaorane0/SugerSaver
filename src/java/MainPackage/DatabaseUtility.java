package MainPackage;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtility {

    private static final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:XE";
    private static final String DB_USER = "hr";
    private static final String DB_PASSWORD = "hr1";

    public static List<Patient> getPatientDetailsFromDatabase() {
        List<Patient> patients = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT PATIENTID,PATIENT_FNAME, PATIENT_EMAIL FROM PATIENT");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("PATIENTID");
                String name = resultSet.getString("PATIENT_FNAME");
                String email = resultSet.getString("PATIENT_EMAIL");

                patients.add(new Patient(id, name, email));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patients;
    }
}
