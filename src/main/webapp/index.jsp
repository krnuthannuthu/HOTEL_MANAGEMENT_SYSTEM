<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System | Dashboard</title>
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

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 20px rgba(0,0,0,0.1);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: #667eea;
        }

        .logo span {
            color: #764ba2;
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-links a:hover {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* Hero Section */
        .hero {
            background: white;
            border-radius: 20px;
            padding: 3rem;
            text-align: center;
            margin-bottom: 2rem;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }

        .hero h1 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .hero p {
            color: #666;
            font-size: 1.1rem;
        }

        /* Stats Cards */
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: white;
            border-radius: 15px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
        }

        .stat-card h3 {
            color: #667eea;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        .stat-card p {
            color: #666;
        }

        /* Feature Grid */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }

        .feature-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .feature-card h3 {
            color: #333;
            margin-bottom: 0.5rem;
        }

        .feature-card p {
            color: #666;
            font-size: 0.9rem;
        }

        /* Footer */
        .footer {
            background: rgba(255, 255, 255, 0.95);
            text-align: center;
            padding: 1.5rem;
            margin-top: 2rem;
            color: #666;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 1rem;
            }
            .hero h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">Hotel<span>Manager</span></div>
        <div class="nav-links">
            <a href="index.jsp">Dashboard</a>
            <a href="reservationadd.jsp">Add Reservation</a>
            <a href="reservationupdate.jsp">Update Booking</a>
            <a href="reservationdelete.jsp">Cancel Reservation</a>
            <a href="DisplayReservationsServlet">View All</a>
            <a href="reports.jsp">Reports</a>
        </div>
    </nav>

    <div class="container">
        <div class="hero">
            <h1>Welcome to Hotel Management System</h1>
            <p>Manage reservations, track occupancy, and generate reports efficiently</p>
        </div>

        <div class="stats">
            <div class="stat-card">
                <h3>24/7</h3>
                <p>Customer Support</p>
            </div>
            <div class="stat-card">
                <h3>100+</h3>
                <p>Happy Customers</p>
            </div>
            <div class="stat-card">
                <h3>50+</h3>
                <p>Luxury Rooms</p>
            </div>
        </div>

        <div class="features">
            <div class="feature-card" onclick="location.href='reservationadd.jsp'">
                <div class="feature-icon">📝</div>
                <h3>Add Reservation</h3>
                <p>Book new reservations for guests</p>
            </div>
            <div class="feature-card" onclick="location.href='reservationupdate.jsp'">
                <div class="feature-icon">✏️</div>
                <h3>Update Booking</h3>
                <p>Modify existing reservation details</p>
            </div>
            <div class="feature-card" onclick="location.href='reservationdelete.jsp'">
                <div class="feature-icon">🗑️</div>
                <h3>Cancel Reservation</h3>
                <p>Cancel unwanted bookings</p>
            </div>
            <div class="feature-card" onclick="location.href='DisplayReservationsServlet'">
                <div class="feature-icon">📋</div>
                <h3>View All</h3>
                <p>Display all current reservations</p>
            </div>
            <div class="feature-card" onclick="location.href='reports.jsp'">
                <div class="feature-icon">📊</div>
                <h3>Reports</h3>
                <p>Generate various management reports</p>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Hotel Management System | All Rights Reserved</p>
    </div>
</body>
</html>