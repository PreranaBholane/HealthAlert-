<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.r3sys.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Health Alerts | HealthAlert</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4361ee;
            --secondary: #3f37c9;
            --accent: #4cc9f0;
            --critical: #d32f2f;
            --high: #f57c00;
            --moderate: #1976d2;
            --low: #388e3c;
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
            padding: 2rem;
            color: var(--dark);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            animation: fadeIn 0.5s ease-out;
        }

        .page-header {
            font-family: 'Montserrat', sans-serif;
            color: var(--dark);
            margin-bottom: 1.5rem;
            text-align: center;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            padding-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.8rem;
        }

        .alerts-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
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

        .alerts-table tbody tr {
            transition: all 0.2s ease;
        }

        .alerts-table tbody tr:nth-child(even) {
            background-color: rgba(240, 240, 240, 0.3);
        }

        .alerts-table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .alerts-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            vertical-align: middle;
        }

        /* Enhanced Alert Level Badges */
        .alert-level {
            display: inline-block;
            padding: 0.4rem 0.8rem;
            border-radius: 6px;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .level-critical {
            background-color: #ffebee;
            color: var(--critical);
            border: 2px solid var(--critical);
            box-shadow: 0 2px 4px rgba(211, 47, 47, 0.2);
        }

        .level-high {
            background-color: #fff3e0;
            color: var(--high);
            border: 2px solid var(--high);
            box-shadow: 0 2px 4px rgba(245, 124, 0, 0.2);
        }

        .level-moderate {
            background-color: #e3f2fd;
            color: var(--moderate);
            border: 2px solid var(--moderate);
            box-shadow: 0 2px 4px rgba(25, 118, 210, 0.2);
        }

        .level-low {
            background-color: #e8f5e9;
            color: var(--low);
            border: 2px solid var(--low);
            box-shadow: 0 2px 4px rgba(56, 142, 60, 0.2);
        }

        .doctor-contact {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary);
        }

        .doctor-contact i {
            font-size: 1rem;
        }

        .delete-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            background-color: rgba(247, 37, 133, 0.1);
            color: var(--critical);
            border: 1px solid var(--critical);
            border-radius: 6px;
            font-weight: 500;
            font-size: 0.85rem;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .delete-btn:hover {
            background-color: var(--critical);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(247, 37, 133, 0.2);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            .alerts-table {
                display: block;
                overflow-x: auto;
            }
            
            .alerts-table th, 
            .alerts-table td {
                padding: 0.75rem;
            }
            
            .alert-level {
                padding: 0.3rem 0.6rem;
                font-size: 0.8rem;
            }
            
            .delete-btn {
                padding: 0.4rem 0.8rem;
                font-size: 0.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="page-header">
            <i class="fas fa-bell"></i> Health Alerts
        </h2>
        
        <table class="alerts-table">
            <thead>
                <tr>
                    <th>Alert ID</th>
                    <th>Disease Name</th>
                    <th>Affected Area</th>
                    <th>Alert Level</th>
                    <th>Date Issued</th>
                    <th>Doctor Contact</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Alerts> allAlerts = (List<Alerts>) request.getAttribute("allAlerts");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                
                if (allAlerts != null) {
                    for (Alerts c : allAlerts) {
                        String levelClass = "";
                        String alertLevel = c.getAlertLevel() != null ? c.getAlertLevel().toLowerCase() : "";
                        
                        if (alertLevel.contains("critical")) {
                            levelClass = "level-critical";
                        } else if (alertLevel.contains("high")) {
                            levelClass = "level-high";
                        } else if (alertLevel.contains("moderate") || alertLevel.contains("medium")) {
                            levelClass = "level-moderate";
                        } else {
                            levelClass = "level-low";
                        }
            %>
                <tr>
                    <td><%= c.getAlertId() %></td>
                    <td><strong><%= c.getDiseaseName() %></strong></td>
                    <td><%= c.getAffectedArea() %></td>
                    <td><span class="alert-level <%= levelClass %>"><%= c.getAlertLevel() %></span></td>
                    <td><%= sdf.format(c.getDateIssued()) %></td>
                    <td>
                        <div class="doctor-contact">
                            <i class="fas fa-user-md"></i>
                            <%= c.getDoctorContact() %>
                        </div>
                    </td>
                    <td>
                        <a href="deleteAlerts?alertId=<%=c.getAlertId()%>" class="delete-btn">
                            <i class="fas fa-trash-alt"></i> Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>