<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>HealthAlert System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        /* Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f0f9ff;
            color: #333;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow-x: hidden;
        }
        
        /* Pulsing Background Elements */
        body::before, body::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            background: rgba(0, 123, 255, 0.05);
            z-index: -1;
        }
        
        body::before {
            width: 500px;
            height: 500px;
            top: -150px;
            left: -150px;
            animation: pulse 8s infinite ease-out;
        }
        
        body::after {
            width: 300px;
            height: 300px;
            bottom: -100px;
            right: -100px;
            animation: pulse 8s infinite ease-out 2s;
        }
        
        @keyframes pulse {
            0% { transform: scale(0.8); opacity: 0.7; }
            50% { transform: scale(1.1); opacity: 0.3; }
            100% { transform: scale(0.8); opacity: 0.7; }
        }
        
        /* Header Styles */
        .header {
            margin-bottom: 3rem;
            text-align: center;
            animation: fadeInDown 1s ease;
        }
        
        .header h1 {
            font-size: 2.5rem;
            color: #007bff;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .header h1 i {
            animation: heartbeat 1.5s infinite;
        }
        
        @keyframes heartbeat {
            0% { transform: scale(1); }
            25% { transform: scale(1.1); }
            50% { transform: scale(1); }
            75% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        /* Card Container */
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 2rem;
            padding: 1rem;
            max-width: 1000px;
            animation: fadeInUp 1s ease;
        }
        
        /* Card Styles */
        .card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            width: 280px;
            box-shadow: 0 10px 30px rgba(0, 123, 255, 0.1);
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 35px rgba(0, 123, 255, 0.2);
        }
        
        .card::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #007bff, #00b4ff);
            animation: wave 3s ease infinite;
        }
        
        @keyframes wave {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: #007bff;
            transition: all 0.3s ease;
        }
        
        .card:hover .card-icon {
            transform: rotateY(180deg);
            color: #00b4ff;
        }
        
        .card h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #333;
        }
        
        .card p {
            color: #666;
            margin-bottom: 1.5rem;
            font-size: 0.95rem;
            line-height: 1.5;
        }
        
        /* Button Styles */
        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        
        .btn:hover {
            background: #0069d9;
            box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: 0.5s;
        }
        
        .btn:hover::before {
            left: 100%;
        }
        
        /* Animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .card-container {
                flex-direction: column;
                align-items: center;
            }
            
            .card {
                width: 90%;
                max-width: 350px;
            }
            
            .header h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <header class="header">
        <h1><i class="fas fa-heartbeat"></i> HealthAlert System</h1>
    </header>

    <main class="card-container">
        <div class="card" onclick="window.location='adminlogin'">
            <i class="fas fa-user-shield card-icon"></i>
            <h2>Admin Panel</h2>
            <p>Manage doctors, patients, and appointments securely.</p>
            <a href="adminlogin" class="btn">Admin Login</a>
        </div>

        <div class="card" onclick="window.location='doctorlogin'">
            <i class="fas fa-user-md card-icon"></i>
            <h2>Doctor Portal</h2>
            <p>Access patient records, manage schedules and consult online.</p>
            <a href="doctorlogin" class="btn">Doctor Login</a>
        </div>
    </main>
</body>
</html>