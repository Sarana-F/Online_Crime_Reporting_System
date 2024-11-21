<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaint Details - Online Crime Report Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: url("Images/background4.jpg") no-repeat center center/cover;
            color: #333;
            font-family: 'Poppins', sans-serif;
        }

        .container {
            background: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            margin-top: 50px;
        }

        h1 {
            color: #007bff;
        }

        .complaint-details {
            margin-top: 20px;
        }

        .btn-back {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Complaint Details</h1>
        <div class="complaint-details">
            <p><strong>EAN Number:</strong> ${eanNumber}</p>
            <p><strong>Complainant Name:</strong> ${complainantName}</p>
            <p><strong>Mobile No:</strong> ${mobileNo}</p>
            <p><strong>Aadhar No:</strong> ${aadharNo}</p>
            <p><strong>Gender:</strong> ${gender}</p>
            <p><strong>Address:</strong> ${address}</p>
            <p><strong>Subject:</strong> ${subject}</p>
            <p><strong>Date of Crime:</strong> ${dateOfCrime}</p>
            <p><strong>Place of Crime:</strong> ${placeOfCrime}</p>
            <p><strong>Description:</strong> ${description}</p>
            <p><strong>Status:</strong> ${status == 1 ? "Resolved" : "Pending"}</p>
        </div>
        <a href="userHome.jsp" class="btn btn-primary btn-back">Back to Home</a>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
