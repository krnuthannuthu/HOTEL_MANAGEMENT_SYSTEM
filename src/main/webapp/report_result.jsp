<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Reservation, java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Result</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
        }
        .revenue {
            font-size: 32px;
            color: #28a745;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Report Result</h2>
        <a href="reports.jsp">← Back to Reports</a>
        <hr>
        
        <% 
            String reportType = (String) request.getAttribute("reportType");
            
            if ("revenue".equals(reportType)) {
                Double totalRevenue = (Double) request.getAttribute("totalRevenue");
        %>
            <div class="revenue">
                <h3>Total Revenue Generated</h3>
                <h1>Rs.<% out.print(String.format("%.2f", totalRevenue != null ? totalRevenue : 0.0)); %></h1>
                <p>Period: <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %></p>
            </div>
            
        <% } else if ("mostBooked".equals(reportType)) { 
            Map<String, Integer> roomBookings = (Map<String, Integer>) request.getAttribute("roomBookings");
            if (roomBookings != null && !roomBookings.isEmpty()) {
        %>
            <h3>Most Booked Rooms Ranking</h3>
            <table>
                <thead>
                    <tr><th>Rank</th><th>Room Number</th><th>Times Booked</th></tr>
                </thead>
                <tbody>
            <% 
                int rank = 1;
                for(Map.Entry<String, Integer> entry : roomBookings.entrySet()) { 
            %>
                    <tr>
                        <td><%= rank++ %></td>
                        <td>Room <%= entry.getKey() %></td>
                        <td><%= entry.getValue() %> bookings</td>
                    </tr>
            <% 
                } 
            %>
                </tbody>
            </table>
        <% 
            } else {
        %>
            <p>No booking data available</p>
        <% 
            }
        } else if ("dateRange".equals(reportType)) { 
            List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
            if (reservations != null && !reservations.isEmpty()) {
        %>
            <h3>Reservations from <%= request.getAttribute("startDate") %> to <%= request.getAttribute("endDate") %></h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer</th>
                        <th>Room</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
            <% 
                for(Reservation r : reservations) { 
            %>
                    <tr>
                        <td><%= r.getReservationId() %></td>
                        <td><%= r.getCustomerName() %></td>
                        <td><%= r.getRoomNumber() %></td>
                        <td><%= r.getCheckIn() %></td>
                        <td><%= r.getCheckOut() %></td>
                        <td>Rs.<%= r.getTotalAmount() %></td>
                    </tr>
            <% 
                } 
            %>
                </tbody>
            </table>
        <% 
            } else {
        %>
            <p>No reservations found in this date range</p>
        <% 
            }
        } 
        %>
    </div>
</body>
</html>