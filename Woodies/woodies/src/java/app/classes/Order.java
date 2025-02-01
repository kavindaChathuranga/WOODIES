package app.classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Order {
    private int id;
    private String orderNo;
    private int userId;
    private double amount;
    private String orderStatus;
    private Timestamp orderDate;

    public Order() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getOrderNo() { return orderNo; }
    public void setOrderNo(String orderNo) { this.orderNo = orderNo; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    
    public String getOrderStatus() { return orderStatus; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }
    
    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }

    public static List<Order> getUserOrders(Connection con, User user) {
        List<Order> orders = new ArrayList<>();
        
        try {
            String query = "SELECT * FROM orders WHERE user_id = ? ORDER BY order_date DESC";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, user.getId());
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setOrderNo(rs.getString("order_no"));
                order.setUserId(rs.getInt("user_id"));
                order.setAmount(rs.getDouble("amount"));
                order.setOrderStatus(rs.getString("order_status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                orders.add(order);
            }
            
            rs.close();
            pstmt.close();
        } catch (SQLException ex) {
            Logger.getLogger(Order.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
}