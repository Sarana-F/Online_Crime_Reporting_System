<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Complaint</title>
    <meta name="description" content="Complaint registration form for the Crime Reporting System">
    <meta name="keywords" content="Complaint, Register, Crime Reporting">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,500,600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="complaintStyles.css">
    <style>
        /* General styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: url("Images/bg2.jpeg") no-repeat center center fixed;
            background-size: cover;
            overflow-x: hidden;
        }

        /* Container styling */
        .container {
            width: 90%;
            max-width: 900px;
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white */
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        /* Header styling */
        header {
            background-color: #1d72b8;
            color: white;
            padding: 15px;
            text-align: center;
            border-radius: 10px 10px 0 0;
            font-size: 26px;
            font-weight: 500;
        }

        /* Section styling */
        .section {
            margin-bottom: 20px;
        }

        .section h2 {
            font-size: 22px;
            color: #333;
            margin-bottom: 15px;
            border-bottom: 2px solid #1d72b8;
            padding-bottom: 10px;
        }

        /* Field styling */
        .fields-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .field {
            flex: 1;
            min-width: 250px;
            margin-bottom: 15px;
        }

        .field label {
            display: block;
            font-size: 15px;
            font-weight: 500;
            color: #555;
            margin-bottom: 8px;
        }

        .field input, .field select, .field textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s, box-shadow 0.3s;
            background-color: #f9f9f9;
        }

        .field input:focus, .field select:focus, .field textarea:focus {
            border-color: #1d72b8;
            box-shadow: 0 0 8px rgba(29, 114, 184, 0.3);
            outline: none;
        }

        .field textarea {
            resize: vertical;
        }

        /* Validation message styling */
        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            display: none; /* Hidden by default */
        }

        /* Button styling */
        .buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        .btn-cancel, .btn-submit {
            font-size: 16px;
            font-weight: 500;
            border: none;
            border-radius: 6px;
            padding: 12px 24px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn-cancel {
            background-color: #e74c3c;
            color: white;
        }

        .btn-cancel:hover {
            background-color: #c0392b;
            transform: translateY(-2px);
        }

        .btn-submit {
            background-color: #3498db;
            color: white;
        }

        .btn-submit:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }
    </style>
    <script>
        // Function to set the current date in the date input field
        function setCurrentDate() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('date').value = today;
        }

        // Call the setCurrentDate function when the page loads
        window.onload = setCurrentDate;

        // Validation function for the form
        function validateForm() {
            const dateInput = document.getElementById('date');
            const today = new Date().toISOString().split('T')[0];

            const mobileInput = document.getElementById('mobile');
            const aadharInput = document.getElementById('aadhar');

            // Validate date
            if (dateInput.value > today) {
                alert("The date of occurrence cannot be in the future.");
                return false;
            }

            // Validate mobile number
            const mobilePattern = /^[6-9]\d{9}$/; // Must start with 6, 7, 8, or 9 and be 10 digits
            if (!mobilePattern.test(mobileInput.value)) {
                alert("Please enter a valid 10-digit mobile number starting with 6, 7, 8, or 9.");
                return false;
            }

            // Validate Aadhar number
            const aadharPattern = /^\d{12}$/; // Must be exactly 12 digits
            if (!aadharPattern.test(aadharInput.value)) {
                alert("Please enter a valid 12-digit Aadhar number.");
                return false;
            }

            return true; // All validations passed
        }
    </script>
</head>
<body>
    <div class="container">
        <header><i class="fas fa-file-alt"></i> Register Complaint</header>
        <form action="submitComplaint.jsp" method="POST" onsubmit="return validateForm()">
            <!-- Complainant Details -->
            <div class="section">
                <h2>Details of Complainant</h2>
                <div class="fields-container">
                    <div class="field">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="field">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="field">
                        <label for="mobile">Mobile No:</label>
                        <input type="tel" id="mobile" name="mobile" required>
                        <span id="mobile-error" class="error-message">Please enter a valid 10-digit mobile number starting with 6, 7, 8, or 9.</span>
                    </div>
                    <div class="field">
                        <label for="aadhar">Aadhar No:</label>
                        <input type="text" id="aadhar" name="aadhar" required>
                        <span id="aadhar-error" class="error-message">Please enter a valid 12-digit Aadhar number.</span>
                    </div>
                    <div class="field">
                        <label for="address">Address:</label>
                        <textarea id="address" name="address" rows="2" required></textarea>
                    </div>
                </div>
            </div>

            <!-- Complaint Details -->
            <div class="section">
                <h2>Details of Complaint</h2>
                <div class="fields-container">
                    <div class="field">
                        <label for="subject">Subject:</label>
                        <select id="subject" name="subject" required>
                            <option value="Theft">Theft</option>
                            <option value="Assault">Assault</option>
                            <option value="Fraud">Fraud</option>
                            <option value="Vandalism">Vandalism</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="field">
                        <label for="date">Date of Occurrence:</label>
                        <input type="date" id="date" name="date" required>
                    </div>
                    <div class="field">
                        <label for="place">Place of Occurrence:</label>
                        <input type="text" id="place" name="place" required>
                    </div>
                    <div class="field">
                        <label for="description">Description:</label>
                        <textarea id="description" name="description" rows="3" required></textarea>
                    </div>
                </div>
            </div>

            <!-- Buttons -->
            <div class="buttons">
                <a href="userHome.jsp" class="btn-cancel">Back to Home</a>
                <button type="submit" class="btn-submit">Register</button>
            </div>
        </form>
    </div>
</body>
</html>