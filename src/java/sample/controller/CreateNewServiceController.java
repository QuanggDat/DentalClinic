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
import sample.services.ServiceDAO;

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class CreateNewServiceController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ViewAllServiceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int serviceID = Integer.parseInt(request.getParameter("serviceID")) + 1;
            String serviceName = request.getParameter("serviceName");
            String demo = request.getParameter("demo");
            String description1 = request.getParameter("description1");
            String description2 = request.getParameter("description2");
            String description3 = request.getParameter("description3");
            String title1 = request.getParameter("title1");
            String title2 = request.getParameter("title2");
            String title3 = request.getParameter("title3");
            String title1_img = request.getParameter("title1_img");
            String title2_img = request.getParameter("title2_img");
            String title3_img = request.getParameter("title3_img");
            String service_img = request.getParameter("service_img");
            String status = "Available";
            
            HttpSession session = request.getSession();
            ServiceDAO dao = new ServiceDAO();

            boolean checkCreate = dao.createNewService(serviceID, serviceName, demo, description1, description2, description3, title1, title2, title3, title1_img, title2_img, title3_img, service_img, status);
            if (checkCreate) {
                url = SUCCESS;
                session.setAttribute("SUCCESS_MESSAGE", "Tạo thành công !!!");
            }

        } catch (Exception e) {
            log("Error at CreateUserController: " + e.toString());
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
