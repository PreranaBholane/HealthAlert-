<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Admin Dashboard | HealthAlert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">
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
        }
        
        .dashboard-header p {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        /* Cards Container */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            max-width: 1000px;
            margin: 0 auto;
        }
        
        /* Card Styles */
        .dashboard-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            text-align: center;
            border-top: 3px solid var(--primary);
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(67, 97, 238, 0.1);
        }
        
        .dashboard-card i {
            font-size: 1.8rem;
            color: var(--primary);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .dashboard-card h3 {
            font-size: 1.1rem;
            margin-bottom: 0.75rem;
            color: var(--dark);
        }
        
        .dashboard-card p {
            color: #6c757d;
            margin-bottom: 1rem;
            font-size: 0.85rem;
            line-height: 1.5;
        }
        
        /* Compact Button Styles */
        .dashboard-card a {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            padding: 0.5rem 1rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.85rem;
            transition: all 0.2s ease;
            box-shadow: 0 2px 8px rgba(67, 97, 238, 0.2);
        }
        
        .dashboard-card a:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
        }
        
        .dashboard-card a i {
            font-size: 0.8rem;
            margin: 0;
            color: white;
        }
        
        /* Special Card Colors */
        .card-add {
            border-top-color: var(--success);
        }
        
        .card-add i {
            color: var(--success);
        }
        
        .card-approve {
            border-top-color: #f0ad4e;
        }
        
        .card-approve i {
            color: #f0ad4e;
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
            
            .dashboard-header h2 {
                font-size: 1.8rem;
            }
            
            .dashboard-container {
                grid-template-columns: 1fr;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-header">
        <h2><i class="fas fa-shield-alt"></i> Admin Dashboard</h2>
        <p>Manage all aspects of the HealthAlert system</p>
    </div>

    <div class="dashboard-container">
        <!-- First Row Cards -->
        <div class="dashboard-card card-add">
            <i class="fas fa-user-plus"></i>
            <h3>Add Doctors</h3>
            <p>Register new doctors to the system</p>
            <a href="adminAddDoctor"><i class="fas fa-arrow-right"></i> Access</a>
        </div>
        
        <div class="dashboard-card card-approve">
            <i class="fas fa-clipboard-check"></i>
            <h3>Approve/Disapprove</h3>
            <p>Review doctor registrations</p>
            <a href="adminApproveDisapproveDoctor"><i class="fas fa-arrow-right"></i> Manage</a>
        </div>
        
        <div class="dashboard-card card-view">
            <i class="fas fa-users"></i>
            <h3>View Doctors</h3>
            <p>Browse all medical professionals</p>
            <a href="adminDoctorView"><i class="fas fa-arrow-right"></i> View</a>
        </div>
        
        <div class="dashboard-card card-delete">
            <i class="fas fa-user-times"></i>
            <h3>Delete Doctors</h3>
            <p>Remove doctor accounts</p>
            <a href="adminDeleteDoctor"><i class="fas fa-arrow-right"></i> Manage</a>
        </div>
        
        <!-- Second Row Cards -->
        <div class="dashboard-card card-add">
            <i class="fas fa-bell"></i>
            <h3>Add Alerts</h3>
            <p>Create new health alerts</p>
            <a href="adminAddAlert"><i class="fas fa-arrow-right"></i> Create</a>
        </div>
        
        <div class="dashboard-card card-view">
            <i class="fas fa-list-ul"></i>
            <h3>View Alerts</h3>
            <p>Monitor active alerts</p>
            <a href="adminViewAlert"><i class="fas fa-arrow-right"></i> View</a>
        </div>
        
        <div class="dashboard-card card-delete">
            <i class="fas fa-trash-alt"></i>
            <h3>Delete Alerts</h3>
            <p>Remove outdated alerts</p>
            <a href="adminDeleteAlerts"><i class="fas fa-arrow-right"></i> Manage</a>
        </div>
    </div>
</body>
</html>