<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            background: #667eea;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Generate Report</h2>
        <form action="ReportCriteriaServlet" method="post">
            <label>Report Type:</label>
            <select name="reportType" required>
                <option value="dateRange">Reservations in Date Range</option>
                <option value="revenue">Total Revenue Over Period</option>
                <option value="mostBooked">Most Booked Rooms</option>
            </select>
            
            <div id="dateFields">
                <label>Start Date:</label>
                <input type="date" name="startDate">
                <label>End Date:</label>
                <input type="date" name="endDate">
            </div>
            
            <button type="submit">Generate Report</button>
        </form>
        <br>
        <a href="index.jsp">Back to Home</a>
    </div>
    
    <script>
        document.querySelector('select').addEventListener('change', function() {
            var dateFields = document.getElementById('dateFields');
            if(this.value === 'mostBooked') {
                dateFields.style.display = 'none';
            } else {
                dateFields.style.display = 'block';
            }
        });
    </script>
</body>
</html>