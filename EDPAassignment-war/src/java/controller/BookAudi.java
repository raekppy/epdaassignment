/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Auditorium;
import model.AuditoriumFacade;
import model.Booking;
import model.BookingFacade;
import model.Users;

/**
 *
 * @author Eric
 */
@WebServlet(name = "BookAudi", urlPatterns = {"/BookAudi"})
public class BookAudi extends HttpServlet {

    @EJB
    private BookingFacade bookingFacade;

    @EJB
    private AuditoriumFacade auditoriumFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String audi = request.getParameter("id");
        String time = request.getParameter("time");
        String date = request.getParameter("schedule_date");
        HttpSession hs = request.getSession();
        Users user = (Users) hs.getAttribute("user");
        String bname = user.getName();
        String duration = audi + "," + time + "," + date;
        List<Booking> AS = bookingFacade.findAll();

        try (PrintWriter out = response.getWriter()) {
            int flag = 0;

            if (AS.isEmpty()) {
                flag = 1;
                out.println("EMPTY");
                Booking s = new Booking(bname, duration, audi);
                bookingFacade.create(s);
                request.getRequestDispatcher("bookaudi.jsp").forward(request, response);
                out.println("AUDITORIUM BOOKED");
            } else {

                for (Booking value : AS) {

                    if (value.getBdur().equals(duration)) {
                        flag = 1;
                    }
                }
            }
            if (flag == 0) {
                Booking s = new Booking(bname, duration, audi);
                bookingFacade.create(s);
            } else {
                out.println("BOOKING NOT AVAILABLE");
            }
            request.getRequestDispatcher("bookaudi.jsp").include(request, response);
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
