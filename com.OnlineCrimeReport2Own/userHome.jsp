<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Online Crime Report Management - Report crimes, track their status, and contribute to community safety.">
    <title>Online Crime Report Management - Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="userHomeStyles.css">
</head>
<body>
    <!-- Header -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#"><h1>Crime Report System</h1></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="userHome.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="complaint_form.jsp">File a Complaint</a></li>
                        <li class="nav-item"><a class="nav-link" href="login.html">LogIn</a></li>
                        <!-- Logout Button -->
                        <li class="nav-item">
                            <form action="logout" method="post" class="d-inline">
                                <button type="submit" class="btn btn-link nav-link" style="color: white;">Logout</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="hero">
            <div class="hero-content">
                <h3>Welcome to the Crime Report System</h3>
                <p>Report crimes, track their status, and contribute to community safety.</p>
                <div class="btn-group mt-4">
                    <a href="complaint_form.jsp" class="btn btn-light btn-lg slide-btn">File a Complaint</a>
                    <a href="trackComplaint.jsp" class="btn btn-light btn-lg slide-btn">Track a Complaint</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <section class="about py-5">
            <div class="container text-center">
                <h2>About Us</h2>
                <p>Our platform offers a simple and effective way to report and track crime incidents. We strive to enhance community safety with our user-friendly reporting system.</p>
            </div>
        </section>
        <section class="features py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 text-center mb-4 mb-md-0">
                        <div class="feature-item p-4 border rounded shadow-sm">
                            <i class="fas fa-pencil-alt fa-3x mb-3"></i>
                            <h3>Easy Reporting</h3>
                            <p>Submit your crime reports quickly and easily with our intuitive interface.</p>
                        </div>
                    </div>
                    <div class="col-md-4 text-center mb-4 mb-md-0">
                        <div class="feature-item p-4 border rounded shadow-sm">
                            <i class="fas fa-search fa-3x mb-3"></i>
                            <h3>Track Reports</h3>
                            <p>Keep an eye on the status of your reports and stay updated on progress.</p>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="feature-item p-4 border rounded shadow-sm">
                            <i class="fas fa-shield-alt fa-3x mb-3"></i>
                            <h3>Secure & Confidential</h3>
                            <p>We ensure that all reports are handled with the highest level of security and confidentiality.</p>
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
    <script src="userHomeScripts.js"></script>
</body>
</html>
