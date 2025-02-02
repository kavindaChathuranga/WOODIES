package app.classes;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Order {

    private String orderId;
    private LocalDateTime orderDate;
    private double totalAmount;
    private int quantity;    // Added field
    private double price;    // Added field
    private int productId;   // Added field

    // Existing getters and setters
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    // New getters and setters
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    // Updated getUserOrders method to fetch from order_items
    public static List<Order> getUserOrders(Connection con, User user) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT o.order_id, o.order_date, o.total_amount, "
                + "oi.product_id, oi.quantity, oi.price "
                + "FROM orders o "
                + "JOIN order_items oi ON o.order_id = oi.order_id "
                + "WHERE o.user_id = ? "
                + "ORDER BY o.order_date DESC";

        try (PreparedStatement stmt = con.prepareStatement(query)) {
            stmt.setInt(1, user.getId());

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getString("order_id"));
                    order.setOrderDate(rs.getTimestamp("order_date").toLocalDateTime());
                    order.setTotalAmount(rs.getDouble("total_amount"));
                    order.setProductId(rs.getInt("product_id"));
                    order.setQuantity(rs.getInt("quantity"));
                    order.setPrice(rs.getDouble("price"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, "Error fetching user orders", e);
        }

        return orders;
    }
}
