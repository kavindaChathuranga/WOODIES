/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.classes;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author chanu
 */
public class Products {
    private int product_id;
    private String category;
    private String image_url;
    private String name;
    private double price;
    private int quantity; 
    private String description;

    public Products() {
    }

    public Products(int product_id, String category, String image_url, String name, double price, int quantity, String description) {
        this.product_id = product_id;
        this.category = category;
        this.image_url = image_url;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
    }

    public Products(String category, String image_url, String name, double price, int quantity, String description) {
        this.category = category;
        this.image_url = image_url;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
    }


    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    
    
    public List<Products> getAllProducts(Connection con){
    List<Products> productList = new ArrayList<>();
    try {
        // Modified query to sort by product_id
        String query = "SELECT * FROM Products ORDER BY product_id";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            Products products = new Products(
                rs.getInt("product_id"),
                rs.getString("category"),
                rs.getString("image_url"),
                rs.getString("name"),
                rs.getDouble("price"),
                rs.getInt("quantity"),
                rs.getString("description")
            );
            productList.add(products);
        }
    } catch (SQLException ex) {
        Logger.getLogger(Products.class.getName()).log(Level.SEVERE, null, ex);
    }
    return productList;
}
    
    
        public boolean addProducts(Connection con) {
    boolean isAdded = false;
    String query = "INSERT INTO Products (category, image_url, name, price, quantity,description) VALUES (?, ?, ?, ?, ?, ?)";
    
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        // Set the parameters for the query
        pstmt.setString(1, this.category);
        pstmt.setString(2, this.image_url); // Ensure variable matches your class field name
        pstmt.setString(3, this.name);
        pstmt.setDouble(4, this.price);
        pstmt.setInt(5, this.quantity);
        pstmt.setString(6, this.description);

        // Execute the update and check if rows were affected
        int rowsAffected = pstmt.executeUpdate();
        isAdded = rowsAffected > 0;
    } catch (SQLException ex) {
        Logger.getLogger(Products.class.getName()).log(Level.SEVERE, "Error adding product", ex);
    }
    return isAdded;
}
public boolean deleteProduct(Connection con, int productId) {
    boolean isDeleted = false;
    String query = "DELETE FROM Products WHERE product_id = ? LIMIT 1";
    
    try {
        // First verify the product exists and get its details
        String checkQuery = "SELECT * FROM Products WHERE product_id = ?";
        try (PreparedStatement checkStmt = con.prepareStatement(checkQuery)) {
            checkStmt.setInt(1, productId);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                System.out.println("Found product to delete:");
                System.out.println("ID: " + rs.getInt("product_id"));
                System.out.println("Name: " + rs.getString("name"));
                
                // Now proceed with deletion
                try (PreparedStatement deleteStmt = con.prepareStatement(query)) {
                    deleteStmt.setInt(1, productId);
                    int rowsAffected = deleteStmt.executeUpdate();
                    isDeleted = rowsAffected > 0;
                    System.out.println("Deletion result: " + isDeleted);
                }
            } else {
                System.out.println("No product found with ID: " + productId);
                return false;
            }
        }
    } catch (SQLException ex) {
        System.out.println("Error in deleteProduct: " + ex.getMessage());
        ex.printStackTrace();
    }
    return isDeleted;
}

public boolean updateProduct(Connection con) {
    boolean isUpdated = false;
    String query = "UPDATE Products SET category=?, image_url=?, name=?, price=?, quantity=?, description=? WHERE product_id=?";
    
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setString(1, this.category);
        pstmt.setString(2, this.image_url);
        pstmt.setString(3, this.name);
        pstmt.setDouble(4, this.price);
        pstmt.setInt(5, this.quantity);
        pstmt.setString(6, this.description);
        pstmt.setInt(7, this.product_id);
        
        int rowsAffected = pstmt.executeUpdate();
        isUpdated = rowsAffected > 0;
        
        System.out.println("Update attempt for product ID " + this.product_id + 
                         ": " + (isUpdated ? "successful" : "failed"));
    } catch (SQLException ex) {
        System.out.println("Error updating product: " + ex.getMessage());
        Logger.getLogger(Products.class.getName()).log(Level.SEVERE, null, ex);
    }
    return isUpdated;
}

public Products getProductById(Connection con, int productId) {
    String query = "SELECT * FROM Products WHERE product_id = ?";
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setInt(1, productId);
        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            return new Products(
                rs.getInt("product_id"),
                rs.getString("category"),
                rs.getString("image_url"),
                rs.getString("name"),
                rs.getDouble("price"),
                rs.getInt("quantity"),
                rs.getString("description")
            );
        }
    } catch (SQLException ex) {
        Logger.getLogger(Products.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
}


public List<Products> getRelatedProducts(Connection con, String category, int currentProductId) {
    List<Products> relatedProducts = new ArrayList<>();
    String query = "SELECT * FROM Products WHERE category = ? AND product_id != ? LIMIT 4";
    
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setString(1, category);
        pstmt.setInt(2, currentProductId);
        ResultSet rs = pstmt.executeQuery();
        
        while (rs.next()) {
            Products product = new Products(
                rs.getInt("product_id"),
                rs.getString("category"),
                rs.getString("image_url"),
                rs.getString("name"),
                rs.getDouble("price"),
                rs.getInt("quantity"),
                rs.getString("description")
            );
            relatedProducts.add(product);
        }
    } catch (SQLException ex) {
        Logger.getLogger(Products.class.getName()).log(Level.SEVERE, null, ex);
    }
    return relatedProducts;
}


public List<Products> getProductsByCategory(Connection con, String category) {
    List<Products> categoryProducts = new ArrayList<>();
    String query = "SELECT * FROM Products WHERE category = ?";
    
    try (PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setString(1, category);
        ResultSet rs = pstmt.executeQuery();
        
        while(rs.next()) {
            Products product = new Products(
                rs.getInt("product_id"),
                rs.getString("category"),
                rs.getString("image_url"),
                rs.getString("name"),
                rs.getDouble("price"),
                rs.getInt("quantity"),
                rs.getString("description")
            );
            categoryProducts.add(product);
        }
    } catch (SQLException ex) {
        Logger.getLogger(Products.class.getName()).log(Level.SEVERE, null, ex);
    }
    return categoryProducts;
}
}
