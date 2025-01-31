
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
<body class="bg-gray-100 text-sm">

    <!-- Admin Header -->
    <header class="bg-blue-600 text-white py-4">
        <div class="container mx-auto flex justify-between items-center">
            <h1 class="text-2xl font-bold">Admin Panel</h1>
            <button class="bg-red-500 px-4 py-2 rounded hover:bg-red-600">
                <a href="/logout">Log Out</a>
            </button>
        </div>
    </header>

    <!-- Admin Content -->
    <div class="container mx-auto my-8">
        <!-- Add Product Section -->
        <section class="bg-white p-6 rounded shadow mb-8">
            <h2 class="text-xl font-semibold mb-4">Add New Product</h2>
            <form action="admin_registration.jsp" method="POST" class="space-y-4">
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
                <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">
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
                    <!-- Example row -->
                    
                    <%
                        Connection con = DbConnector.getConnection();
                        List<Products> productsList = new Products().getAllProducts(con);
                        for (Products p : productsList) {
                    %>
                    <tr>
                        <td class="border border-gray-300 px-4 py-2 "><%= p.getProduct_id() %></td>
                        <td class="border border-gray-300 px-4 py-2"><%= p.getName() %></td>
                        <td class="border border-gray-300 px-4 py-2"><%= p.getImage_url() %></td>
                        <td class="border border-gray-300 px-4 py-2"><%= p.getCategory() %></td>
                        <td class="border border-gray-300 px-4 py-2"><%= p.getPrice() %></td>
                        <td class="border border-gray-300 px-4 py-2"><%= p.getQuantity() %></td>
                        <td class="border border-gray-300 px-4 py-2"><%= p.getDescription() %></td>
                        <td class="border border-gray-300 px-4 py-2">
                            <div class="flex flex-col space-y-2">
                                <button class="bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600">Update</button>
                                <button class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Delete</button>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <!-- Repeat rows as necessary -->
                </tbody>
            </table>
        </section>
    </div>

</body>
</html>