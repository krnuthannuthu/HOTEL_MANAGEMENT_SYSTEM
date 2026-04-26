package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            Date checkIn = Date.valueOf(request.getParameter("checkIn"));
            Date checkOut = Date.valueOf(request.getParameter("checkOut"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            
            ReservationDAO dao = new ReservationDAO();
            int nextId = dao.getNextId();
            
            Reservation r = new Reservation(nextId, customerName, roomNumber, checkIn, checkOut, totalAmount);
            
            if(dao.addReservation(r)) {
                response.sendRedirect("reservationadd.jsp?success=true");
            } else {
                response.sendRedirect("reservationadd.jsp?error=true");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("reservationadd.jsp?error=true");
        }
    }
}