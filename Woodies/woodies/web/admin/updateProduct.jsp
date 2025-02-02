<%-- 
    Document   : updateProduct
    Created on : Jan 31, 2025, 11:57:46 AM
    Author     : chanu
--%>

<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto py-8">
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h1 class="text-2xl font-bold mb-6">Update Product</h1>
            
            <%
                String productIdStr = request.getParameter("product_id");
                if (productIdStr != null && !productIdStr.isEmpty()) {
                    int productId = Integer.parseInt(productIdStr);
                    Products product = new Products().getProductById(DbConnector.getConnection(), productId);
                    if (product != null) {
            %>
            
            <form action="processUpdate.jsp" method="POST" class="space-y-4">
                <input type="hidden" name="product_id" value="<%= product.getProduct_id() %>">
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Product Name</label>
                        <input type="text" name="name" value="<%= product.getName() %>" 
                               class="w-full px-4 py-2 border rounded focus:outline-none focus:border-blue-500" required>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Category</label>
                        <select name="category" class="w-full px-4 py-2 border rounded focus:outline-none focus:border-blue-500" required>
                            <option value="Home and Living Shelves" <%= product.getCategory().equals("Home and Living Shelves") ? "selected" : "" %>>Home and Living Shelves</option>
                            <option value="Kitchen and Dining Shelves" <%= product.getCategory().equals("Kitchen and Dining Shelves") ? "selected" : "" %>>Kitchen and Dining Shelves</option>
                            <option value="Garden Shelves" <%= product.getCategory().equals("Garden Shelves") ? "selected" : "" %>>Garden Shelves</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Image URL</label>
                        <input type="text" name="image_url" value="<%= product.getImage_url() %>" 
                               class="w-full px-4 py-2 border rounded focus:outline-none focus:border-blue-500" required>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Price</label>
                        <input type="number" step="0.01" name="price" value="<%= product.getPrice() %>" 
                               class="w-full px-4 py-2 border rounded focus:outline-none focus:border-blue-500" required>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Quantity</label>
                        <input type="number" name="quantity" value="<%= product.getQuantity() %>" 
                               class="w-full px-4 py-2 border rounded focus:outline-none focus:border-blue-500" required>
                    </div>
                    
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">Description</label>
                        <textarea name="description" rows="4" 
                                  class="w-full px-4 py-2 border rounded focus:outline-none focus:border-blue-500" required><%= product.getDescription() %></textarea>
                    </div>
                </div>
                
                <div class="flex space-x-4">
                    <button type="submit" class="bg-blue-500 text-white px-6 py-2 rounded hover:bg-blue-600">
                        Update Product
                    </button>
                    <a href="admin.jsp" class="bg-gray-500 text-white px-6 py-2 rounded hover:bg-gray-600">
                        Cancel
                    </a>
                </div>
            </form>
            
            <%
                    } else {
                        response.sendRedirect("admin.jsp?s=4"); // Product not found
                    }
                } else {
                    response.sendRedirect("admin.jsp?s=4"); // No product ID provided
                }
            %>
        </div>
    </div>
</body>
</html>