<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registered FIRs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Hero Section */
        .hero {
            background: url('https://i.postimg.cc/bvq9hTyf/pexels-mark-d-aiuto-208201-750241.jpg') no-repeat center center/cover;
            position: relative;
            color: #fff;
            text-align: center;
            padding: 4rem 1rem;
            margin-bottom: 30px;
            overflow: hidden;
        }
        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            filter: blur(8px);
            z-index: -1;
        }
        .hero-content {
            position: relative;
            z-index: 1;
            background: rgba(0, 0, 0, 0.5);
            padding: 2rem;
            border-radius: 8px;
        }
        .hero h1 {
            font-size: 3rem;
            margin-bottom: 10px;
            animation: fadeIn 2s ease-in-out;
        }
        .hero p {
            font-size: 1.2rem;
            animation: fadeIn 2s ease-in-out 0.5s;
        }
        /* Back Button */
        .back-button {
            position: absolute;
            top: 20px;
            left: 20px;
            text-decoration: none;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
            z-index: 2; /* Ensure the button is above the hero content */
        }
        .back-button:hover {
            background-color: #0056b3;
            text-decoration: none;
        }
        /* Card Styles */
        .card {
            border: none;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .card:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .card-title {
            font-size: 1.5rem;
            color: #007bff;
            margin-bottom: 15px;
        }
        .card-text {
            font-size: 0.9rem;
            margin-bottom: 10px;
        }
        .status-solved {
            background-color: #28a745;
            color: #fff;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: bold;
        }
        .status-unsolved {
            background-color: #dc3545;
            color: #fff;
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: bold;
        }
        /* Footer */
        footer {
            background: #343a40;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            margin-top: 50px;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }
            .hero p {
                font-size: 1rem;
            }
            .card {
                padding: 15px;
            }
            .card-title {
                font-size: 1.25rem;
            }
        }
        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>

    <!-- Hero Section -->
    <div class="hero">
        <a href="adminHome.html" class="back-button">
            <i class="fas fa-arrow-left"></i> Back to Admin Home
        </a>
        <div class="hero-content">
            <h1>View Registered FIRs</h1>
            <p>Track the status of your filed complaints</p>
        </div>
    </div>

    <!-- Content Section -->
    <div class="container">
        <h1 class="my-4 text-center text-primary">Registered FIRs</h1>
        <div class="card-columns">
            <% 
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crimereport", "root", "sarana");
                
                // Create statement
                stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
                
                // Execute query
                String sql = "SELECT * FROM complaint_form";
                rs = stmt.executeQuery(sql);

                // Check if there are results
                if (!rs.next()) {
                    out.println("<p class='text-center text-danger'>No FIRs found.</p>");
                } else {
                    rs.beforeFirst(); // Move cursor back to the beginning
                    while (rs.next()) {
                        String ean_number = rs.getString("ean_number");
                        String complainant_name = rs.getString("complainant_name");
                        String mobile_no = rs.getString("mobile_no");
                        String aadhar_no = rs.getString("aadhar_no");
                        String gender = rs.getString("gender");
                        String address = rs.getString("address");
                        String subject = rs.getString("subject");
                        Date date_of_crime = rs.getDate("date_of_crime");
                        String place_of_crime = rs.getString("place_of_crime");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");

                        String statusText = (status == 1) ? "Solved" : "Unsolved";
                        String statusClass = (status == 1) ? "status-solved" : "status-unsolved";
            %>
            <div class="card mb-4">
                <div class="card-body">
                    <h5 class="card-title"><%= subject %></h5>
                    <p class="card-text"><strong>EAN Number:</strong> <%= ean_number %></p>
                    <p class="card-text"><strong>Complainant Name:</strong> <%= complainant_name %></p>
                    <p class="card-text"><strong>Mobile No:</strong> <%= mobile_no %></p>
                    <p class="card-text"><strong>Aadhar No:</strong> <%= aadhar_no %></p>
                    <p class="card-text"><strong>Gender:</strong> <%= gender %></p>
                    <p class="card-text"><strong>Address:</strong> <%= address %></p>
                    <p class="card-text"><strong>Date of Crime:</strong> <%= date_of_crime %></p>
                    <p class="card-text"><strong>Place of Crime:</strong> <%= place_of_crime %></p>
                    <p class="card-text"><strong>Description:</strong> <%= description %></p>
                    <p class="card-text"><span class="<%= statusClass %>"><%= statusText %></span></p>
                </div>
            </div>
            <% 
                    }
                }
            } catch (ClassNotFoundException e) {
                out.println("<p class='text-center text-danger'>JDBC Driver not found: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } catch (SQLException e) {
                out.println("<p class='text-center text-danger'>Database error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } catch (Exception e) {
                out.println("<p class='text-center text-danger'>An error occurred: " + e.getMessage() + "</p>");
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

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Crime Report System. All rights reserved.</p>
    </footer>
</body>
</html>
