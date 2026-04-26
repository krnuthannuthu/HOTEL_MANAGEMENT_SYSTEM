package com.servlet;

import com.dao.ReservationDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ReservationDAO dao = new ReservationDAO();
        String type = req.getParameter("reportType");
        
        if("dateRange".equals(type)) {
            String start = req.getParameter("startDate");
            String end = req.getParameter("endDate");
            req.setAttribute("reportType", "dateRange");
            req.setAttribute("reservations", dao.getReservationsByDateRange(start, end));
            req.setAttribute("startDate", start);
            req.setAttribute("endDate", end);
        }
        else if("revenue".equals(type)) {
            String start = req.getParameter("startDate");
            String end = req.getParameter("endDate");
            req.setAttribute("reportType", "revenue");
            req.setAttribute("totalRevenue", dao.getTotalRevenue(start, end));
            req.setAttribute("startDate", start);
            req.setAttribute("endDate", end);
        }
        else if("mostBooked".equals(type)) {
            req.setAttribute("reportType", "mostBooked");
            req.setAttribute("roomBookings", dao.getMostBookedRooms());
        }
        
        req.getRequestDispatcher("report_result.jsp").forward(req, res);
    }
}