<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel Reservation</title>
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
            max-width: 500px;
            margin: 3rem auto;
            padding: 0 2rem;
        }

        .warning-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }

        .warning-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }

        .warning-card h2 {
            color: #dc3545;
            margin-bottom: 1rem;
        }

        .warning-card p {
            color: #666;
            margin-bottom: 2rem;
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

        input {
            width: 100%;
            padding: 0.8rem;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 1rem;
            text-align: center;
        }

        input:focus {
            outline: none;
            border-color: #dc3545;
        }

        .btn-delete {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #dc3545, #c82333);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .btn-delete:hover {
            transform: translateY(-2px);
        }

        .btn-back {
            width: 100%;
            padding: 1rem;
            background: #6c757d;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 1rem;
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
        <div class="warning-card">
            <div class="warning-icon">⚠️</div>
            <h2>Cancel Reservation</h2>
            <p>This action cannot be undone. Please confirm before proceeding.</p>
            
            <% if(request.getParameter("success") != null) { %>
                <div class="message success">Reservation cancelled successfully!</div>
            <% } %>
            <% if(request.getParameter("error") != null) { %>
                <div class="message error">Error cancelling reservation. Please try again.</div>
            <% } %>
            
            <form action="DeleteReservationServlet" method="post">
                <div class="form-group">
                    <label>Enter Reservation ID to Cancel</label>
                    <input type="number" name="reservationId" required placeholder="Reservation ID">
                </div>
                
                <button type="submit" class="btn-delete">Cancel Reservation</button>
                <button type="button" class="btn-back" onclick="location.href='index.jsp'">Go Back</button>
            </form>
        </div>
    </div>
    
    <div class="footer">
        <p>&copy; 2024 Hotel Management System</p>
    </div>
</body>
</html>