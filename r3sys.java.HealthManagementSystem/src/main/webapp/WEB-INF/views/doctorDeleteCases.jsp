<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.r3sys.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Medical Cases</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: #f8fafa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            text-align: center;
            color: #468ee6;
            padding: 20px 0 10px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            border-radius: 10px;
            overflow: hidden;
        }

        thead {
            background-color: #4b55e1;
            color: white;
        }

        thead th {
            padding: 15px 10px;
            font-size: 16px;
        }

        tbody tr:nth-child(even) {
            background-color: #f6f8ff;
        }

        tbody tr:hover {
            background-color: #eaeefc;
        }

        td {
            padding: 12px 10px;
            text-align: center;
            color: #333;
        }

        a {
            color: #e63946;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <h2> Medical Cases</h2>

    <table>
        <thead>
            <tr>
                <th>Case ID</th>
                <th>Doctor Contact</th>
                <th>Disease Name</th>
                <th>Location</th>
                <th>Patient Name</th>
                <th>Report Date</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Cases> allCases = (List<Cases>) request.getAttribute("allCases");
                if (allCases != null) {
                    for (Cases c : allCases) {
                        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getDoctorContact() %></td>
                <td><b><%= c.getDiseaseName() %></b></td>
                <td><%= c.getLocation() %></td>
                <td><%= c.getPatientName() %></td>
                <td><%= sdf.format(c.getReportDate()) %></td>
                <td><a href="deletecases?caseId=<%= c.getId() %>">Delete</a></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>

</body>
</html>
