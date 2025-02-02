package app.servlets;

import app.classes.AuthenticationManager;
import app.classes.DbConnector;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Connection conn = null;

        try {
            conn = DbConnector.getConnection();

            // Clear remember-me token if it exists
            AuthenticationManager.clearRememberMeToken(request, response, conn);

            // Invalidate session
            if (session != null) {
                session.invalidate();
            }

            // Redirect to login page
            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            // Even if there's an error, try to redirect to login
            response.sendRedirect("login.jsp");
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to POST
        doPost(request, response);
    }
}
