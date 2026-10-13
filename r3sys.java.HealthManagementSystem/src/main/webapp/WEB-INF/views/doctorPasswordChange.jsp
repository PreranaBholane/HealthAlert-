<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password | HealthAlert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --success: #4ad66d;
            --danger: #f72585;
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

        /* Password Change Container */
        .login-wrapper {
            width: 100%;
            max-width: 450px;
            animation: fadeInUp 0.6s ease-out;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            border-top: 4px solid var(--primary);
        }

        /* Header */
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header i {
            color: var(--primary);
            font-size: 2rem;
            margin-bottom: 1rem;
            animation: pulse 2s infinite ease;
        }

        .login-header h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 1.8rem;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        /* Form Groups */
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.6rem;
            color: #555;
            font-weight: 500;
            font-size: 0.95rem;
            text-align: left;
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
            font-size: 1.1rem;
        }

        .input-icon input {
            width: 100%;
            padding: 12px 15px 12px 42px;
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

        /* Password Strength Indicator */
        .password-strength {
            height: 4px;
            background: #e0e0e0;
            border-radius: 2px;
            margin-top: 0.5rem;
            overflow: hidden;
        }

        .strength-meter {
            height: 100%;
            width: 0;
            transition: width 0.3s ease, background 0.3s ease;
        }

        /* Button */
        .login-btn {
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

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(67, 97, 238, 0.3);
        }

        .login-btn:active {
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
            .login-card {
                padding: 1.5rem;
            }
            
            .login-header h2 {
                font-size: 1.5rem;
            }
            
            .input-icon input {
                padding: 10px 12px 10px 38px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-card">
            <div class="login-header">
                <i class="fas fa-key"></i>
                <h2>Change Password</h2>
            </div>

            <form action="ChangePassword" method="POST">
                <!-- Old Password Field -->
                <div class="form-group">
                    <label for="oldpassword">Old Password</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="oldpassword" name="oldpassword" placeholder="Enter Old Password" required>
                    </div>
                </div>

                <!-- New Password Field -->
                <div class="form-group">
                    <label for="newpassword">New Password</label>
                    <div class="input-icon">
                        <i class="fas fa-lock"></i>
                        <input type="password" id="newpassword" name="newpassword" placeholder="Enter New Password" required>
                    </div>
                    <div class="password-strength">
                        <div class="strength-meter" id="strength-meter"></div>
                    </div>
                </div>

                <button type="submit" class="login-btn">
                    <i class="fas fa-sync-alt"></i> Change Password
                </button>
            </form>
        </div>
    </div>

    <script>
        // Password strength indicator
        const passwordInput = document.getElementById('newpassword');
        const strengthMeter = document.getElementById('strength-meter');
        
        passwordInput.addEventListener('input', function() {
            const strength = checkPasswordStrength(this.value);
            updateStrengthMeter(strength);
        });
        
        function checkPasswordStrength(password) {
            // Check password length
            if (password.length === 0) return 0;
            if (password.length < 6) return 1;
            
            // Check for character variety
            const hasLetters = /[a-zA-Z]/.test(password);
            const hasNumbers = /[0-9]/.test(password);
            const hasSpecial = /[^a-zA-Z0-9]/.test(password);
            
            let strength = 1;
            if (hasLetters) strength++;
            if (hasNumbers) strength++;
            if (hasSpecial) strength++;
            if (password.length > 10) strength++;
            
            return Math.min(strength, 4);
        }
        
        function updateStrengthMeter(strength) {
            const colors = ['#f72585', '#f8961e', '#4cc9f0', '#4ad66d'];
            strengthMeter.style.width = (strength * 25) + '%';
            strengthMeter.style.background = colors[strength - 1] || 'transparent';
        }
    </script>
</body>
</html>