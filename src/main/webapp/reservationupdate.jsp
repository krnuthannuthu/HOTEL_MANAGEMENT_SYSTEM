<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Reservation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #667eea;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            margin-left: 1rem;
        }

        .nav-links a:hover {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .container {
            max-width: 600px;
            margin: 3rem auto;
            padding: 0 2rem;
        }

        .form-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }

        .form-card h2 {
            color: #333;
            margin-bottom: 1.5rem;
            text-align: center;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #555;
            font-weight: 500;
        }

        input, select {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #667eea;
        }

        .btn-submit {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .btn-submit:hover {
            transform: translateY(-2px);
        }

        .message {
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1rem;
            text-align: center;
        }

        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .footer {
            background: rgba(255, 255, 255, 0.95);
            text-align: center;
            padding: 1rem;
            margin-top: 2rem;
            color: #666;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">HotelManager</div>
        <div class="nav-links">
            <a href="index.jsp">Home</a>
            <a href="reservationdisplay.jsp">View All</a>
        </div>
    </nav>

    <div class="container">
        <div class="form-card">
            <h2>Update Reservation</h2>
            
            <% if(request.getParameter("success") != null) { %>
                <div class="message success">Reservation updated successfully!</div>
            <% } %>
            <% if(request.getParameter("error") != null) { %>
                <div class="message error">Error updating reservation. Please try again.</div>
            <% } %>
            
            <form action="UpdateReservationServlet" method="post">
                <div class="form-group">
                    <label>Reservation ID</label>
                    <input type="number" name="reservationId" required placeholder="Enter reservation ID to update">
                </div>
                
                <div class="form-group">
                    <label>Customer Name</label>
                    <input type="text" name="customerName" placeholder="New customer name">
                </div>
                
                <div class="form-group">
                    <label>Room Number</label>
                    <select name="roomNumber">
                        <option value="">Select New Room</option>
                        <option value="101">101 - Deluxe Room</option>
                        <option value="102">102 - Deluxe Room</option>
                        <option value="103">103 - Premium Room</option>
                        <option value="104">104 - Premium Room</option>
                        <option value="105">105 - Suite Room</option>
                        <option value="106">106 - Suite Room</option>
                        <option value="107">107 - Standard Room</option>
                        <option value="108">108 - Standard Room</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label>Check-In Date</label>
                    <input type="date" name="checkIn">
                </div>
                
                <div class="form-group">
                    <label>Check-Out Date</label>
                    <input type="date" name="checkOut">
                </div>
                
                <div class="form-group">
                    <label>Total Amount ($)</label>
                    <input type="number" name="totalAmount" step="0.01" placeholder="New total amount">
                </div>
                
                <button type="submit" class="btn-submit">Update Reservation</button>
            </form>
        </div>
    </div>
    
    <div class="footer">
        <p>&copy; 2024 Hotel Management System</p>
    </div>
</body>
</html>