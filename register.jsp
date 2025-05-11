<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Personal Portfolio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #001f3f;
            color: white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .register-container {
            background-color: #003366;
            padding: 20px 40px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }
        .register-container h2 {
            margin-bottom: 20px;
            text-align: center;
            color: yellow;
        }
        .register-container label {
            display: block;
            margin: 10px 0 5px;
        }
        .register-container input,
        .register-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: none;
            font-size: 14px;
        }
        .register-container button {
            width: 100%;
            padding: 10px;
            background-color: blue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .register-container button:hover {
            background-color: yellow;
            color: black;
            transform: scale(1.05);
        }
        .register-container button:active {
            transform: scale(0.95);
        }
        .notification {
            display: none;
            margin-top: 20px;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
        }
        .success {
            background-color: green;
            color: white;
        }
    </style>
</head>
<body>

    <div class="register-container">
        <h2>Register</h2>
        <form action="reg-process.jsp" method="post">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" placeholder="Your Full Name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Your Email" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Create a Password" required>
            
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
            
            <label for="education">Education:</label>
            <textarea id="education" name="education" placeholder="List your educational qualifications" required></textarea>
            
            <label for="certifications">Certifications:</label>
            <textarea id="certifications" name="certifications" placeholder="List your certifications" required></textarea>
            
            <label for="hobbies">Hobbies:</label>
            <textarea id="hobbies" name="hobbies" placeholder="List your hobbies" required></textarea>
            
            <button type="submit">Register</button>
        </form>

        <%
            // Handle form submission and database insertion
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String education = request.getParameter("education");
            String certifications = request.getParameter("certifications");
            String hobbies = request.getParameter("hobbies");

            if (name != null && email != null && password != null && education != null && certifications != null && hobbies != null) {
                try {
                    // Database connection details
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "your_username", "your_password");

                    // SQL Insert Query
                    String query = "INSERT INTO users (name, email, password, education, certifications, hobbies) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps = con.prepareStatement(query);

                    // Set parameters
                    ps.setString(1, name);
                    ps.setString(2, email);
                    ps.setString(3, password);
                    ps.setString(4, education);
                    ps.setString(5, certifications);
                    ps.setString(6, hobbies);

                    // Execute query
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<div class='notification success'>🎉 Registration successful! Welcome aboard! 🎉</div>");
                    } else {
                        out.println("<div class='notification error'>Error: Unable to register. Please try again later.</div>");
                    }

                    // Close resources
                    ps.close();
                    con.close();
                } catch (Exception e) {
                    out.println("<div class='notification error'>Error: " + e.getMessage() + "</div>");
                }
            }
        %>
    </div>
</body>
</html>
