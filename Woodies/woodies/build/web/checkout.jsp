<%@page import="app.classes.Cart"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <header class="bg-white shadow">
            <style>
                .dropdown-content {
                    opacity: 0;
                    visibility: hidden;
                    transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;
                }

                .dropdown-content.show {
                    opacity: 1;
                    visibility: visible;
                }

                .dropdown:hover .dropdown-text {
                    color: #F59E0B;
                }
            </style>
            <div class="bg-[#faf7f0] w-screen">
                <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                    <a href="home.jsp" class="inline-block transform transition duration-200 hover:scale-105 hover:shadow-md hover:opacity-90 active:scale-95">
                        <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                    </a>
                    <nav class="flex items-center space-x-6">
                        <a href="home.jsp" class="text-gray-700 hover:text-yellow-500">HOME</a>
                        <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500">SHOP</a>
                        <a href="about.jsp" class="text-gray-700 hover:text-yellow-500">ABOUT</a>
                        <div class="relative dropdown" id="categoryDropdown">
                            <a href="#" class="text-gray-700 hover:text-yellow-500 dropdown-text">CATEGORY</a>
                            <div class="absolute left-0 flex-col bg-white border border-gray-200 rounded shadow-lg mt-2 z-50 min-w-[200px] dropdown-content">
                                <a href="homeandliving.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500">Home & Living Shelves</a>
                                <a href="kitchenanddining.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500">Kitchen & Dining Shelves</a>
                                <a href="garden.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500">Garden Shelves</a>
                            </div>
                        </div>
                    </nav>
                    <div class="flex items-center space-x-4">
                        <a href="cart.jsp" class="text-yellow-500">
                            <i class="fas fa-shopping-cart h-6 w-6"></i>
                        </a>
                        <a href="user_dash.jsp" class="text-gray-700 hover:text-yellow-500">
                            <i class="fas fa-user h-6 w-6"></i>
                        </a>
                    </div>
                </div>
            </div>
        </header>

        <!-- Banner Section -->
        <div class="relative">
            <img src="resources/images/heading_cover/cover.png" alt="Checkout Banner" class="w-full h-[328px] object-cover">
            <div class="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-30 text-center">
                <h1 class="text-4xl font-bold text-white">Checkout</h1>
                <p class="text-white text-sm mt-2">
                    <a href="home.jsp" class="hover:text-[#b68f2f]">Home</a> &gt; <a href="cart.jsp" class="hover:text-[#b68f2f]">Cart</a> &gt; Checkout
                </p>
            </div>
        </div>

        <!-- Checkout Section -->
        <div class="container mx-auto px-6 py-12 grid grid-cols-1 md:grid-cols-2 gap-8 mt-16 mb-16">
            <div>
                <h2 class="text-2xl font-bold mb-4">Billing details</h2>
                <form id="billingForm" onsubmit="submitBillingForm(event)">
                    <div class="grid grid-cols-2 gap-4">
                        <input type="text" id="firstName" name="firstName" placeholder="First Name" class="border p-2 rounded" required>
                        <input type="text" id="lastName" name="lastName" placeholder="Last Name" class="border p-2 rounded" required>
                    </div>
                    <input type="text" id="companyName" name="companyName" placeholder="Company Name (Optional)" class="w-full border p-2 rounded mt-4">
                    <input type="text" id="address" name="address" placeholder="Address" class="w-full border p-2 rounded mt-4" required>
                    <select id="province" name="province" class="w-full border p-2 rounded mt-4" required>
                        <option value="">Select Province</option>
                        <option value="Central Province">Central Province</option>
                        <option value="Eastern Province">Eastern Province</option>
                        <option value="North Central Province">North Central Province</option>
                        <option value="Northern Province">Northern Province</option>
                        <option value="North Western Province">North Western Province</option>
                        <option value="Sabaragamuwa Province">Sabaragamuwa Province</option>
                        <option value="Southern Province">Southern Province</option>
                        <option value="Uva Province">Uva Province</option>
                        <option value="Western Province">Western Province</option>
                    </select>
                    <input type="text" id="zipCode" name="zipCode" placeholder="ZIP code" class="w-full border p-2 rounded mt-4" required>
                    <input type="tel" id="phone" name="phone" placeholder="Phone" class="w-full border p-2 rounded mt-4" required>
                    <input type="email" id="email" name="email" placeholder="Email address" class="w-full border p-2 rounded mt-4" required>
                    <textarea id="additionalInfo" name="additionalInfo" placeholder="Additional information" class="w-full border p-2 rounded mt-4"></textarea>
                    <button type="submit" class="bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600 px-4 mt-4">
                        Save Billing Details
                    </button>
                </form>
            </div>

            <!-- Updated Product Summary Section -->
            <div>
                <h2 class="text-2xl font-bold mb-4">Order Summary</h2>
                <div class="border p-4 rounded">
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

                            if (cartItems.isEmpty()) {
                    %>
                    <p class="text-center text-gray-500">Your cart is empty</p>
                    <%
                    } else {
                        for (Cart item : cartItems) {
                            double subtotal = item.getPrice() * item.getQuantity();
                            total += subtotal;
                    %>
                    <div class="mb-2 pb-2 border-b">
                        <p class="flex justify-between">
                            <span><%=item.getProductName()%> x <%=item.getQuantity()%></span>
                            <span>Rs. <%=String.format("%.2f", subtotal)%></span>
                        </p>
                    </div>
                    <%
                        }
                    %>
                    <p class="flex justify-between font-semibold mt-4">
                        <span>Subtotal:</span>
                        <span>Rs. <%=String.format("%.2f", total)%></span>
                    </p>
                    <p class="flex justify-between text-yellow-500 font-bold mt-2">
                        <span>Total:</span>
                        <span>Rs. <%=String.format("%.2f", total)%></span>
                    </p>
                    <%
                            }
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
                </div>
                <div class="mt-4">
                    <p>Cash On Delivery</p>
                </div>
                <button id="placeOrderBtn" class="bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600 px-4 mt-4 hidden" 
                        onclick="window.location.href='place_order.jsp'"
                        <%=total == 0 ? "disabled" : ""%>>
                    Place order
                </button>
            </div>
        </div>

        <!-- Script section remains the same -->
        <script>
            async function submitBillingForm(event) {
                event.preventDefault();

                try {
                    const form = document.getElementById('billingForm');
                    const formData = new URLSearchParams(new FormData(form));

                    const response = await fetch('SaveBillingServlet', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: formData.toString()
                    });

                    const result = await response.json();

                    if (result.success) {
                        alert('Billing details saved successfully!');
                        document.getElementById('placeOrderBtn').classList.remove('hidden');
                    } else {
                        alert('Error: ' + (result.message || 'Failed to save billing details'));
                    }
                } catch (error) {
                    console.error('Error:', error);
                    alert('An error occurred while saving billing details');
                }
            }
        </script>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
    </body>
</html>