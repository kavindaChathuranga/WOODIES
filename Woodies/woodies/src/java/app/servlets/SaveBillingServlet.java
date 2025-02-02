package app.servlets;

import app.classes.BillingDetails;
import app.classes.DbConnector;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SaveBillingServlet", urlPatterns = {"/SaveBillingServlet"})
public class SaveBillingServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("user_id");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        Connection conn = null;
        try {
            conn = DbConnector.getConnection();
            
            BillingDetails billing = new BillingDetails();
            billing.setUserId(userId);
            billing.setFirstName(request.getParameter("firstName"));
            billing.setLastName(request.getParameter("lastName"));
            billing.setCompanyName(request.getParameter("companyName"));
            billing.setAddress(request.getParameter("address"));
            billing.setProvince(request.getParameter("province"));
            billing.setZipCode(request.getParameter("zipCode"));
            billing.setPhone(request.getParameter("phone"));
            billing.setEmail(request.getParameter("email"));
            billing.setAdditionalInfo(request.getParameter("additionalInfo"));
            
            if (billing.save(conn)) {
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": true}");
            } else {
                response.setContentType("application/json");
                response.getWriter().write("{\"success\": false, \"message\": \"Failed to save billing details\"}");
            }
            
        } catch (Exception e) {
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}