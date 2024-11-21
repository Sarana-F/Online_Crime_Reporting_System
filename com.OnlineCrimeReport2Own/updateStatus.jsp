<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Status Update</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            color: #343a40;
        }

        header {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .container {
            width: 80%;
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            text-align: center;
        }

        p {
            font-size: 18px;
            margin: 20px 0;
        }

        .status-success {
            color: #28a745;
            font-weight: bold;
        }

        .status-error {
            color: #dc3545;
            font-weight: bold;
        }

        .redirect-message {
            font-size: 16px;
            margin-top: 20px;
            color: #6c757d;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .container {
            animation: fadeIn 0.5s ease-in;
        }
    </style>
</head>
<body>
    <header>
        <h1>Status Update</h1>
    </header>
    <div class="container">
        <%
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/crimereport";
        String user = "root";
        String password = "sarana";

        // Retrieve parameters
        String ean_number = request.getParameter("ean_number");
        int newStatus = Integer.parseInt(request.getParameter("update"));

        // Establish connection
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);

            // Update the status
            String sql = "UPDATE complaint_form SET status = ? WHERE ean_number = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, newStatus);
            pstmt.setString(2, ean_number);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                out.println("<p class='status-success'>Status updated successfully!</p>");
            } else {
                out.println("<p class='status-error'>Error: Could not update status.</p>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p class='status-error'>Error occurred: " + e.getMessage() + "</p>");
        } finally {
            // Close resources
            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        // Redirect back to the status page
        out.println("<p class='redirect-message'>Redirecting to status page...</p>");
        response.setHeader("Refresh", "2; URL=status.jsp");
        %>
    </div>
</body>
</html>
