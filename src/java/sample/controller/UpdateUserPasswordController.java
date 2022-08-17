/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class UpdateUserPasswordController extends HttpServlet {

    private static final String ERROR = "profile.jsp";
    private static final String PROFILE_PAGE = "profile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            String oldpassword = request.getParameter("oldpassword");
            String oldpassword1 = request.getParameter("oldpassword1");
            String newpassword = request.getParameter("newpassword");
            String newpassword1 = request.getParameter("newpassword1");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(userName, password);
            session.setAttribute("LOGIN_USER", loginUser);

            if (oldpassword.equalsIgnoreCase(oldpassword1)) {
                if (newpassword.equalsIgnoreCase(oldpassword)) {
                    request.setAttribute("DUPLICATE_MESSAGE", "Mật khẩu này là mật khẩu cũ của bạn, hãy đổi mật khẩu mới !!!");
                } else if (newpassword.equalsIgnoreCase(newpassword1)) {
                    dao.updatePassword(id, newpassword);
                    request.setAttribute("SUCCESS_MESSAGE", "Bạn đã thay đổi mật khẩu thành công !!!");
                    url = PROFILE_PAGE;
                } else {
                    request.setAttribute("FAIL_MESSAGE", "Mật khẩu nhập lại không khớp với mật khẩu mới !!!");
                    url = PROFILE_PAGE;
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Mật khẩu cũ không đúng !!!");
                url = PROFILE_PAGE;
            }
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
