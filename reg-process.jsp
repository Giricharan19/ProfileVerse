<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%> 
<%@page import="java.sql.*,java.util.*"%> 
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String education = request.getParameter("education");
    String certifications = request.getParameter("certifications");
    String hobbies = request.getParameter("hobbies");

    // Ensure all values are captured
    if (name != null && email != null && password != null && education != null && certifications != null && hobbies != null) {
        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.driver.OracleDriver"); 
            
            // Establish Connection
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "manager");
            
            // Prepare SQL Insert Query (use PreparedStatement to avoid SQL injection)
            String query = "INSERT INTO users1 (name, email, password, education, certifications, hobbies) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            // Set parameters
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, education);
            ps.setString(5, certifications);
            ps.setString(6, hobbies);

            // Execute Update
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("Thank you for registering! Please <a href='login.html'>Login</a> to continue.");
            } else {
                out.println("Registration failed. Please try again.");
            }

            // Close resources
            ps.close();
            con.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("Please fill out all fields.");
    }
%>

