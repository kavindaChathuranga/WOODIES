/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;

import java.sql.*;
import java.util.*;

public class Cart {

    private int cart_id;
    private int user_id;
    private int product_id;
    private int quantity;
    private String date_added;
    private String productName;  // For joining with products table
    private double price;        // For joining with products table
    private String image_url;    // For joining with products table

    // Getters and setters
    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDate_added() {
        return date_added;
    }

    public void setDate_added(String date_added) {
        this.date_added = date_added;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    // Add item to cart
    public boolean addToCart(Connection con, int userId, int productId) throws SQLException {
        // Check if item already exists in cart
        String checkSql = "SELECT cart_id, quantity FROM cart WHERE user_id = ? AND product_id = ?";
        try (PreparedStatement checkPst = con.prepareStatement(checkSql)) {
            checkPst.setInt(1, userId);
            checkPst.setInt(2, productId);
            ResultSet rs = checkPst.executeQuery();

            if (rs.next()) {
                // Update quantity if item exists
                int cartId = rs.getInt("cart_id");
                int currentQty = rs.getInt("quantity");
                String updateSql = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
                try (PreparedStatement updatePst = con.prepareStatement(updateSql)) {
                    updatePst.setInt(1, currentQty + 1);
                    updatePst.setInt(2, cartId);
                    return updatePst.executeUpdate() > 0;
                }
            } else {
                // Insert new item if it doesn't exist
                String insertSql = "INSERT INTO cart (user_id, product_id, quantity) VALUES (?, ?, 1)";
                try (PreparedStatement insertPst = con.prepareStatement(insertSql)) {
                    insertPst.setInt(1, userId);
                    insertPst.setInt(2, productId);
                    return insertPst.executeUpdate() > 0;
                }
            }
        }
    }

    public boolean placeOrder(Connection con, int userId, double totalAmount, List<Cart> cartItems) throws SQLException {
        // Step 1: Insert order details into the orders table
        String orderId = "WO" + System.currentTimeMillis() % 10000;
        String orderSql = "INSERT INTO orders (order_id, user_id, total_amount) VALUES (?, ?, ?)";
        try (PreparedStatement pst = con.prepareStatement(orderSql)) {
            pst.setString(1, orderId);
            pst.setInt(2, userId);
            pst.setDouble(3, totalAmount);
            pst.executeUpdate();
        }

        // Step 2: Insert each cart item into the order_items table
        String orderItemSql = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement pst = con.prepareStatement(orderItemSql)) {
            for (Cart item : cartItems) {
                pst.setString(1, orderId);
                pst.setInt(2, item.getProduct_id());
                pst.setInt(3, item.getQuantity());
                pst.setDouble(4, item.getPrice());
                pst.addBatch();
            }
            pst.executeBatch();
        }

        // Step 3: Clear the cart after placing the order
        String deleteCartSql = "DELETE FROM cart WHERE user_id = ?";
        try (PreparedStatement pst = con.prepareStatement(deleteCartSql)) {
            pst.setInt(1, userId);
            pst.executeUpdate();
        }

        return true;
    }

    // Get all cart items for a user with product details
    public List<Cart> getCartItems(Connection con, int userId) throws SQLException {
        List<Cart> cartItems = new ArrayList<>();
        String sql = "SELECT c.*, p.name, p.price, p.image_url FROM cart c "
                + "JOIN products p ON c.product_id = p.product_id "
                + "WHERE c.user_id = ?";

        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, userId);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Cart item = new Cart();
                item.setCart_id(rs.getInt("cart_id"));
                item.setUser_id(rs.getInt("user_id"));
                item.setProduct_id(rs.getInt("product_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setDate_added(rs.getString("date_added"));
                item.setProductName(rs.getString("name"));
                item.setPrice(rs.getDouble("price"));
                item.setImage_url(rs.getString("image_url"));
                cartItems.add(item);
            }
        }
        return cartItems;
    }

    // Update cart item quantity
    public boolean updateQuantity(Connection con, int cartId, int quantity) throws SQLException {
        String sql = "UPDATE cart SET quantity = ? WHERE cart_id = ?";
        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, Math.max(1, quantity)); // Ensure quantity is at least 1
            pst.setInt(2, cartId);
            return pst.executeUpdate() > 0;
        }
    }

// Remove item from cart
    public boolean removeFromCart(Connection con, int cartId) throws SQLException {
        String sql = "DELETE FROM cart WHERE cart_id = ?";
        try (PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, cartId);
            return pst.executeUpdate() > 0;
        }
    }

    // Calculate cart total
    public double getCartTotal(List<Cart> cartItems) {
        return cartItems.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
    }

    public int getProductId() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
