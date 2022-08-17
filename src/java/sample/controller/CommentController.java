/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.comments.CommentDAO;
import sample.comments.CommentDTO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class CommentController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String HOME_PAGE = "doctorInfo.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userID = request.getParameter("id");
        String doctorID = request.getParameter("docID");
        String name = request.getParameter("name");
        String rating = request.getParameter("rating");
        String commentCmt = request.getParameter("txtCommentCmt");
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu-MM-dd");
        String status = "Unavailable";
        int commentID = 0;
        LocalDate localDate = LocalDate.now();
        String cmtDate = dtf.format(localDate);
        String url = LOGIN_PAGE;

        try {
            if (userID == null) {
                url = LOGIN_PAGE;
            } else {
                CommentDTO dto;
                dto = new CommentDTO(commentID, name, Integer.parseInt(rating), commentCmt, Integer.parseInt(userID), Integer.parseInt(doctorID), cmtDate, status);
                CommentDAO dao = new CommentDAO();
                boolean result = dao.insert(dto);
                if (result) {
                    url = HOME_PAGE;
                }
            }
        } catch (SQLException ex) {
            log("CommentController _ SQLException" + ex.getMessage());
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
