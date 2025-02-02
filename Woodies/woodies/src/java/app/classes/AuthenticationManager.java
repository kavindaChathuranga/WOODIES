package app.classes;

import java.sql.*;
import javax.servlet.http.*;
import java.util.UUID;

public class AuthenticationManager {

    // Create a persistent login token
    public static void createRememberMeToken(User user, HttpServletResponse response, Connection conn) {
        try {
            // Generate a unique token
            String token = UUID.randomUUID().toString();

            // Store token in database
            String sql = "INSERT INTO remember_me_tokens (user_id, token, expires_at) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, user.getId());
            pstmt.setString(2, token);

            // Set token to expire in 30 days
            long expirationTime = System.currentTimeMillis() + (30L * 24 * 60 * 60 * 1000);
            pstmt.setTimestamp(3, new Timestamp(expirationTime));

            pstmt.executeUpdate();

            // Create cookies
            Cookie userCookie = new Cookie("user_id", String.valueOf(user.getId()));
            Cookie tokenCookie = new Cookie("remember_token", token);

            // Set cookie expiration (30 days)
            userCookie.setMaxAge(30 * 24 * 60 * 60);
            tokenCookie.setMaxAge(30 * 24 * 60 * 60);

            // Optional: Set secure and HTTP-only flags
            userCookie.setHttpOnly(true);
            tokenCookie.setHttpOnly(true);

            response.addCookie(userCookie);
            response.addCookie(tokenCookie);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Validate persistent login token
    public static boolean validateRememberMeToken(HttpServletRequest request, HttpServletResponse response, Connection conn) {
        try {
            Cookie[] cookies = request.getCookies();
            String storedUserId = null;
            String storedToken = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user_id")) {
                        storedUserId = cookie.getValue();
                    }
                    if (cookie.getName().equals("remember_token")) {
                        storedToken = cookie.getValue();
                    }
                }
            }

            if (storedUserId != null && storedToken != null) {
                String sql = "SELECT * FROM remember_me_tokens "
                        + "WHERE user_id = ? AND token = ? AND expires_at > CURRENT_TIMESTAMP";

                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, storedUserId);
                pstmt.setString(2, storedToken);

                ResultSet rs = pstmt.executeQuery();

                if (rs.next()) {
                    // Token is valid, create session
                    HttpSession session = request.getSession();
                    session.setAttribute("user_id", storedUserId);
                    return true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Clear persistent login token
    public static void clearRememberMeToken(HttpServletRequest request, HttpServletResponse response, Connection conn) {
        try {
            Cookie[] cookies = request.getCookies();
            String storedUserId = null;
            String storedToken = null;

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user_id")) {
                        storedUserId = cookie.getValue();
                    }
                    if (cookie.getName().equals("remember_token")) {
                        storedToken = cookie.getValue();
                    }
                }
            }

            if (storedUserId != null && storedToken != null) {
                // Delete token from database
                String sql = "DELETE FROM remember_me_tokens WHERE user_id = ? AND token = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, storedUserId);
                pstmt.setString(2, storedToken);
                pstmt.executeUpdate();

                // Invalidate cookies
                Cookie userCookie = new Cookie("user_id", "");
                Cookie tokenCookie = new Cookie("remember_token", "");
                userCookie.setMaxAge(0);
                tokenCookie.setMaxAge(0);
                response.addCookie(userCookie);
                response.addCookie(tokenCookie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
