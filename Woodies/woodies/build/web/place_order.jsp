<%@page import="java.util.List"%>
<%@page import="app.classes.Cart"%>
<%@page import="java.sql.Connection"%>
<%@page import="app.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Order Confirmation Page -->
        <div class="container mx-auto px-4 py-12">
            <div class="max-w-3xl mx-auto bg-white shadow-md rounded-lg p-6 text-center">
                <!-- Confirmation Message -->
                <div class="mb-6">
                    <h1 class="text-3xl font-semibold text-yellow-500">Order Confirmed!</h1>
                    <p class="text-gray-700 mt-2">Thank you for shopping with us! Your order has been placed successfully.</p>
                </div>

                <!-- Order Details -->
                <div class="bg-[#f9f0e7] shadow rounded-lg p-6 mb-6">
                    <h2 class="text-xl font-semibold mb-4">Order Details</h2>

                    <%
                        Integer userId = (Integer) session.getAttribute("userId");
                        if (userId == null) {
                            userId = 1; // Default user ID for non-logged in users
                        }

                        double total = 0;
                        Connection con = null;

                        try {
                            con = DbConnector.getConnection();
                            Cart cart = new Cart();
                            List<Cart> cartItems = cart.getCartItems(con, userId);

                            // Generate a random order ID
                            String orderId = "WO" + System.currentTimeMillis() % 10000;

                            // Insert order into database
                            cart.placeOrder(con, userId, total, cartItems);
                    %>

                    <div class="flex justify-between mb-4">
                        <span class="text-gray-700">Order ID</span>
                        <span class="font-medium">#<%=orderId%></span>
                    </div>

                    <!-- Product Details -->
                    <div class="border-t border-gray-200 py-4">
                        <h3 class="text-lg font-semibold mb-3">Products</h3>
                        <%
                            if (!cartItems.isEmpty()) {
                                for (Cart item : cartItems) {
                                    double subtotal = item.getPrice() * item.getQuantity();
                                    total += subtotal;
                        %>
                        <div class="flex justify-between items-center mb-2">
                            <div class="flex items-center">
                                <img src="<%=item.getImage_url()%>" 
                                     alt="<%=item.getProductName()%>" 
                                     class="h-12 w-12 object-cover rounded mr-2">
                                <div class="text-left">
                                    <p class="font-medium"><%=item.getProductName()%></p>
                                    <p class="text-sm text-gray-500">Quantity: <%=item.getQuantity()%></p>
                                </div>
                            </div>
                            <span class="font-medium">Rs. <%=String.format("%.2f", subtotal)%></span>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>

                    <!-- Total Amount -->
                    <div class="border-t border-gray-200 pt-4 mt-4">
                        <div class="flex justify-between mb-2">
                            <span class="text-gray-700">Subtotal</span>
                            <span class="font-medium">Rs. <%=String.format("%.2f", total)%></span>
                        </div>
                        <div class="flex justify-between font-semibold text-lg">
                            <span class="text-gray-700">Total Amount</span>
                            <span class="text-yellow-500">Rs. <%=String.format("%.2f", total)%></span>
                        </div>
                    </div>

                    <%
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (con != null) {
                                    con.close();
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    %>

                    <hr class="border-t border-gray-300 my-4">
                    <div class="text-left">
                        <p>Order has been successfully placed.</p>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex justify-center gap-4">
                        <a href="shop.jsp">
                            <button class="bg-yellow-500 text-white font-medium py-2 px-6 rounded-lg hover:bg-yellow-600 transition">
                                Continue Shopping
                            </button>
                        </a>
                        <a href="user_dash.jsp">
                            <button class="bg-gray-800 text-white font-medium py-2 px-6 rounded-lg hover:bg-gray-900 transition">
                                View Orders
                            </button>
                        </a>
                    </div>
                </div>
            </div>
    </body>
</html>
