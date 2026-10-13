<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.r3sys.model.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Approved Doctors | HealthAlert</title>
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

        h2 {
            font-family: 'Montserrat', sans-serif;
            color: var(--dark);
            margin-bottom: 1.5rem;
            text-align: center;
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            padding-bottom: 0.5rem;
        }

        .doctors-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .doctors-table thead th {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 1rem;
            text-align: left;
            font-weight: 500;
        }

        .doctors-table tbody tr {
            transition: all 0.2s ease;
        }

        .doctors-table tbody tr:nth-child(even) {
            background-color: rgba(240, 240, 240, 0.3);
        }

        .doctors-table tbody tr:hover {
            background-color: rgba(67, 97, 238, 0.05);
        }

        .doctors-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            vertical-align: middle;
        }

        .status-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
            text-transform: capitalize;
            background-color: rgba(74, 214, 109, 0.1);
            color: var(--success);
            border: 1px solid var(--success);
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
            
            .doctors-table {
                display: block;
                overflow-x: auto;
            }
            
            .doctors-table th, 
            .doctors-table td {
                padding: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-user-md"></i> Approved Doctors</h2>
        
        <table class="doctors-table">
            <thead>
                <tr>
                    <th>Contact</th>
                    <th>Name</th>
                    <th>Specialization</th>
                    <th>Email</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<Doctor> allDoctors = (List<Doctor>) request.getAttribute("allDoctors");
                if (allDoctors != null) {
                    for (Doctor c : allDoctors) {
                        String status = c.getDoctorStatus();
                        if(status != null && status.equalsIgnoreCase("Approve")) {
            %>
                <tr>
                    <td><%= c.getDoctorContact() %></td>
                    <td><strong><%= c.getDoctorName() %></strong></td>
                    <td><%= c.getDoctorSpecialization() %></td>
                    <td><%= c.getDoctorEmail() %></td>
                    <td><span class="status-badge">Approved</span></td>
                </tr>
            <%
                        }
                    }
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>