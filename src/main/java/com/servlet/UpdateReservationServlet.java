package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateReservationServlet")
public class UpdateReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            ReservationDAO dao = new ReservationDAO();
            Reservation r = new Reservation();
            
            r.setReservationId(Integer.parseInt(req.getParameter("reservationId")));
            r.setCustomerName(req.getParameter("customerName"));
            r.setRoomNumber(req.getParameter("roomNumber"));
            r.setCheckIn(Date.valueOf(req.getParameter("checkIn")));
            r.setCheckOut(Date.valueOf(req.getParameter("checkOut")));
            r.setTotalAmount(Double.parseDouble(req.getParameter("totalAmount")));
            
            if(dao.updateReservation(r)) {
                res.sendRedirect("reservationupdate.jsp?success=true");
            } else {
                res.sendRedirect("reservationupdate.jsp?error=true");
            }
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("reservationupdate.jsp?error=true");
        }
    }
}