package com.servlet;

import com.dao.ReservationDAO;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteReservationServlet")
public class DeleteReservationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            ReservationDAO dao = new ReservationDAO();
            int id = Integer.parseInt(req.getParameter("reservationId"));
            
            if(dao.deleteReservation(id)) {
                res.sendRedirect("reservationdelete.jsp?success=true");
            } else {
                res.sendRedirect("reservationdelete.jsp?error=true");
            }
        } catch(Exception e) {
            e.printStackTrace();
            res.sendRedirect("reservationdelete.jsp?error=true");
        }
    }
}