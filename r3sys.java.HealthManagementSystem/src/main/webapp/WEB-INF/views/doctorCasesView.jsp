<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.r3sys.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Medical Cases | HealthAlert</title>
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

        .cases-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .cases-table thead th {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 500;
            position: sticky;
            top: 0;
        }

        .cases-table tbody tr {
            transition: all 0.2s ease;
        }

        .cases-table tbody tr:nth-child(even) {
            background-color: rgba(240, 240, 240, 0.3);
        }

        .cases-table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .cases-table td {
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
            font-size: 1rem;
        }

        /* Enhanced Location Styling */
        .location-info {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--dark); /* Changed to dark color */
            font-weight: 500; /* Added boldness */
        }

        .location-info i {
            color: var(--accent); /* Icon remains teal */
        }

        .patient-info {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .date-info {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #6c757d;
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
            
            .cases-table {
                display: block;
                overflow-x: auto;
            }
            
            .cases-table th, 
            .cases-table td {
                padding: 0.75rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="page-header">
            <i class="fas fa-file-medical"></i> Medical Cases
        </h2>
        
        <table class="cases-table">
            <thead>
                <tr>
                    <th>Case ID</th>
                    <th>Doctor Contact</th>
                    <th>Disease Name</th>
                    <th>Location</th>
                    <th>Patient Name</th>
                    <th>Report Date</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Cases> allCases = (List<Cases>) request.getAttribute("allCases");
                SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                
                if (allCases != null) {
                    for (Cases c : allCases) {
            %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td>
                        <div class="doctor-contact">
                            <i class="fas fa-user-md"></i>
                            <%= c.getDoctorContact() %>
                        </div>
                    </td>
                    <td><strong><%= c.getDiseaseName() %></strong></td>
                    <td>
                        <div class="location-info">
                            <i class="fas fa-map-marker-alt"></i>
                            <%= c.getLocation() %>
                        </div>
                    </td>
                    <td>
                        <div class="patient-info">
                            <i class="fas fa-user"></i>
                            <%= c.getPatientName() %>
                        </div>
                    </td>
                    <td>
                        <div class="date-info">
                            <i class="fas fa-calendar-alt"></i>
                            <%= sdf.format(c.getReportDate()) %>
                        </div>
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