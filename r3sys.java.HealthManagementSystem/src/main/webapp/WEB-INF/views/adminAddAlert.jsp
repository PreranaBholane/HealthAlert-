<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Health Alert | HealthAlert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --danger: #f72585;
            --success: #4ad66d;
            --warning: #f8961e;
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

        /* Compact Alert Form Container */
        .register-container {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 12px;
            padding: 1.8rem;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            border-top: 3px solid var(--danger);
            animation: fadeInUp 0.6s ease-out;
        }

        /* Header */
        .register-container h2 {
            font-family: 'Montserrat', sans-serif;
            color: var(--danger);
            margin-bottom: 1.5rem;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-size: 1.5rem;
        }

        .register-container h2 i {
            font-size: 1.4rem;
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
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--danger);
            font-size: 1rem;
        }

        .input-icon input,
        .form-control {
            width: 100%;
            padding: 10px 12px 10px 38px;
            border: 1px solid #e0e0e0;
            border-radius: 6px;
            font-size: 0.9rem;
            transition: all 0.2s ease;
            background-color: rgba(240, 240, 240, 0.3);
        }

        .form-control {
            padding-left: 12px;
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23f72585' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 12px center;
            background-size: 0.9rem;
        }

        .input-icon input:focus,
        .form-control:focus {
            border-color: var(--danger);
            box-shadow: 0 0 0 2px rgba(247, 37, 133, 0.15);
            outline: none;
            background-color: white;
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 10px;
            background: linear-gradient(135deg, var(--danger) 0%, #d61a5e 100%);
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 0.95rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            margin-top: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(247, 37, 133, 0.25);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(15px);
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
            
            .input-icon input,
            .form-control {
                padding: 8px 10px 8px 34px;
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2><i class="fas fa-exclamation-triangle"></i> Add Health Alert</h2>
        <form action="RegisterAlert" method="POST">
            
            <div class="form-group">
                <label for="diseaseName">Disease Name</label>
                <div class="input-icon">
                    <i class="fas fa-virus"></i>
                    <input type="text" id="diseaseName" name="diseaseName" placeholder="Enter Disease Name" required />
                </div>
            </div>

            <div class="form-group">
                <label for="affectedArea">Affected Area</label>
                <div class="input-icon">
                    <i class="fas fa-map-marked-alt"></i>
                    <input type="text" id="affectedArea" name="affectedArea" placeholder="Enter Affected Area" required />
                </div>
            </div>

            <div class="form-group">
                <label for="alertLevel">Alert Level</label>
                <select name="alertLevel" id="alertLevel" class="form-control">
                    <option value="Low">Low</option>
                    <option value="Moderate">Moderate</option>
                    <option value="High">High</option>
                    <option value="Critical">Critical</option>
                </select>
            </div>

            <div class="form-group">
                <label for="dateIssued">Date Issued</label>
                <div class="input-icon">
                    <i class="fas fa-calendar-alt"></i> 
                    <input type="date" id="dateIssued" name="dateIssued" required />
                </div>
            </div>

            <div class="form-group">
                <label for="doctorContact">Doctor Contact</label>
                <div class="input-icon">
                    <i class="fas fa-phone"></i>
                    <input type="tel" id="doctorContact" name="doctorContact" placeholder="Enter Doctor Contact" required />
                </div>
            </div>

            <button type="submit" class="btn">
                <i class="fas fa-bell"></i> Add Alert
            </button>
        </form>
    </div>
</body>
</html>