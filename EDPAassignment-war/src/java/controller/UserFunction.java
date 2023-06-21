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
import model.Users;
import model.UsersFacade;

/**
 *
 * @author Eric
 */
@WebServlet(name = "UserFunction", urlPatterns = {"/UserFuction"})
public class UserFunction extends HttpServlet {

    @EJB
    private UsersFacade usersFacade;

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
        request.getRequestDispatcher("userfunction.jsp").include(request, response);
        String id = request.getParameter("id");
        String btn = request.getParameter("btn");

        try (PrintWriter out = response.getWriter()) {
            if (btn.equals("Search")) {
                out.println("<br><br>You selected " + id + "!");
                out.println("<br><br>");
                out.println("        <table border=\"1\" width=\"100%\">\n"
                        + "            <tr>\n"
                        + "                <th>Username</th>\n"
                        + "                <th>Password</th>\n"
                        + "                <th>Name</th>\n"
                        + "                <th>Gender</th>\n"
                        + "                <th>H/P number</th>\n"
                        + "                <th>Email</th>\n"
                        + "                <th>Role</th>\n"
                        + "                <th>Address</th>\n"
                        + "            </tr>");
                List<Users> all = usersFacade.findAll();
                int flag = 0;
                for (Users j : all) {
                    if (j.getId().equals(id)) {
                        out.println("                <tr>\n"
                                + "                    <td>" + j.getId() + "</td>\n"
                                + "                    <td>" + j.getPassword() + "</td>\n"
                                + "                    <td>" + j.getName() + "</td>\n"
                                + "                    <td>" + j.getGender() + "</td>\n"
                                + "                    <td>" + j.getHpno() + "</td>\n"
                                + "                    <td>" + j.getEmail() + "</td>\n"
                                + "                    <td>" + j.getRole() + "</td>\n"
                                + "                    <td>" + j.getAddress() + "</td>\n"
                                + "                </tr>");
                        flag = flag + 1;
                    }
                }
                if (flag == 0) {

                    out.println("Record not found");

                }
                out.println("</table>");
            } else if (btn.equals("Modify")) {
                Users s = usersFacade.find(id);
                HttpSession hs = request.getSession();
                hs.setAttribute("user", s);
                request.getRequestDispatcher("updateuser.jsp").forward(request, response);
            } else if (btn.equals("Delete")) {
                Users s = usersFacade.find(id);
                usersFacade.remove(s);
                out.println("<label>User Deleted!</label>");
            } else {
                out.println("<label>Please search the username in order to proceed!</label>");
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
