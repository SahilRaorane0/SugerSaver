<%-- 
    Document   : IndexDatabase
    Created on : 28-Nov-2023, 8:11:16?pm
    Author     : shubh
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.IOException" %>

<%
    String user = request.getParameter("Puser");
    String pwd = request.getParameter("Ppwd");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr1");

        // Use PreparedStatement to prevent SQL injection
        PreparedStatement ps = conn.prepareStatement("SELECT PatientLoginID FROM PatientLogin WHERE USERNAME = ? AND UPASSWORD = ?");
        ps.setString(1, user);
        ps.setString(2, pwd);   
        
        session.setAttribute("user",user);
        session.setAttribute("pwd",pwd);
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            // Valid user, redirect to a new page
            response.sendRedirect("PatientHomepage.jsp");
        } else {
            // Invalid user, display an error message
            %>
            <script type="text/javascript">
                  alert("Invalid username or password.");
            </script>
            <%
            response.sendRedirect("Index.jsp"); // You might want to include an error parameter
        }

        // Close resources
        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
