/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.Appoinment.AppoinmentDAO;
import sample.Appoinment.AppoinmentDTO;
import sample.comments.CommentDAO;
import sample.comments.CommentDTO;
import sample.doctor.DoctorDAO;
import sample.doctor.DoctorDTO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class ViewDashBoardController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String DASHBOARD_PAGE = "employee.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            AppoinmentDAO dao = new AppoinmentDAO();
            List<AppoinmentDTO> countAppoinment = dao.countAppoinmentID();
            request.setAttribute("COUNT_APPOINMENT", countAppoinment);
            CommentDAO daocmt = new CommentDAO();
            List<CommentDTO> countComment = daocmt.countCommentID();
            request.setAttribute("COUNT_COMMENT", countComment);
            DoctorDAO daodoctor = new DoctorDAO();
            List<DoctorDTO> countDoctor = daodoctor.countDoctorID();
            request.setAttribute("COUNT_DOCTOR", countDoctor);
            url = DASHBOARD_PAGE;
        } catch (Exception e) {
            log("Error at SearchController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
