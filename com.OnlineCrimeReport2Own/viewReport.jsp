<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Complaint Report</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="viewReport.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url("Images/bg2.jpeg") no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            position: relative; /* Added for positioning the back button */
        }
        .back-button {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #3498db;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s, transform 0.2s;
        }
        .back-button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-size: 28px;
        }
        .table-container {
            margin-top: 60px; /* Added margin to prevent overlap with back button */
            margin-bottom: 20px;
        }
        table.dataTable {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table.dataTable th, table.dataTable td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        table.dataTable th {
            background-color: #2c3e50;
            color: #ffffff;
            font-weight: 600;
            font-size: 16px;
        }
        table.dataTable td {
            background-color: #ffffff;
            color: #333;
        }
        table.dataTable td.description-cell {
            max-width: 300px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .btn-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .btn-group a, .btn-group button {
            background-color: #3498db;
            color: #ffffff;
            text-decoration: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s;
            border: none;
            cursor: pointer;
        }
        .btn-group a:hover, .btn-group button:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            .back-button {
                top: 15px;
                right: 15px;
                padding: 8px 16px;
                font-size: 14px;
            }
            .table-container {
                margin-top: 50px;
            }
            table.dataTable {
                display: block;
                overflow-x: auto;
                white-space: nowrap;
            }
            table.dataTable th, table.dataTable td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Back to Home Button -->
        <a href="adminHome.html" class="back-button">Back to Home</a>

        <h1>Complaint Reports</h1>
        <div class="table-container">
            <table id="complaintTable" class="display">
                <thead>
                    <tr>
                        <th>EAN</th>
                        <th>Name of Complainant</th>
                        <th>Mobile No</th>
                        <th>Aadhar No</th>
                        <th>Gender</th>
                        <th>Address</th>
                        <th>Subject</th>
                        <th>Date of Crime</th>
                        <th>Place of Crime</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        String url = "jdbc:mysql://localhost:3306/crimereport";
                        String user = "root";
                        String password = "sarana"; // Replace with your database password

                        try {
                            // Load JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            // Establish a connection
                            conn = DriverManager.getConnection(url, user, password);
                            // SQL query to fetch data
                            String sql = "SELECT * FROM complaint_form";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getString("ean_number") %></td>
                                    <td><%= rs.getString("complainant_name") %></td>
                                    <td><%= rs.getString("mobile_no") %></td>
                                    <td><%= rs.getString("aadhar_no") %></td>
                                    <td><%= rs.getString("gender") %></td>
                                    <td><%= rs.getString("address") %></td>
                                    <td><%= rs.getString("subject") %></td>
                                    <td><%= rs.getDate("date_of_crime") %></td>
                                    <td><%= rs.getString("place_of_crime") %></td>
                                    <td class="description-cell"><%= rs.getString("description") %></td>
                                </tr>
                                <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
                            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="btn-group">
            <button onclick="window.print();">Print Report</button>
            
        </div>
    </div>

    <!-- jQuery and DataTables scripts -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#complaintTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "info": true
            });
        });
    </script>
</body>
</html>
