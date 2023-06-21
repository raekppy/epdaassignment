/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import model.UsersFacade;

/**
 *
 * @author Eric
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @EJB
    private UsersFacade userFacade;

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

        String id = request.getParameter("id");
        int password = Integer.parseInt(request.getParameter("pass"));
        int role = Integer.parseInt(request.getParameter("role"));

        Users s = userFacade.find(id);

        try (PrintWriter out = response.getWriter()) {
            if (id.equals("admin") && password == 123 && role == 1) {
                request.getRequestDispatcher("coohome.jsp").include(request, response);
            } else {
                if (s != null) {
                    if (s.getPassword() == password && s.getRole() == 1 && s.getRole() == role) {
                        request.getRequestDispatcher("coohome.jsp").include(request, response);
                        out.print("<br><br>");
                        if (s.getGender() == 'M') {
                            out.print("Welcome Mr. " + s.getId() + "!");
                        } else {
                            out.print("Welcome Ms. " + s.getId() + "!");
                        }
                    } else if (s.getPassword() == password && s.getRole() == 2 && s.getRole() == role) {
                        request.getRequestDispatcher("staffhome.jsp").include(request, response);
                        out.print("<br><br>");
                        if (s.getGender() == 'M') {
                            out.print("Welcome Mr. " + s.getId() + "!");
                        } else {
                            out.print("Welcome Ms. " + s.getId() + "!");
                        }
                    } else if (s.getPassword() == password && s.getRole() == 3 && s.getRole() == role) {
                        request.getRequestDispatcher("fmshome.jsp").include(request, response);
                        out.print("<br><br>");
                        if (s.getGender() == 'M') {
                            out.print("Welcome Mr. " + s.getId() + "!");
                        } else {
                            out.print("Welcome Ms. " + s.getId() + "!");
                        }
                    } else if (s.getPassword() == password && s.getRole() == 4 && s.getRole() == role) {
                        request.getRequestDispatcher("studenthome.jsp").include(request, response);
                        out.print("<br><br>");
                        if (s.getGender() == 'M') {
                            out.print("Welcome Mr. " + s.getId() + "!");
                        } else {
                            out.print("Welcome Ms. " + s.getId() + "!");
                        }
                    } else {
                        out.print("Sorry, wrong username or password!<br><br>");
                        request.getRequestDispatcher("login.jsp").include(request, response);
                    }

                    HttpSession session = request.getSession();
                    session.setAttribute("user", s);

                } else {
                    out.print("Sorry, wrong username or password!<br><br>");
                    request.getRequestDispatcher("login.jsp").include(request, response);
                }
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
