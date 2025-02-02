<%-- 
    Document   : admin
    Created on : Jan 31, 2025, 11:43:49 AM
    Author     : chanu
--%>

<%@page import="java.util.List"%>
<%@page import="app.classes.Products"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Panel</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-50 font-sans">

        <!-- Admin Header -->
        <header class="bg-yellow-500 text-white py-4">
            <div class="container mx-auto flex justify-between items-center">
                <h1 class="text-2xl font-bold">Admin Panel</h1>
                <a href="login.jsp">
                    <button class="bg-red-500 px-4 py-2 rounded hover:bg-red-600">
                        <a href="/logout">Log Out</a>
                    </button>
                </a>
            </div>
        </header>

        <!-- Admin Content -->
        <div class="container mx-auto my-8">
            <!-- Add Product Section -->
            <section class="bg-white p-6 rounded shadow mb-8">
                <h2 class="text-xl font-semibold mb-4">Add New Product</h2>
                <form action="admin_back.jsp" method="POST" class="space-y-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block font-medium text-gray-700">Product Name</label>
                            <input type="text" name="name" class="w-full px-4 py-2 border rounded" required />
                        </div>
                        <div>
                            <label class="block font-medium text-gray-700">Category</label>
                            <select name="category" class="w-full px-4 py-2 border rounded" required>
                                <option value="Home and Living Shelves">Home and Living Shelves</option>
                                <option value="Kitchen and Dining Shelves">Kitchen and Dining Shelves</option>
                                <option value="Garden Shelves">Garden Shelves</option>
                            </select>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block font-medium text-gray-700">Image URL</label>
                            <input type="text" name="image_url" class="w-full px-4 py-2 border rounded" required />
                        </div>
                        <div>
                            <label class="block font-medium text-gray-700">Price</label>
                            <input type="number" step="0.01" name="price" class="w-full px-4 py-2 border rounded" required />
                        </div>
                        <div>
                            <label class="block font-medium text-gray-700">Quantity</label>
                            <input type="number"  name="quantity" class="w-full px-4 py-2 border rounded" required />
                        </div>
                        <div >
                            <label class="block font-medium text-gray-700">Description</label>
                            <textarea name="description" rows="4" class="w-full px-4 py-2 border rounded" required></textarea>
                        </div>
                    </div>
                    <button type="submit" class="bg-yellow-500 mt-6 ml-6 pl-6 pr-6 text-white py-2 rounded hover:bg-yellow-600">
                        Add Product
                    </button>
                </form>
                <br>
                <%
                    // Show success or error messages
                    String status = request.getParameter("s");
                    if ("1".equals(status)) {
                %>
                <p style="color: green;">Product added successfully!</p>
                <%
                } else if ("0".equals(status)) {
                %>
                <p style="color: red;">Failed to add product. Please try again.</p>
                <%
                } else if ("2".equals(status)) {
                %>
                <p style="color: green;">Product deleted successfully!</p>
                <%
                } else if ("3".equals(status)) {
                %>
                <p style="color: red;">Failed to delete product. Please try again.</p>
                <%
                } else if ("4".equals(status)) {
                %>
                <p style="color: red;">Product not found for update.</p>
                <%
                } else if ("5".equals(status)) {
                %>
                <p style="color: green;">Product updated successfully!</p>
                <%
                } else if ("6".equals(status)) {
                %>
                <p style="color: red;">Failed to update product. Please try again.</p>
                <%
                    }
                %>
            </section>
            <br>

            <!-- Update/Delete Product Section -->
            <section class="bg-white p-6 rounded shadow mb-8">
                <h2 class="text-xl font-semibold mb-4">Manage Products</h2>
                <!-- Example table displaying products -->
                <table class="w-full border-collapse border border-gray-300 text-left">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="border border-gray-300 px-4 py-2">Product ID</th>
                            <th class="border border-gray-300 px-4 py-2">Name</th>
                            <th class="border border-gray-300 px-4 py-2">image</th>
                            <th class="border border-gray-300 px-4 py-2">Category</th>
                            <th class="border border-gray-300 px-4 py-2">Price</th>
                            <th class="border border-gray-300 px-4 py-2">quantity</th>
                            <th class="border border-gray-300 px-4 py-2">Description</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection con = DbConnector.getConnection();
                            List<Products> productsList = new Products().getAllProducts(con);
                            int rowIndex = 0; // Add this counter
                            for (Products p : productsList) {
                                rowIndex++; // Increment for each row
                        %>
                        <tr>
                            <%-- Add debug information --%>
                            <% System.out.println("Row " + rowIndex + ": Displaying product ID=" + p.getProduct_id());%>

                            <td class="border border-gray-300 px-4 py-2">
                                <%= p.getProduct_id()%> 
                                <%-- Add visual debug info --%>
                            </td>
                            <td class="border border-gray-300 px-4 py-2"><%= p.getName()%></td>
                            <td class="border border-gray-300 px-4 py-2"><%= p.getImage_url()%></td>
                            <td class="border border-gray-300 px-4 py-2"><%= p.getCategory()%></td>
                            <td class="border border-gray-300 px-4 py-2"><%= p.getPrice()%></td>
                            <td class="border border-gray-300 px-4 py-2"><%= p.getQuantity()%></td>
                            <td class="border border-gray-300 px-4 py-2"><%= p.getDescription()%></td>
                            <td class="border border-gray-300 px-4 py-2">
                                <div class="flex flex-col space-y-2">
                                    <button class="bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">
                                        <a href="updateProduct.jsp?product_id=<%= p.getProduct_id()%>">Update</a>
                                    </button>
                                    <form action="deleteProduct.jsp" method="POST">
                                        <input type="hidden" name="product_id" value="<%= p.getProduct_id()%>">
                                        <button type="submit" 
                                                class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600"
                                                onclick="return confirm('Confirm delete Product ID: <%= p.getProduct_id()%> (Row: <%= rowIndex%>)?');">
                                            Delete
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </section>
        </div>

    </body>
</html>