<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports - Hotel Management</title>
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
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .reports-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
        }

        .report-card {
            background: white;
            border-radius: 20px;
            padding: 2rem;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }

        .report-card:hover {
            transform: translateY(-5px);
        }

        .report-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .report-card h3 {
            color: #333;
            margin-bottom: 1rem;
        }

        .report-card p {
            color: #666;
            margin-bottom: 1.5rem;
        }

        .form-group {
            margin-bottom: 1rem;
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
        }

        input:focus {
            outline: none;
            border-color: #667eea;
        }

        .btn-report {
            width: 100%;
            padding: 0.8rem;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            margin-top: 1rem;
        }

        .btn-report:hover {
            opacity: 0.9;
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
        <div class="reports-grid">
            <!-- Report 1: Date Range -->
            <div class="report-card">
                <div class="report-icon">📅</div>
                <h3>Reservations by Date Range</h3>
                <p>View all reservations between specific dates</p>
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="reportType" value="dateRange">
                    <div class="form-group">
                        <label>From Date</label>
                        <input type="date" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label>To Date</label>
                        <input type="date" name="endDate" required>
                    </div>
                    <button type="submit" class="btn-report">Generate Report</button>
                </form>
            </div>

            <!-- Report 2: Revenue -->
            <div class="report-card">
                <div class="report-icon">💰</div>
                <h3>Revenue Report</h3>
                <p>Calculate total revenue generated in a period</p>
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="reportType" value="revenue">
                    <div class="form-group">
                        <label>From Date</label>
                        <input type="date" name="startDate" required>
                    </div>
                    <div class="form-group">
                        <label>To Date</label>
                        <input type="date" name="endDate" required>
                    </div>
                    <button type="submit" class="btn-report">Calculate Revenue</button>
                </form>
            </div>

            <!-- Report 3: Most Booked Rooms -->
            <div class="report-card">
                <div class="report-icon">🏆</div>
                <h3>Most Booked Rooms</h3>
                <p>Find out which rooms are booked most frequently</p>
                <form action="ReportServlet" method="post">
                    <input type="hidden" name="reportType" value="mostBooked">
                    <button type="submit" class="btn-report">Generate Report</button>
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>&copy; 2024 Hotel Management System</p>
    </div>
</body>
</html>