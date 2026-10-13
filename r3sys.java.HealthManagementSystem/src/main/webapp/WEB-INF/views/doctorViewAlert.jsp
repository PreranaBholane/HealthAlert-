<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.r3sys.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>HealthAlert | Disease Alerts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --danger: #f72585;
            --warning: #f8961e;
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
        .header {
            margin-bottom: 2rem;
            text-align: center;
            animation: fadeInDown 0.8s ease;
        }
        
        .header h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 2.5rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            margin-bottom: 0.5rem;
            display: inline-flex;
            align-items: center;
            gap: 1rem;
        }
        
        .header h1 i {
            font-size: 2rem;
            animation: pulse 2s ease infinite;
        }
        
        .header p {
            color: #6c757d;
            font-size: 1rem;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
        
        /* Alert Level Badges */
        .alert-level {
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .level-high {
            background-color: rgba(247, 37, 133, 0.1);
            color: var(--danger);
            border: 1px solid var(--danger);
        }
        
        .level-medium {
            background-color: rgba(248, 150, 30, 0.1);
            color: var(--warning);
            border: 1px solid var(--warning);
        }
        
        .level-low {
            background-color: rgba(74, 214, 109, 0.1);
            color: var(--success);
            border: 1px solid var(--success);
        }
        
        /* Table Styles */
        .alerts-container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            overflow: hidden;
            animation: fadeInUp 0.8s ease;
        }
        
        .alerts-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin: 0 auto;
        }
        
        .alerts-table thead th {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 500;
            position: sticky;
            top: 0;
        }
        
        .alerts-table th:first-child {
            border-top-left-radius: 10px;
        }
        
        .alerts-table th:last-child {
            border-top-right-radius: 10px;
        }
        
        .alerts-table tbody tr {
            transition: all 0.2s ease;
        }
        
        .alerts-table tbody tr:nth-child(even) {
            background-color: rgba(240, 240, 240, 0.3);
        }
        
        .alerts-table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
            transform: translateX(5px);
        }
        
        .alerts-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            vertical-align: middle;
        }
        
        .doctor-contact {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary);
        }
        
        .doctor-contact i {
            font-size: 1.2rem;
        }
        
        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
        }
        
        .empty-state i {
            font-size: 3rem;
            color: #ced4da;
            margin-bottom: 1rem;
        }
        
        /* Back Button */
        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 2rem;
            padding: 0.7rem 1.5rem;
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.2);
        }
        
        .back-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(67, 97, 238, 0.3);
        }
        
        /* Animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
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
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .alerts-container {
                padding: 1rem;
                overflow-x: auto;
            }
            
            .alerts-table {
                display: block;
                width: 100%;
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1><i class="fas fa-bell"></i> Disease Alerts</h1>
        <p>Current health alerts and outbreak notifications</p>
    </div>
    
    <div class="alerts-container">
        <%
            List<Alerts> allAlerts = (List<Alerts>) request.getAttribute("allAlerts");
            
            if (allAlerts != null && !allAlerts.isEmpty()) {
        %>
        <table class="alerts-table">
            <thead>
                <tr>
                    <th>Alert ID</th>
                    <th>Disease Name</th>
                    <th>Affected Area</th>
                    <th>Alert Level</th>
                    <th>Date Issued</th>
                    <th>Doctor Contact</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    for (Alerts c : allAlerts) {
                        String alertLevelClass = "";
                        if (c.getAlertLevel() != null) {
                            if (c.getAlertLevel().toLowerCase().contains("high")) {
                                alertLevelClass = "level-high";
                            } else if (c.getAlertLevel().toLowerCase().contains("medium")) {
                                alertLevelClass = "level-medium";
                            } else {
                                alertLevelClass = "level-low";
                            }
                        }
                %>
                <tr>
                    <td><%= c.getAlertId() %></td>
                    <td><strong><%= c.getDiseaseName() %></strong></td>
                    <td><%= c.getAffectedArea() %></td>
                    <td><span class="alert-level <%= alertLevelClass %>"><%= c.getAlertLevel() %></span></td>
                    <td><%= sdf.format(c.getDateIssued()) %></td>
                    <td>
                        <div class="doctor-contact">
                            <i class="fas fa-user-md"></i>
                            <%= c.getDoctorContact() %>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            } else {
        %>
        <div class="empty-state">
            <i class="fas fa-bell-slash"></i>
            <h3>No Active Alerts</h3>
            <p>There are currently no disease alerts to display</p>
        </div>
        <%
            }
        %>
    </div>
    
    <a href="javascript:history.back()" class="back-btn">
        <i class="fas fa-arrow-left"></i> Back to Dashboard
    </a>
</body>
</html>