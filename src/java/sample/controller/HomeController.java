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
import javax.servlet.http.HttpSession;
import sample.comments.CommentDAO;
import sample.comments.CommentDTO;
import sample.doctor.DoctorDAO;
import sample.doctor.DoctorDTO;
import sample.services.ServiceDAO;
import sample.services.ServiceDTO;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class HomeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String HOME_PAGE = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            ServiceDAO dao = new ServiceDAO();
            List<ServiceDTO> listService = dao.getListAllService();
            request.setAttribute("LIST_SERVICE", listService);
            DoctorDAO daodt = new DoctorDAO();
            List<DoctorDTO> listDoctor = daodt.getListAllDoctor();
            request.setAttribute("LIST_DOCTOR", listDoctor);
            CommentDAO daocmt = new CommentDAO();
            List<CommentDTO> listCmt = daocmt.getListAllFeedback();
            request.setAttribute("FEEDBACK", listCmt);
            UserDAO userdao = new UserDAO();
            UserDTO loginUser = userdao.checkLogin(userName, password);
            session.setAttribute("LOGIN_USER", loginUser);
            
            url = HOME_PAGE;
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
