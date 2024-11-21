<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Complaint Status</title>
    <link rel="stylesheet" href="status.css"> <!-- Ensure this path is correct -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        header {
            margin-bottom: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 300px;
        }
        .card-header {
            background-color: #007bff;
            color: #fff;
            padding: 15px;
        }
        .card-body {
            padding: 15px;
        }
        .card-footer {
            padding: 15px;
            text-align: center;
            background-color: #f8f9fa;
        }
        .update-button-green {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .update-button-green:hover {
            background-color: #218838;
        }
        .update-button-red {
            background-color: #dc3545;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        .update-button-red:hover {
            background-color: #c82333;
        }
        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }
        .back-button:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <header>
        <h1>Update Complaint Status</h1>
        <a href="adminHome.html" class="back-button">
            <i class="fas fa-arrow-left"></i> Back to Admin Home
        </a>
    </header>
    <div class="container">
        <div class="card-container">
            <% 
            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/crimereport";
            String user = "root";
            String password = "sarana";

            // Establish connection
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, password);
                stmt = con.createStatement();
                // SQL query to order complaints by status: unsolved (0) first, then solved (1)
                String sql = "SELECT ean_number, complainant_name, description, status FROM complaint_form ORDER BY status ASC";
                rs = stmt.executeQuery(sql);
            %>
            <% 
            // Iterate over the result set and display the data
            while (rs.next()) {
                String ean_number = rs.getString("ean_number");
                String complainant_name = rs.getString("complainant_name");
                String description = rs.getString("description");
                int status = rs.getInt("status");

                String statusText = (status == 1) ? "Solved" : "Unsolved";
                String statusValue = (status == 1) ? "0" : "1"; // for toggling the status
                String buttonClass = (status == 1) ? "update-button-green" : "update-button-red";
            %>
            <div class="card">
                <div class="card-header">
                    <h3>Complaint EAN: <%= ean_number %></h3>
                </div>
                <div class="card-body">
                    <p><strong>Complainant Name:</strong> <%= complainant_name %></p>
                    <p><strong>Description:</strong> <%= description %></p>
                    <p><strong>Status:</strong> <%= statusText %></p>
                </div>
                <div class="card-footer">
                    <form action="updateStatus.jsp" method="POST">
                        <input type="hidden" name="ean_number" value="<%= ean_number %>">
                        <input type="hidden" name="current_status" value="<%= status %>">
                        <button class="<%= buttonClass %>" type="submit" name="update" value="<%= statusValue %>">
                            Update to <%= (status == 1) ? "Unsolved" : "Solved" %>
                        </button>
                    </form>
                </div>
            </div>
            <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            %>
        </div>
    </div>
</body>
</html>
