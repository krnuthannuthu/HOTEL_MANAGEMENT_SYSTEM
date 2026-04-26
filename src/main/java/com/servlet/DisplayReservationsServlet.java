package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DisplayReservationsServlet")
public class DisplayReservationsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReservationDAO dao = new ReservationDAO();
        List<Reservation> list = dao.getAllReservations();

        // Debug (optional)
        System.out.println("Reservations count: " + list.size());

        request.setAttribute("reservations", list);
        request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
    }
}