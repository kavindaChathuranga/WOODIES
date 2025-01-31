<%-- 
    Document   : cart.jsp
    Created on : Dec 8, 2024, 11:23:25 PM
    Author     : Kavinda
--%>

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
        <header class="bg-white shadow">
            <div class="bg-[#faf7f0] w-screen">
                <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                    <a href="home.jsp" class="inline-block transform transition hover:scale-105">
                        <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                    </a>
                    <nav class="hidden md:flex items-center space-x-6">
                        <a href="home.jsp" class="text-gray-700 hover:text-yellow-500">HOME</a>
                        <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500">SHOP</a>
                        <a href="about.jsp" class="text-gray-700 hover:text-yellow-500">ABOUT</a>
                        <a href="product.jsp" class="text-gray-700 hover:text-yellow-500">PRODUCT</a>
                    </nav>
                    <div class="flex items-center space-x-4">
                        <a href="cart.jsp" class="text-yellow-500"><i class="fas fa-shopping-cart h-6 w-6"></i></a>
                        <a href="user_dash.jsp" class="text-gray-700 hover:text-yellow-500"><i class="fas fa-user h-6 w-6"></i></a>
                    </div>
                </div>
            </div>
        </header>

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
                            <tr class="border-b">
                                <td class="flex items-center px-4 py-2">
                                    <img src="resources/images/slider_container/card2.jpg" alt="Product Image" class="h-16 w-16 object-cover rounded mr-2">
                                    <span>Wooden Shelf</span>
                                </td>
                                <td class="px-4 py-2">$120</td>
                                <td class="px-4 py-2 text-center">
                                    <input type="number" value="1" class="w-12 border rounded text-center">
                                </td>
                                <td class="px-4 py-2 text-right">$120</td>
                                <td class="px-4 py-2 text-center">
                                    <button class="text-yellow-500 hover:text-red-500">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Cart Summary -->
                <div class="w-full lg:w-1/3 bg-[#f9f0e7] shadow rounded-lg p-6">
                    <h2 class="text-xl font-semibold mb-4">Cart Totals</h2>
                    <div class="mb-4 flex justify-between">
                        <span>Subtotal</span>
                        <span>$120</span>
                    </div>
                    <hr class="border-t border-gray-300 my-2">
                    <div class="flex justify-between font-bold text-lg">
                        <span>Total</span>
                        <span class="text-yellow-500">$120</span>
                    </div>
                    <a href="checkout.jsp">
                        <button class="w-full mt-6 bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600">
                            Check Out
                        </button>
                    </a>
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
    </body>
</html>
