package app.classes;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OrderDetails {
    private int id;
    private String orderNo;
    private Products product;
    private BillingDetails billingDetails;
    private double amount;
    private String orderStatus;
    private Timestamp orderDate;
    
    // Constructors
    public OrderDetails() {}
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getOrderNo() { return orderNo; }
    public void setOrderNo(String orderNo) { this.orderNo = orderNo; }
    
    public Products getProduct() { return product; }
    public void setProduct(Products product) { this.product = product; }
    
    public BillingDetails getBillingDetails() { return billingDetails; }
    public void setBillingDetails(BillingDetails billingDetails) { this.billingDetails = billingDetails; }
    
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    
    public String getOrderStatus() { return orderStatus; }
    public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }
    
    public Timestamp getOrderDate() { return orderDate; }
    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }
    
    // Get order details by order number
    public static OrderDetails getOrderByOrderNo(Connection con, String orderNo) {
        OrderDetails orderDetails = null;
        String query = "SELECT o.*, p.*, b.* FROM orders o " +
                      "LEFT JOIN products p ON o.product_id = p.product_id " +
                      "LEFT JOIN billing_details b ON o.user_id = b.user_id " +
                      "WHERE o.order_no = ?";
        
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, orderNo);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                orderDetails = new OrderDetails();
                orderDetails.setId(rs.getInt("o.id"));
                orderDetails.setOrderNo(rs.getString("o.order_no"));
                orderDetails.setAmount(rs.getDouble("o.amount"));
                orderDetails.setOrderStatus(rs.getString("o.order_status"));
                orderDetails.setOrderDate(rs.getTimestamp("o.order_date"));
                
                // Set product details
                Products product = new Products();
                product.setProduct_id(rs.getInt("p.product_id"));
                product.setName(rs.getString("p.name"));
                product.setPrice(rs.getDouble("p.price"));
                product.setDescription(rs.getString("p.description"));
                orderDetails.setProduct(product);
                
                // Set billing details
                BillingDetails billing = new BillingDetails();
                billing.setFirstName(rs.getString("b.first_name"));
                billing.setLastName(rs.getString("b.last_name"));
                billing.setAddress(rs.getString("b.address"));
                billing.setProvince(rs.getString("b.province"));
                billing.setPhone(rs.getString("b.phone"));
                billing.setEmail(rs.getString("b.email"));
                orderDetails.setBillingDetails(billing);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderDetails;
    }
    
    // Create a new order
    public boolean createOrder(Connection con, int userId, List<Cart> cartItems) {
        boolean success = false;
        String orderNo = generateOrderNo();
        double totalAmount = calculateTotalAmount(cartItems);
        
        String query = "INSERT INTO orders (order_no, user_id, amount, order_status) VALUES (?, ?, ?, 'Pending')";
        
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, orderNo);
            pstmt.setInt(2, userId);
            pstmt.setDouble(3, totalAmount);
            
            success = pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }
    
    // Generate unique order number
    private String generateOrderNo() {
        return "WO" + System.currentTimeMillis();
    }
    
    // Calculate total amount from cart items
    private double calculateTotalAmount(List<Cart> cartItems) {
        return cartItems.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }
    
    // Update order status
    public boolean updateOrderStatus(Connection con, String orderNo, String newStatus) {
        String query = "UPDATE orders SET order_status = ? WHERE order_no = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, newStatus);
            pstmt.setString(2, orderNo);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetails.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}