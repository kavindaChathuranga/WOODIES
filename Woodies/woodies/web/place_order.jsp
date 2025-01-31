<%-- 
    Document   : place_order
    Created on : Jan 8, 2025, 2:09:01 PM
    Author     : Kavinda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    </head>
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
            <div class="flex justify-between mb-4">
                <span class="text-gray-700">Order ID</span>
                <span class="font-medium">#WO12345</span>
            </div>
            <div class="flex justify-between mb-4">
                <span class="text-gray-700">Product</span>
                <span class="font-medium">Wooden Shelf</span>
            </div>
            <div class="flex justify-between mb-4">
                <span class="text-gray-700">Quantity</span>
                <span class="font-medium">1</span>
            </div>
            <div class="flex justify-between mb-4">
                <span class="text-gray-700">Total Amount</span>
                <span class="font-medium text-yellow-500">$120</span>
            </div>
            <hr class="border-t border-gray-300 my-4">
            <div class="text-left">
                <h3 class="text-lg font-semibold">Delivery Address</h3>
                <p class="text-gray-700 mt-1">
                    John Doe <br>
                    123 Main Street <br>
                    Western Province, Sri Lanka <br>
                    Contact: +94 71 234 5678
                </p>
            </div>
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
