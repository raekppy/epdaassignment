/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.BookingFacade;
import model.Users;

/**
 *
 * @author Eric
 */
@WebServlet(name = "ViewBook", urlPatterns = {"/ViewBook"})
public class ViewBook extends HttpServlet {

    @EJB
    private BookingFacade bookingFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession hs = request.getSession();
        Users user = (Users) hs.getAttribute("user");
        String bname = user.getName();

        try (PrintWriter out = response.getWriter()) {
            out.println("<br><br>");
            out.println("        <table border=\"1\" width=\"100%\">\n"
                    + "            <tr>\n"
                    + "                <th>Booking ID</th>\n"
                    + "                <th>Booking Name</th>\n"
                    + "                <th>Booking Details</th>\n"
                    + "                <th>Auditorium ID</th>\n"
                    + "            </tr>");
            List<Booking> all = bookingFacade.findAll();
            int flag = 0;
            for (Booking j : all) {
                if (j.getBname().equals(bname)) {
                    out.println("                <tr>\n"
                            + "                    <td>" + j.getId() + "</td>\n"
                            + "                    <td>" + j.getBname() + "</td>\n"
                            + "                    <td>" + j.getBdur() + "</td>\n"
                            + "                    <td>" + j.getAna() + "</td>\n"
                            + "                </tr>");
                    flag = flag + 1;
                }
            }
            if (flag == 0) {

                out.println("Record not found");

            }
            out.println("</table>");
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
