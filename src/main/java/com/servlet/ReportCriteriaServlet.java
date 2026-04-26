package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String reportType = request.getParameter("reportType");
        
        if ("dateRange".equals(reportType)) {
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            response.sendRedirect("ReportServlet?type=dateRange&start=" + startDate + "&end=" + endDate);
        } 
        else if ("revenue".equals(reportType)) {
            String startDate = request.getParameter("startDate");
            String endDate = request.getParameter("endDate");
            response.sendRedirect("ReportServlet?type=revenue&start=" + startDate + "&end=" + endDate);
        }
        else if ("mostBooked".equals(reportType)) {
            response.sendRedirect("ReportServlet?type=mostBooked");
        }
    }
}