<%@page import="app.classes.Cart"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.DbConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cart</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>

        <!-- Banner Section -->
        <div class="relative">
            <img src="resources/images/heading_cover/cover.png" alt="Checkout Banner" class="w-full h-[328px] object-cover">
            <div class="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-30 text-center">
                <h1 class="text-4xl font-bold text-white">Cart</h1>
                <p class="text-white text-sm mt-2">
                    <a href="home.jsp" class="hover:text-[#b68f2f]">Home</a> &gt; <span>Cart</span>
                </p>
            </div>
        </div>

        <!-- Cart Section -->
        <div class="container mx-auto px-4 py-8 mt-16 mb-16">
            <h1 class="text-3xl font-semibold text-center mb-6">Your Cart</h1>
            <div class="flex flex-col lg:flex-row gap-8">
                <!-- Cart Items -->
                <div class="w-full lg:w-2/3 overflow-x-auto">
                    <table class="w-full bg-white shadow rounded-lg">
                        <thead class="bg-[#f9f0e7]">
                            <tr>
                                <th class="text-left px-4 py-2 text-gray-600">Product</th>
                                <th class="text-left px-4 py-2 text-gray-600">Price</th>
                                <th class="text-center px-4 py-2 text-gray-600">Quantity</th>
                                <th class="text-right px-4 py-2 text-gray-600">Subtotal</th>
                                <th class="text-center px-4 py-2 text-gray-600">Remove</th>
                            </tr>
                        </thead>
                        <tbody>
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
                                        <tr>
                                            <td colspan="5" class="text-center py-4 text-gray-500">
                                                Your cart is empty
                                            </td>
                                        </tr>
                            <%
                                    } else {
                                        for (Cart item : cartItems) {
                                            double subtotal = item.getPrice() * item.getQuantity();
                                            total += subtotal;
                            %>
                                            <tr id="cart-row-<%=item.getCart_id()%>" class="border-b">
                                                <td class="flex items-center px-4 py-2">
                                                    <img src="<%=item.getImage_url()%>" 
                                                         alt="<%=item.getProductName()%>" 
                                                         class="h-16 w-16 object-cover rounded mr-2">
                                                    <span><%=item.getProductName()%></span>
                                                </td>
                                                <td class="px-4 py-2">Rs. <%=String.format("%.2f", item.getPrice())%></td>
                                                <td class="px-4 py-2 text-center">
                                                    <input type="number" 
                                                           value="<%=item.getQuantity()%>" 
                                                           min="1" 
                                                           class="w-16 border rounded text-center"
                                                           onchange="updateQuantity(<%=item.getCart_id()%>, this.value, <%=item.getPrice()%>)">
                                                </td>
                                                <td id="subtotal-<%=item.getCart_id()%>" class="px-4 py-2 text-right">
                                                    Rs. <%=String.format("%.2f", subtotal)%>
                                                </td>
                                                <td class="px-4 py-2 text-center">
                                                    <button onclick="removeItem(<%=item.getCart_id()%>)" class="text-yellow-500 hover:text-red-500">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </td>
                                            </tr>
                            <%
                                        }
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    try {
                                        if (con != null) con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </div>

                <!-- Cart Summary -->
                <div class="w-full lg:w-1/3 bg-[#f9f0e7] shadow rounded-lg p-6">
                    <h2 class="text-xl font-semibold mb-4">Cart Totals</h2>
                    <div class="mb-4 flex justify-between">
                        <span>Subtotal</span>
                        <span id="cart-subtotal">Rs. <%=String.format("%.2f", total)%></span>
                    </div>
                    <hr class="border-t border-gray-300 my-2">
                    <div class="flex justify-between font-bold text-lg">
                        <span>Total</span>
                        <span id="cart-total" class="text-yellow-500">Rs. <%=String.format("%.2f", total)%></span>
                    </div>
                    <% if (total > 0) { %>
                        <a href="checkout.jsp">
                            <button class="w-full mt-6 bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600">
                                Check Out
                            </button>
                        </a>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <section class="bg-[#faf7f0] py-10 border-t border-gray-200">
            <div class="container mx-auto px-6 grid grid-cols-2 md:grid-cols-4 gap-6 text-center">
                <!-- Feature 1 -->
                <div class="flex items-center md:items-start">
                    <div class="text-yellow-500 text-4xl mr-4">
                        <i class="fas fa-trophy"></i>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">High Quality</h3>
                        <p class="text-gray-600 text-sm">crafted from top materials</p>
                    </div>
                </div>
                <!-- Feature 2 -->
                <div class="flex items-center md:items-start">
                    <div class="text-yellow-500 text-4xl mr-4">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Warranty Protection</h3>
                        <p class="text-gray-600 text-sm">Over 2 years</p>
                    </div>
                </div>
                <!-- Feature 3 -->
                <div class="flex items-center md:items-start">
                    <div class="text-yellow-500 text-4xl mr-4">
                        <i class="fas fa-box"></i>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">Free Shipping</h3>
                        <p class="text-gray-600 text-sm">Order over 150$</p>
                    </div>
                </div>
                <!-- Feature 4 -->
                <div class="flex items-center md:items-start">
                    <div class="text-yellow-500 text-4xl mr-4">
                        <i class="fas fa-headset"></i>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold text-gray-800">24 / 7 Support</h3>
                        <p class="text-gray-600 text-sm">Dedicated support</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>


        <!-- Replace the entire existing script section with the new code -->
        <script>
            function updateQuantity(cartId, quantity, price) {
                // Ensure quantity is at least 1
                quantity = Math.max(1, parseInt(quantity));

                fetch('updateCart.jsp', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `cartId=${cartId}&quantity=${quantity}`
                })
                .then(response => response.json())
                .then(data => {
                    if(data.success) {
                        // Update the subtotal for this item
                        const subtotalCell = document.getElementById(`subtotal-${cartId}`);
                        const subtotal = price * quantity;
                        subtotalCell.textContent = `Rs. ${subtotal.toFixed(2)}`;

                        // Update cart totals
                        updateCartTotal();
                    } else {
                        throw new Error(data.error || 'Failed to update quantity');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Failed to update quantity. Please try again.');
                });
            }

            function removeItem(cartId) {
                if (!confirm('Are you sure you want to remove this item from your cart?')) {
                    return;
                }

                fetch('updateCart.jsp', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `cartId=${cartId}&action=remove`
                })
                .then(response => response.json())
                .then(data => {
                    if(data.success) {
                        // Remove the row from the table
                        const row = document.getElementById(`cart-row-${cartId}`);
                        if (row) {
                            row.remove();

                            // Update cart totals
                            updateCartTotal();

                            // Check if cart is empty
                            const tbody = document.querySelector('tbody');
                            const remainingRows = tbody.querySelectorAll('tr');
                            if (remainingRows.length === 0) {
                                tbody.innerHTML = `
                                    <tr>
                                        <td colspan="5" class="text-center py-4 text-gray-500">
                                            Your cart is empty
                                        </td>
                                    </tr>
                                `;

                                // Hide checkout button if cart is empty
                                const checkoutButton = document.querySelector('a[href="checkout.jsp"]');
                                if (checkoutButton) {
                                    checkoutButton.style.display = 'none';
                                }
                            }
                        }
                    } else {
                        throw new Error(data.error || 'Failed to remove item');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Failed to remove item. Please try again.');
                });
            }

            function updateCartTotal() {
                // Get all subtotal cells
                const subtotalCells = document.querySelectorAll('[id^="subtotal-"]');
                let total = 0;

                // Calculate total from all visible subtotal cells
                subtotalCells.forEach(cell => {
                    const value = parseFloat(cell.textContent.replace('Rs. ', ''));
                    if (!isNaN(value)) {
                        total += value;
                    }
                });

                // Update the subtotal and total displays
                const subtotalDisplay = document.getElementById('cart-subtotal');
                const totalDisplay = document.getElementById('cart-total');

                if (subtotalDisplay) {
                    subtotalDisplay.textContent = `Rs. ${total.toFixed(2)}`;
                }
                if (totalDisplay) {
                    totalDisplay.textContent = `Rs. ${total.toFixed(2)}`;
                }

                // Show/hide checkout button based on total
                const checkoutButton = document.querySelector('a[href="checkout.jsp"]');
                if (checkoutButton) {
                    checkoutButton.style.display = total > 0 ? 'block' : 'none';
                }
            }
        </script>

    </body>
</html>