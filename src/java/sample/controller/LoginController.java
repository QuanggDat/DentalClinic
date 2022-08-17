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
import sample.doctor.DoctorDAO;
import sample.doctor.DoctorDTO;
import sample.users.UserDAO;
import sample.users.UserDTO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "login.jsp";
    //lam trang bao loi 
    private static final String ADMIN_PAGE = "admin.jsp";
    private static final String USER_PAGE = "HomeController";
    private static final String DOCTOR_PAGE = "doctor.jsp";
    private static final String EMPLOYEE_PAGE = "ViewDashBoardController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            HttpSession session = request.getSession();
            UserDAO dao = new UserDAO();
            UserDTO loginUser = dao.checkLogin(userName, password);
            DoctorDAO dtdao = new DoctorDAO();
            DoctorDTO doctor = dtdao.getDoctorByID(loginUser.getUserID());
            session.setAttribute("DOCTOR", doctor);
            if (loginUser != null) {
                session.setAttribute("LOGIN_USER", loginUser);
//                 int role = loginUser.getRole();
                if (loginUser.getRoleID() == 1) {
                    url = ADMIN_PAGE;
                } else if (loginUser.getRoleID() == 2) {
                    url = USER_PAGE;
                } else if (loginUser.getRoleID() == 3) {
                    url = USER_PAGE;
                } else if (loginUser.getRoleID() == 4) {
                    url = DOCTOR_PAGE;
                } else if (loginUser.getRoleID() == 5) {
                    url = EMPLOYEE_PAGE;

                } else {
                    request.setAttribute("ERROR_MESSAGE", "Your role is not support!");
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Incorrect userID or password!");
                url = LOGIN;
            }
        } catch (Exception e) {
            log("Error at LoginController" + e.toString());
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