<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Doctor Dashboard | HealthAlert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --success: #4ad66d;
            --danger: #f72585;
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
            color: var(--dark);
            padding: 2rem;
        }

        /* Header Styles */
        .dashboard-header {
            text-align: center;
            margin-bottom: 2rem;
            animation: fadeInDown 0.8s ease;
        }

        .dashboard-header h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 0.5rem;
            display: inline-flex;
            align-items: center;
            gap: 0.8rem;
        }

        /* Cards Container */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            max-width: 900px;
            margin: 0 auto;
        }

        /* Card Styles */
        .dashboard-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            text-align: center;
            border-top: 3px solid var(--primary);
            cursor: pointer;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(67, 97, 238, 0.1);
        }

        .dashboard-card i {
            font-size: 1.8rem;
            color: var(--primary);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }

        .dashboard-card h3 {
            font-size: 1.1rem;
            margin-bottom: 0.7rem;
            color: var(--dark);
        }

        .dashboard-card p {
            color: #6c757d;
            margin-bottom: 1rem;
            font-size: 0.85rem;
            line-height: 1.5;
        }

        /* Compact Button Styles */
        .card-link {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.4rem;
            padding: 0.5rem 1rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.85rem;
            transition: all 0.2s ease;
        }

        .card-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(67, 97, 238, 0.2);
        }

        .card-link i {
            font-size: 0.8rem;
            margin: 0;
            color: white;
        }

        /* Card Specific Colors */
        .card-add {
            border-top-color: var(--success);
        }
        .card-add i {
            color: var(--success);
        }

        .card-view {
            border-top-color: var(--accent);
        }
        .card-view i {
            color: var(--accent);
        }

        .card-delete {
            border-top-color: var(--danger);
        }
        .card-delete i {
            color: var(--danger);
        }

        .card-alert {
            border-top-color: var(--warning);
        }
        .card-alert i {
            color: var(--warning);
        }

        .card-settings {
            border-top-color: #9c27b0;
        }
        .card-settings i {
            color: #9c27b0;
        }

        /* Animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 1.5rem;
            }
            
            .dashboard-container {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
            
            .dashboard-card {
                padding: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-header">
        <h2><i class="fas fa-user-md"></i> Doctor Dashboard</h2>
    </div>

    <div class="dashboard-container">
        <!-- First Row Cards -->
        <div class="dashboard-card card-add" onclick="window.location='doctorAddCases'">
            <i class="fas fa-file-medical"></i>
            <h3>Add Cases</h3>
            <p>Add new disease cases to the system</p>
            <a href="doctorAddCases" class="card-link">
                <i class="fas fa-plus"></i> Add
            </a>
        </div>
        
        <div class="dashboard-card card-view" onclick="window.location='doctorViewCases'">
            <i class="fas fa-clipboard-list"></i>
            <h3>View Cases</h3>
            <p>Review all submitted cases</p>
            <a href="doctorViewCases" class="card-link">
                <i class="fas fa-eye"></i> View
            </a>
        </div>
        
        <div class="dashboard-card card-delete" onclick="window.location='doctordeleteCases'">
            <i class="fas fa-trash-alt"></i>
            <h3>Delete Cases</h3>
            <p>Remove disease case records</p>
            <a href="doctordeleteCases" class="card-link">
                <i class="fas fa-trash"></i> Delete
            </a>
        </div>
        
        <!-- Second Row Cards -->
        <div class="dashboard-card card-alert" onclick="window.location='doctorAlertView'">
            <i class="fas fa-bell"></i>
            <h3>View Alerts</h3>
            <p>Check current health alerts</p>
            <a href="doctorAlertView" class="card-link">
                <i class="fas fa-exclamation-triangle"></i> Alerts
            </a>
        </div>
        
        <div class="dashboard-card card-settings" onclick="window.location='doctorChangePassword'">
            <i class="fas fa-key"></i>
            <h3>Change Password</h3>
            <p>Update your login credentials</p>
            <a href="doctorChangePassword" class="card-link">
                <i class="fas fa-lock"></i> Password
            </a>
        </div>
    </div>
</body>
</html>