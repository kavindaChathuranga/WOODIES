/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package app.classes;

/**
 *
 * @author Kavinda
 */
public class OrderItem {

    private String orderId;
    private String productName;
    private String imageUrl;
    private int quantity;
    private double price;

    public OrderItem(String orderId, String productName, String imageUrl, int quantity, double price) {
        this.orderId = orderId;
        this.productName = productName;
        this.imageUrl = imageUrl;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters
    public String getOrderId() {
        return orderId;
    }

    public String getProductName() {
        return productName;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }
}
