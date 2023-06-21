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
import model.Auditorium;
import model.AuditoriumFacade;
import model.Booking;
import model.BookingFacade;
import model.Users;

/**
 *
 * @author Eric
 */
@WebServlet(name = "ReadyAudi", urlPatterns = {"/ReadyAudi"})
public class ReadyAudi extends HttpServlet {

    @EJB
    private AuditoriumFacade auditoriumFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String id = request.getParameter("id");
        HttpSession hs = request.getSession();
        Users user = (Users) hs.getAttribute("user");
        String bname = user.getName();

        try (PrintWriter out = response.getWriter()) {
            List<Auditorium> all = auditoriumFacade.findAll();
            int flag = 0;
            for (Auditorium j : all) {
                if (j.getId().equals(id) && j.getFM().equals(bname) && j.getStat().equals("Approved")) {
                    flag = flag + 1;
                    j.setStat("Ready");
                    auditoriumFacade.edit(j);
                    out.println("<label>Auditorim is ready!</label>");
                     request.getRequestDispatcher("readyaudi.jsp").include(request, response);
                }
            }
            if (flag == 0) {
                out.println("<label>Record not available!</label>");
                request.getRequestDispatcher("readyaudi.jsp").include(request, response);
            }
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
