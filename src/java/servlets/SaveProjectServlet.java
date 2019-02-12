/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.Controller;
import controllers.ControllerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Client;
import models.Project;
import tools.NewHibernateUtil;

/**
 *
 * @author kresna92
 */
@WebServlet(name = "SaveProjectServlet", urlPatterns = {"/SaveProjectServlet"})
public class SaveProjectServlet extends HttpServlet {

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
        String name = request.getParameter("name");
        String assessment = request.getParameter("assessment");
        String specification = request.getParameter("specification");
        String status = request.getParameter("status");
        String client = request.getParameter("client");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            Date start = sdf.parse(request.getParameter("start"));
            Date end = sdf.parse(request.getParameter("end"));
            ControllerInterface<Project> or = new Controller(NewHibernateUtil.getSessionFactory());
            Project o = new Project(id, name, start, end, assessment, specification, status, new Client(client) );
            if (or.saveOrEdit(o)) {
                session.setAttribute("message", "Proses Sukses");
            } else {
                session.setAttribute("message", "Proses Gagal");
            }
            response.sendRedirect("views/ViewProject.jsp");
        } catch (Exception e) {

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
