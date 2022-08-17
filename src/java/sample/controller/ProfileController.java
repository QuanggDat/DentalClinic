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
public class ProfileController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String PROFILE_PAGE = "profile.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int id = Integer.parseInt(request.getParameter("id"));
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.getUserByID(id);
            session.setAttribute("USER", user);
            UserDAO userdao = new UserDAO();
            UserDTO loginUser = userdao.checkLogin(userName, password);
            session.setAttribute("LOGIN_USER", loginUser);
            url = PROFILE_PAGE;
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


//    public void updateImg(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            int userID = Integer.parseInt(request.getParameter("id"));
//            String img = request.getParameter("img");
//            ProfileDAO.updateImg(userID, img);
//        } catch (Exception e) {
//            log("Error at Update img" + e.toString());
//        }
//    }
//
//    public void deleteImg(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            int userID = Integer.parseInt(request.getParameter("id"));
//            int gender = Integer.parseInt(request.getParameter("gender"));
//            String img;
//            if (gender == 0) {
//                img = "anh nam";
//            } else {
//                img = "anh nu";
//            }
//            ProfileDAO.updateImg(userID, img);
//        } catch (Exception e) {
//            log("Error deleteImg" + e.toString());
//        }
//    }
//
//    public void updateProfile(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            int userID = Integer.parseInt(request.getParameter("userId"));
//            String name = request.getParameter("name");
//            int age = Integer.parseInt(request.getParameter("age"));
//            String address = request.getParameter("adress");
//            String email = request.getParameter("email");
//            String img = request.getParameter("img");
//            int gender = Integer.parseInt(request.getParameter("gender"));
//            int phone = Integer.parseInt(request.getParameter("phone"));
//            String comments = request.getParameter("comments");
//            ProfileDTO dto = new ProfileDTO(userID, age, address, email, gender, phone, img, name, comments);
//            ProfileDAO.updateProfile(dto);
//            request.setAttribute("id", dto.getUserID());
//        } catch (Exception e) {
//            log("Error at updateProfile" + e.toString());
//        }
//    }

}