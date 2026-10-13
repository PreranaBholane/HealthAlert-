<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Registration</title>
    
    <!-- Link to external CSS -->
    <link rel="stylesheet" href="./resources/css/doctorRegister.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<center>

    <div class="register-container">
        <h2><i class="fas fa-user-md"></i> Doctor Registration</h2>
        <form action="RegisterDoctor" method="POST">
            
            <div class="form-group">
                <label for="doctorContact"> Contact Number</label>
                <div class="input-icon">
                <i class="fas fa-phone-alt"></i>
                <input type="tel" id="doctorContact" name="doctorContact" placeholder="Enter 10-digit contact" pattern="[0-9]{10}" maxlength="10" required />
                </div>
            </div>
            <br>

            <div class="form-group">
                <label for="doctorName"> Name</label>
                <div class="input-icon">
                <i class="fas fa-user"></i>
                <input type="text" id="doctorName" name="doctorName" placeholder="Enter full name" required />
                </div>
            </div>
            <br>

            <div class="form-group">
                <label for="doctorSpecialization"> Specialization</label>
                <div class="input-icon">
                <i class="fas fa-stethoscope"></i>
                <input type="text" id="doctorSpecialization" name="doctorSpecialization" placeholder="Enter specialization" required />
                </div>
            </div>
            <br>

            <div class="form-group">
                <label for="doctorEmail">Email</label>
                <div class="input-icon">
                <i class="fas fa-envelope"></i> 
                <input type="email" id="doctorEmail" name="doctorEmail" placeholder="Enter email" required />
                </div>
            </div>
            <br>

            <div class="form-group">
                <label for="doctorPassword"> Password</label>
                <div class="input-icon">
               	 <i class="fas fa-lock"></i>
                <input type="password" id="doctorPassword" name="doctorPassword" placeholder="Enter password" required />
                </div>
            </div>
            <br>

            <button type="submit" class="btn">Register</button>
        </form>
    </div>
</center>
</body>
</html>
