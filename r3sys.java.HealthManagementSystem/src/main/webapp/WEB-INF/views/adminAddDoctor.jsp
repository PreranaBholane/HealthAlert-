<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Doctor | HealthAlert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --danger: #f72585;
            --success: #4ad66d;
            --dark: #212529;
            --light: #f8f9fa;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f6f9fc 0%, #eef2f5 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* Form Container */
        .register-container {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            padding: 2rem;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-top: 4px solid var(--primary);
            animation: fadeInUp 0.6s ease-out;
        }

        /* Header */
        .register-container h2 {
            font-family: 'Montserrat', sans-serif;
            color: var(--dark);
            margin-bottom: 1.5rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .register-container h2 i {
            color: var(--primary);
            font-size: 1.5rem;
        }

        /* Form Groups */
        .form-group {
            margin-bottom: 1.2rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
            font-size: 0.9rem;
        }

        /* Input Fields */
        .input-icon {
            position: relative;
        }

        .input-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary);
            font-size: 1rem;
        }

        .input-icon input {
            width: 100%;
            padding: 12px 15px 12px 40px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background-color: rgba(240, 240, 240, 0.3);
        }

        .input-icon input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
            outline: none;
            background-color: white;
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 480px) {
            .register-container {
                padding: 1.5rem;
            }
            
            .register-container h2 {
                font-size: 1.3rem;
            }
            
            .input-icon input {
                padding: 10px 12px 10px 36px;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2><i class="fas fa-user-md"></i> Doctor Registration</h2>
        <form action="RegisterDoctor" method="POST">
            
            <div class="form-group">
                <label for="doctorContact">Contact Number</label>
                <div class="input-icon">
                    <i class="fas fa-phone-alt"></i>
                    <input type="tel" id="doctorContact" name="doctorContact" placeholder="Enter 10-digit contact" pattern="[0-9]{10}" maxlength="10" required />
                </div>
            </div>

            <div class="form-group">
                <label for="doctorName">Name</label>
                <div class="input-icon">
                    <i class="fas fa-user"></i>
                    <input type="text" id="doctorName" name="doctorName" placeholder="Enter full name" required />
                </div>
            </div>

            <div class="form-group">
                <label for="doctorSpecialization">Specialization</label>
                <div class="input-icon">
                    <i class="fas fa-stethoscope"></i>
                    <input type="text" id="doctorSpecialization" name="doctorSpecialization" placeholder="Enter specialization" required />
                </div>
            </div>

            <div class="form-group">
                <label for="doctorEmail">Email</label>
                <div class="input-icon">
                    <i class="fas fa-envelope"></i> 
                    <input type="email" id="doctorEmail" name="doctorEmail" placeholder="Enter email" required />
                </div>
            </div>

            <div class="form-group">
                <label for="doctorPassword">Password</label>
                <div class="input-icon">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="doctorPassword" name="doctorPassword" placeholder="Enter password" required />
                </div>
            </div>

            <button type="submit" class="btn">
                <i class="fas fa-user-plus"></i> Register Doctor
            </button>
        </form>
    </div>
</body>
</html>