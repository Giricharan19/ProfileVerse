<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="form-container">
        <h2>Logout Successful</h2>
        <p>You have been logged out. <a href="login.jsp">Click here to log in again.</a></p>
    </div>

</body>
</html>
