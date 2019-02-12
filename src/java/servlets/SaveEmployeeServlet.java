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
import java.time.Instant;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Employee;
import tools.NewHibernateUtil;

/**
 *
 * @author Rayhan
 */
@WebServlet(name = "SaveEmployeeServlet", urlPatterns = {"/SaveEmployeeServlet"})
public class SaveEmployeeServlet extends HttpServlet {

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
        String religion = request.getParameter("religion");
        String phone = request.getParameter("phone");
        String marital_status = request.getParameter("marital_status");
        String nationality = request.getParameter("nationality");
        String is_delete = request.getParameter("is_delete");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        HttpSession session = request.getSession();
        Date end = null;
        try (PrintWriter out = response.getWriter()) {
            Date birth = sdf.parse(request.getParameter("birth"));
            Date start = sdf.parse(request.getParameter("start"));
            if (end != null) {
                end = sdf.parse(request.getParameter("end"));
            } else {
                end = null;
            }
            ControllerInterface<Employee> mi = new Controller(NewHibernateUtil.getSessionFactory());
            Employee mii = new Employee(id, religion, phone, marital_status, nationality, birth, start, end, is_delete);
            if (mi.saveOrEdit(mii)) {
                session.setAttribute("message", "Proses Sukses");
            } else {
                session.setAttribute("message", "Proses Gagal");
            }
            response.sendRedirect("views/ViewEmployee.jsp");
        }catch(Exception e){
            
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
