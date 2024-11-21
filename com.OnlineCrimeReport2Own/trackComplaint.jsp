<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Track Your Complaint - Online Crime Report Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="trackComplaintStyles.css">
</head>
<body>
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#">Crime Report System</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="userHome.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="complaint_form.jsp">File a Complaint</a></li>
                        <li class="nav-item"><a class="nav-link" href="trackComplaint.jsp">Track Complaint</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.html">LogIn</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="hero">
            <div class="hero-content">
                <h1>Track Your Complaint</h1>
                <p>Enter your complaint number to track its status.</p>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <section class="track-complaint py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="track-form p-4 border rounded shadow-sm">
                            <h2 class="text-center mb-4">Track Your Complaint</h2>
                            <form action="trackComplaintServlet" method="POST">
    							<div class="form-group">
    							    <label for="complaintNumber">EAN Number</label>
     							   <input type="text" class="form-control" id="complaintNumber" name="complaintNumber" required>
   								 </div>
  							  <button type="submit" class="btn btn-primary btn-block">Track</button>
						</form>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer>
        <div class="container text-center">
            <p>&copy; 2024 Online Crime Report Management. All rights reserved.</p>
            <p><a href="#">Feedback</a> | <a href="#">FAQ</a> | <a href="#">Contact Us</a> | <a href="#">Website Policies</a> | <a href="#">Privacy Policy</a> | <a href="#">Disclaimer</a></p>
            <p>Website Content Managed by Ministry of Home Affairs, Govt. of India.</p>
            <p>Best viewed in Mozilla Firefox, Google Chrome.</p>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
