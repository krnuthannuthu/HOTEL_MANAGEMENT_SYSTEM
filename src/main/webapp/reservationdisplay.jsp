<%@ page import="com.model.Reservation" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Reservations</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
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
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #667eea;
            color: white;
        }
        tr:hover {
            background: #f5f5f5;
        }
        .no-data {
            text-align: center;
            padding: 40px;
            color: #999;
        }
        .btn-home {
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2> All Reservations</h2>
    <a href="index.jsp" class="btn-home">Back to Home</a>
    <br><br>

    <%
        List<Reservation> reservations =
            (List<Reservation>) request.getAttribute("reservations");

        if (reservations != null && !reservations.isEmpty()) {
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Customer Name</th>
            <th>Room No</th>
            <th>Check-In</th>
            <th>Check-Out</th>
            <th>Amount</th>
        </tr>

        <%
            for (Reservation r : reservations) {
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

    </table>

    <%
        } else {
    %>
        <p class="no-data">
            No reservations found.
            <a href="reservationadd.jsp">Add one</a>
        </p>
    <%
        }
    %>
</div>

</body>
</html>