<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Submission Status</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding: 50px;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        .message h2 {
            color: #d9534f; /* Red color for error messages */
            font-weight: 500;
        }
        .message p {
            color: #333;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="message">
        <%
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String mobile = request.getParameter("mobile");
            String aadhar = request.getParameter("aadhar");
            String address = request.getParameter("address");
            String subject = request.getParameter("subject");
            String date = request.getParameter("date");
            String place = request.getParameter("place");
            String description = request.getParameter("description");

            Connection conn = null;
            PreparedStatement pstmt = null;
            Statement stmt = null;
            ResultSet rs = null;
            String url = "jdbc:mysql://localhost:3306/crimereport";
            String user = "root";
            String password = "sarana"; // Replace with your database password

            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection
                conn = DriverManager.getConnection(url, user, password);

                // SQL query to insert data
                String sql = "INSERT INTO complaint_form (complainant_name, mobile_no, aadhar_no, gender, address, subject, date_of_crime, place_of_crime, description) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

                // Set parameters
                pstmt.setString(1, name);
                pstmt.setString(2, mobile);
                pstmt.setString(3, aadhar);
                pstmt.setString(4, gender);
                pstmt.setString(5, address);
                pstmt.setString(6, subject);
                pstmt.setDate(7, java.sql.Date.valueOf(date));
                pstmt.setString(8, place);
                pstmt.setString(9, description);

                // Execute the update
                int rowsInserted = pstmt.executeUpdate();

                if (rowsInserted > 0) {
                    // Retrieve the generated key
                    rs = pstmt.getGeneratedKeys();
                    if (rs.next()) {
                        int eanNumber = rs.getInt(1); // Assuming ean_number is the auto-increment column
                        out.println("<h2>Complaint registered successfully!</h2>");
                        out.println("<p>Your complaint has been registered with EAN Number: <strong>" + eanNumber + "</strong></p>");
                    } else {
                        out.println("<h2>Complaint registered successfully!</h2>");
                        out.println("<p>Unfortunately, we could not retrieve your EAN Number. Please note it down manually.</p>");
                    }

                    // JavaScript for redirection
                    out.println("<script type='text/javascript'>");
                    out.println("setTimeout(function() {");
                    out.println("    window.location.href = 'userHome.jsp';");
                    out.println("}, 7000);"); // Redirect after 2.5 seconds
                    out.println("</script>");
                } else {
                    out.println("<h2>Failed to register the complaint. Please try again.</h2>");
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h2>Error occurred: " + e.getMessage() + "</h2>");
            } finally {
                // Close resources
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </div>
</body>
</html>
