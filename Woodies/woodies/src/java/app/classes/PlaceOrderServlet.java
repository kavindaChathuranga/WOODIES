import app.classes.Cart;
import app.classes.DbConnector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PlaceOrderServlet")
public class PlaceOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.getWriter().write("{\"success\": false, \"message\": \"User not logged in\"}");
            return;
        }

        Connection con = null;
        PreparedStatement pst = null;

        try {
            con = DbConnector.getConnection();
            Cart cart = new Cart();
            List<Cart> cartItems = cart.getCartItems(con, userId);

            if (cartItems.isEmpty()) {
                response.getWriter().write("{\"success\": false, \"message\": \"Cart is empty\"}");
                return;
            }

            String query = "INSERT INTO orders (user_id, product_id, product_name, quantity, total_price) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);

            for (Cart item : cartItems) {
                pst.setInt(1, userId);
                pst.setInt(2, item.getProductId());
                pst.setString(3, item.getProductName());
                pst.setInt(4, item.getQuantity());
                pst.setDouble(5, item.getPrice() * item.getQuantity());
                pst.addBatch();
            }

            pst.executeBatch();

            // Clear cart after order placement
            PreparedStatement clearPst = con.prepareStatement("DELETE FROM cart WHERE user_id = ?");
            clearPst.setInt(1, userId);
            clearPst.executeUpdate();
            clearPst.close();

            response.getWriter().write("{\"success\": true}");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
        } finally {
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
