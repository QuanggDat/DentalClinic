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

/**
 *
 * @author SE150436 - Hoàng Quang Hòa
 */
public class MainController extends HttpServlet {
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEND_EMAIL = "SendEmail";
    private static final String SEND_EMAIL_CONTROLLER = "SendEmailController";
    private static final String FORGOT_PASSWORD = "ForgotPassword";
    private static final String FORGOT_PASSWORD_CONTROLLER = "ForgotPasswordController";
    private static final String UPDATE_USER_PASSWORD = "UpdateUserPassword";
    private static final String UPDATE_USER_PASSWORD_CONTROLLER = "UpdateUserPasswordController";
    private static final String UPDATE_ROLE_DOCTOR_TO_USER = "UpdateRoleDoctorToUser";
    private static final String UPDATE_ROLE_DOCTOR_TO_USER_CONTROLLER = "UpdateRoleDoctorToUserController";
    private static final String UPDATE_WORKING_TIME_DOCTOR = "UpdateWorkingTimeDoctor";
    private static final String UPDATE_WORKING_TIME_DOCTOR_CONTROLLER = "UpdateWorkingTimeDoctorController";
    private static final String RESTORE_ROLE_DOCTOR = "RestoreRoleDoctor";
    private static final String RESTORE_ROLE_DOCTOR_CONTROLLER = "RestoreRoleDoctorController";
    private static final String LOGINGOOGLE = "LoginGoogle";
    private static final String LOGINGOOGLE_CONTROLLER = "LoginGoogleController";
    private static final String SERVICE = "Service";
    private static final String SERVICE_CONTROLLER = "ServiceController";
    private static final String VIEWPF = "ViewProfile";
    private static final String VIEWPROFILE_CONTROLLER = "ProfileController";
    private static final String SAVEIMG = "SaveImg";
    private static final String SAVE_IMAGE_CONTROLLER = "SaveImageController";
    private static final String SAVEINFO = "SaveInfo";
    private static final String SAVE_INFOMATION_CONTROLLER = "SaveInformationController";
    private static final String VIEWDOCTOR = "Doctor";
    private static final String VIEWDOCTOR_CONTROLLER = "DoctorController";
    private static final String UPDATE_DOCTOR_INFORMATION = "UpdateDoctorInformation";
    private static final String UPDATE_DOCTOR_INFORMATION_CONTROLLER = "UpdateDoctorInformationController";
    private static final String VIEW_ALL_DOCTOR_BY_EMPLOYEE = "ViewAllDoctorByEmployee";
    private static final String VIEW_ALL_DOCTOR_BY_EMPLOYEE_CONTROLLER = "ViewAllDoctorByEmployeeController";
    private static final String VIEW_DETAIL_DOCTOR_BY_ID = "ViewDetailDoctorByID";
    private static final String VIEW_DETAIL_DOCTOR_BY_ID_CONTROLLER = "ViewDetailDoctorByIDController";
    private static final String DISPLAY = "Display";
    private static final String PRICE_DISPLAY = "PriceDisplayController";
    private static final String FEEDBACK = "Send";
    private static final String FEEDBACK_CONTROLLER = "CommentController";
    private static final String BOOKING = "Booking";
    private static final String BOOKING_CONTROLLER = "BookAppoinmentController";
    private static final String SEND_BOOKING = "Send_Appoinment";
    private static final String SEND_BOOKING_CONTROLLER = "SendAppoinmentController";
    private static final String VIEW_APPOINMENT = "View_Appoinment";
    private static final String VIEW_APPOINMENT_CONTROLLER = "ViewAppoinmentController";
    private static final String VIEW_APPOINMENT_DOCTOR_BY_DATE = "ViewAppointmentDoctorByDate";
    private static final String VIEW_APPOINMENT_DOCTOR_BY_DATE_CONTROLLER = "ViewAppoinmentController";
    private static final String VIEW_PROCESSING_APPOINMENT = "ViewProcessingAppoinment";
    private static final String VIEW_PROCESSING_APPOINMENT_CONTROLLER = "ViewProcessingAppoinmentController";
    private static final String VIEW_FEEDBACK = "View_Feedback";
    private static final String VIEW_FEEDBACK_CONTROLLER = "ViewFeedbackController";
    private static final String VIEW_AVAILABLE_FEEDBACK = "ViewAvailableFeedback";
    private static final String VIEW_AVAILABLE_FEEDBACK_CONTROLLER = "ViewAvailableFeedbackController";
    private static final String VIEW_AVAILABLE_FEEDBACK_BY_DOCTORID = "ViewAvailableFeedbackByDoctorID";
    private static final String VIEW_AVAILABLE_FEEDBACK_BY_DOCTORID_CONTROLLER = "ViewAvailableFeedbackByDoctorIDController";
    private static final String VIEW_DELETED_FEEDBACK_BY_DOCTORID = "ViewDeletedFeedbackByDoctorID";
    private static final String VIEW_DELETED_FEEDBACK_BY_DOCTORID_CONTROLLER = "ViewDeletedFeedbackByDoctorIDController";
    private static final String UPDATE_SLOT = "UpdateSlot";
    private static final String UPDATE_SLOT_CONTROLLER = "UpdateSlotController";
    private static final String UPDATE_SERVICE = "UpdateService";
    private static final String UPDATE_SERVICE_CONTROLLER = "UpdateServiceController";
    private static final String RESTORE_SERVICE = "RestoreService";
    private static final String RESTORE_SERVICE_CONTROLLER = "RestoreServiceController";
    private static final String UPDATE_SERVICE_IMAGE = "UpdateServiceImage";
    private static final String UPDATE_SERVICE_IMAGE_CONTROLLER = "UpdateServiceImageController";
    private static final String DELETE_SERVICE_BY_ID = "DeleteServiceByID";
    private static final String DELETE_SERVICE_BY_ID_CONTROLLER = "DeleteServiceByIDController";
    private static final String CREATE_NEW_SERVICE = "CreateNewService";
    private static final String CREATE_NEW_SERVICE_CONTROLLER = "CreateNewServiceController";
    private static final String VIEW_ALL_DELETED_SERVICE = "ViewDeletedService";
    private static final String VIEW_ALL_DELETED_SERVICE_CONTROLLER = "ViewDeletedServiceController";
    private static final String VIEW_APPOINMENT_BY_ID = "ViewAppoinmentById";
    private static final String VIEW_APPOINMENT_BY_ID_CONTROLLER = "ViewAppoinmentByIdController";
    private static final String UPDATE_APPOINMENT = "UpdateAppoinment";
    private static final String UPDATE_APPOINMENT_CONTROLLER = "UpdateAppoinmentController";
    private static final String DELETE_APPOINMENT = "DeleteAppoinment";
    private static final String DELETE_APPOINMENT_CONTROLLER = "DeleteAppoinmentController";
    private static final String VIEW_ALL_FEEDBACK = "ViewAllFeedback";
    private static final String VIEW_ALL_FEEDBACK_CONTROLLER = "ViewAllFeedbackController";
    private static final String DELETE_FEEDBACK = "DeleteFeedback";
    private static final String DELETE_FEEDBACK_CONTROLLER = "DeleteFeedbackController";
    private static final String UPDATE_FEEDBACK = "UpdateFeedback";
    private static final String UPDATE_FEEDBACK_CONTROLLER = "UpdateFeedbackController";
    private static final String UPDATE_AVAILABLE_FEEDBACK = "UpdateAvailableFeedback";
    private static final String UPDATE_AVAILABLE_FEEDBACK_CONTROLLER = "UpdateAvailableFeedbackController";
    private static final String VIEW_FEEDBACK_BY_DOCTORID = "ViewFeedbackByDoctorID";
    private static final String VIEW_FEEDBACK_BY_DOCTORID_CONTROLLER = "ViewFeedbackByDoctorIdController";
    private static final String VIEW_FEEDBACK_BY_TIME = "ViewFeedbackByTime";
    private static final String VIEW_FEEDBACK_BY_TIME_CONTROLLER = "ViewFeedbackByTimeController";
    private static final String VIEW_FEEDBACK_BY_TIME_DOCTOR = "ViewFeedbackByTimeDoctor";
    private static final String VIEW_FEEDBACK_BY_TIME_DOCTOR_CONTROLLER = "ViewFeedbackByTimeDoctorController";
    private static final String VIEW_ALL_APPOINMENT = "ViewAllAppoinment";
    private static final String VIEW_ALL_APPOINMENT_CONTROLLER = "ViewAllAppoinmentController";
    private static final String VIEW_APPOINMENT_BY_DOCTORID = "ViewAppoinmentByDoctorID";
    private static final String VIEW_APPOINMENT_BY_DOCTORID_CONTROLLER = "ViewAppoinmentByDoctorIDController";
    private static final String VIEW_ALL_SERVICE = "ViewAllService";
    private static final String VIEW_ALL_SERVICE_CONTROLLER = "ViewAllServiceController";
    private static final String VIEW_ALL_DELETED_FEEDBACK = "ViewDeletedFeedback";
    private static final String VIEW_ALL_DELETED_FEEDBACK_CONTROLLER = "ViewDeletedFeedbackController";
    private static final String RESTORE_FEEDBACK = "RestoreFeedback";
    private static final String RESTORE_FEEDBACK_CONTROLLER = "RestoreFeedbackController";
    private static final String REGISTER_ACCOUNT = "RegisterAccount";
    private static final String REGISTER_ACCOUNT_CONTROLLER = "RegisterController";
    private static final String VIEW_DASHBOARD = "ViewDashBoard";
    private static final String VIEW_DASHBOARD_CONTROLLER = "ViewDashBoardController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            }else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }else if (SERVICE.equals(action)) {
                url = SERVICE_CONTROLLER;
            }else if (VIEWPF.equals(action)) {
                url = VIEWPROFILE_CONTROLLER;
            }else if (SAVEIMG.equals(action)) {
                url = SAVE_IMAGE_CONTROLLER;
            }else if (SAVEINFO.equals(action)) {
                url = SAVE_INFOMATION_CONTROLLER;
            }else if (VIEWDOCTOR.equals(action)) {
                url = VIEWDOCTOR_CONTROLLER;
            }else if (DISPLAY.equals(action)) {
                url = PRICE_DISPLAY;
            }else if (FEEDBACK.equals(action)) {
                url = FEEDBACK_CONTROLLER;
            }else if (BOOKING.equals(action)) {
                url = BOOKING_CONTROLLER;
            }else if (LOGINGOOGLE.equals(action)) {
                url = LOGINGOOGLE_CONTROLLER;
            }else if (SEND_BOOKING.equals(action)) {
                url = SEND_BOOKING_CONTROLLER;
            }else if (VIEW_APPOINMENT.equals(action)) {
                url = VIEW_APPOINMENT_CONTROLLER;
            }else if (VIEW_FEEDBACK.equals(action)) {
                url = VIEW_FEEDBACK_CONTROLLER;
            }else if (UPDATE_SLOT.equals(action)) {
                url = UPDATE_SLOT_CONTROLLER;
            }else if (VIEW_APPOINMENT_BY_ID.equals(action)) {
                url = VIEW_APPOINMENT_BY_ID_CONTROLLER;
            }else if (VIEW_ALL_FEEDBACK.equals(action)) {
                url = VIEW_ALL_FEEDBACK_CONTROLLER;
            }else if (DELETE_FEEDBACK.equals(action)) {
                url = DELETE_FEEDBACK_CONTROLLER;
            }else if (UPDATE_FEEDBACK.equals(action)) {
                url = UPDATE_FEEDBACK_CONTROLLER;
            }else if (VIEW_FEEDBACK_BY_DOCTORID.equals(action)) {
                url = VIEW_FEEDBACK_BY_DOCTORID_CONTROLLER;
            }else if (VIEW_ALL_APPOINMENT.equals(action)) {
                url = VIEW_ALL_APPOINMENT_CONTROLLER;
            }else if (VIEW_APPOINMENT_BY_DOCTORID.equals(action)) {
                url = VIEW_APPOINMENT_BY_DOCTORID_CONTROLLER;
            }else if (VIEW_ALL_SERVICE.equals(action)) {
                url = VIEW_ALL_SERVICE_CONTROLLER;
            }else if (VIEW_ALL_DELETED_FEEDBACK.equals(action)) {
                url = VIEW_ALL_DELETED_FEEDBACK_CONTROLLER;
            }else if (RESTORE_FEEDBACK.equals(action)) {
                url = RESTORE_FEEDBACK_CONTROLLER;
            }else if (REGISTER_ACCOUNT.equals(action)) {
                url = REGISTER_ACCOUNT_CONTROLLER;
            }else if (UPDATE_USER_PASSWORD.equals(action)) {
                url = UPDATE_USER_PASSWORD_CONTROLLER;
            }else if (VIEW_FEEDBACK_BY_TIME.equals(action)) {
                url = VIEW_FEEDBACK_BY_TIME_CONTROLLER;
            }else if (VIEW_AVAILABLE_FEEDBACK.equals(action)) {
                url = VIEW_AVAILABLE_FEEDBACK_CONTROLLER;
            }else if (UPDATE_AVAILABLE_FEEDBACK.equals(action)) {
                url = UPDATE_AVAILABLE_FEEDBACK_CONTROLLER;
            }else if (VIEW_AVAILABLE_FEEDBACK_BY_DOCTORID.equals(action)) {
                url = VIEW_AVAILABLE_FEEDBACK_BY_DOCTORID_CONTROLLER;
            }else if (VIEW_DELETED_FEEDBACK_BY_DOCTORID.equals(action)) {
                url = VIEW_DELETED_FEEDBACK_BY_DOCTORID_CONTROLLER;
            }else if (UPDATE_SERVICE.equals(action)) {
                url = UPDATE_SERVICE_CONTROLLER;
            }else if (UPDATE_SERVICE_IMAGE.equals(action)) {
                url = UPDATE_SERVICE_IMAGE_CONTROLLER;
            }else if (DELETE_SERVICE_BY_ID.equals(action)) {
                url = DELETE_SERVICE_BY_ID_CONTROLLER;
            }else if (VIEW_ALL_DELETED_SERVICE.equals(action)) {
                url = VIEW_ALL_DELETED_SERVICE_CONTROLLER;
            }else if (CREATE_NEW_SERVICE.equals(action)) {
                url = CREATE_NEW_SERVICE_CONTROLLER;
            }else if (UPDATE_APPOINMENT.equals(action)) {
                url = UPDATE_APPOINMENT_CONTROLLER;
            }else if (DELETE_APPOINMENT.equals(action)) {
                url = DELETE_APPOINMENT_CONTROLLER;
            }else if (VIEW_PROCESSING_APPOINMENT.equals(action)) {
                url = VIEW_PROCESSING_APPOINMENT_CONTROLLER;
            }else if (VIEW_FEEDBACK_BY_TIME_DOCTOR.equals(action)) {
                url = VIEW_FEEDBACK_BY_TIME_DOCTOR_CONTROLLER;
            }else if (RESTORE_SERVICE.equals(action)) {
                url = RESTORE_SERVICE_CONTROLLER;
            }else if (VIEW_ALL_DOCTOR_BY_EMPLOYEE.equals(action)) {
                url = VIEW_ALL_DOCTOR_BY_EMPLOYEE_CONTROLLER;
            }else if (VIEW_DETAIL_DOCTOR_BY_ID.equals(action)) {
                url = VIEW_DETAIL_DOCTOR_BY_ID_CONTROLLER;
            }else if (UPDATE_ROLE_DOCTOR_TO_USER.equals(action)) {
                url = UPDATE_ROLE_DOCTOR_TO_USER_CONTROLLER;
            }else if (RESTORE_ROLE_DOCTOR.equals(action)) {
                url = RESTORE_ROLE_DOCTOR_CONTROLLER;
            }else if (UPDATE_WORKING_TIME_DOCTOR.equals(action)) {
                url = UPDATE_WORKING_TIME_DOCTOR_CONTROLLER;
            }else if (FORGOT_PASSWORD.equals(action)) {
                url = FORGOT_PASSWORD_CONTROLLER;
            }else if (VIEW_DASHBOARD.equals(action)) {
                url = VIEW_DASHBOARD_CONTROLLER;
            }else if (UPDATE_DOCTOR_INFORMATION.equals(action)) {
                url = UPDATE_DOCTOR_INFORMATION_CONTROLLER;
            }else if (VIEW_APPOINMENT_DOCTOR_BY_DATE.equals(action)) {
                url = VIEW_APPOINMENT_DOCTOR_BY_DATE_CONTROLLER;
            }else if (SEND_EMAIL.equals(action)) {
                url = SEND_EMAIL_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
