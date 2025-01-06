<%-- 
    Document   : user_dash
    Created on : Dec 8, 2024, 11:24:33 PM
    Author     : Kavinda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user_dash</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Navbar -->
        <header class="bg-white shadow">
            <!-- Internal CSS -->
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
                    color: #F59E0B; /* This is the hover color for CATEGORY */
                }
            </style>
            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <!-- Logo -->
                <a href="home.jsp" class="inline-block transform transition duration-200 hover:scale-105 hover:shadow-md hover:opacity-90 active:scale-95">
                    <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                </a>
                <!-- Navigation list -->
                <nav class="flex items-center space-x-6">
                    <a href="home.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">HOME</a>
                    <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">SHOP</a>
                    <a href="about.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">ABOUT</a>
                    <!-- Category with Dropdown -->
                    <div class="relative dropdown" id="categoryDropdown">
                        <a href="#" class="text-gray-700 hover:text-yellow-500 bg-opacity-30 dropdown-text">CATEGORY</a>
                        <div
                            class="absolute left-0 flex-col bg-white border border-gray-200 rounded shadow-lg mt-2 z-50 min-w-[200px] dropdown-content">
                            <a href="homeandliving.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 bg-opacity-30">Home & Living Shelves</a>
                            <a href="kitchenanddining.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 bg-opacity-30">Kitchen & Dining Shelves</a>
                            <a href="garden.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 bg-opacity-30">Garden Shelves</a>
                        </div>
                    </div>
                </nav>
                <!-- Right Icons -->
                <div class="flex items-center space-x-4">
                    <a href="cart.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">
                        <i class="fas fa-shopping-cart h-6 w-6"></i>
                    </a>
                    <a href="user_dash.jsp" class="text-yellow-500 bg-opacity-30 hover:text-yellow-500 bg-opacity-30">
                        <i class="fas fa-user h-6 w-6"></i>
                    </a>
                </div>
            </div>

            <!-- Internal JavaScript -->
            <script>
                const categoryDropdown = document.getElementById('categoryDropdown');
                const dropdownContent = categoryDropdown.querySelector('.dropdown-content');
                let hideTimeout;

                // Show dropdown on hover
                categoryDropdown.addEventListener('mouseenter', () => {
                    clearTimeout(hideTimeout); // Cancel any hide delay
                    dropdownContent.classList.add('show'); // Show dropdown
                });

                // Hide dropdown with delay on mouse leave
                categoryDropdown.addEventListener('mouseleave', () => {
                    hideTimeout = setTimeout(() => {
                        dropdownContent.classList.remove('show'); // Hide dropdown
                    }, 200); // Delay time in milliseconds (500ms)
                });

                // Keep the dropdown visible when hovering over the dropdown itself
                dropdownContent.addEventListener('mouseenter', () => {
                    clearTimeout(hideTimeout); // Cancel hide delay
                });

                dropdownContent.addEventListener('mouseleave', () => {
                    hideTimeout = setTimeout(() => {
                        dropdownContent.classList.remove('show'); // Hide dropdown
                    }, 200); // Delay time in milliseconds (500ms)
                });
            </script>
        </header>

       <div class="min-h-screen bg-gray-100 py-8 px-6">
    <div class="max-w-4xl mx-auto bg-white shadow-md rounded-lg overflow-hidden">
        <!-- Header -->
        <div class="bg-[#faf7f0] p-6 border-b flex justify-between items-center">
            <h1 class="text-2xl font-bold text-gray-700">User Dashboard</h1>
            <button
                class="bg-red-500 text-white px-4 py-2 rounded-md hover:bg-red-600 active:bg-red-700">
                Logout
            </button>
        </div>

        <!-- Main Content -->
        <div class="p-6 space-y-6">
            <!-- User Details Section -->
            <div>
                <h2 class="text-lg font-bold text-gray-700 mb-4">User Details</h2>
                <div class="space-y-4">
                    <div>
                        <label class="text-sm font-medium text-gray-500">Name:</label>
                        <input type="text" id="userName" value="John Doe"
                            class="w-full mt-1 px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-yellow-400 focus:border-yellow-400" />
                        <button
                            class="mt-2 bg-yellow-500 text-white px-4 py-2 rounded-md hover:bg-yellow-600 active:bg-yellow-700">
                            Save Changes
                        </button>
                    </div>
                    <div>
                        <label class="text-sm font-medium text-gray-500">Email:</label>
                        <p class="mt-1 text-gray-700">johndoe@example.com</p>
                    </div>
                </div>
            </div>

            <!-- Order History Section -->
            <div>
                <h2 class="text-lg font-bold text-gray-700 mb-4">Order History</h2>
                <table class="w-full border border-gray-200 rounded-lg">
                    <thead>
                        <tr class="bg-gray-50 text-left">
                            <th class="px-4 py-2 border-b text-gray-600">Order ID</th>
                            <th class="px-4 py-2 border-b text-gray-600">Date</th>
                            <th class="px-4 py-2 border-b text-gray-600">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border-b">12345</td>
                            <td class="px-4 py-2 border-b">2025-01-01</td>
                            <td class="px-4 py-2 border-b">
                                <span
                                    class="px-2 py-1 text-sm rounded-full bg-green-100 text-green-700">Delivered</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="px-4 py-2 border-b">12346</td>
                            <td class="px-4 py-2 border-b">2025-01-02</td>
                            <td class="px-4 py-2 border-b">
                                <span
                                    class="px-2 py-1 text-sm rounded-full bg-yellow-100 text-yellow-700">Processing</span>
                            </td>
                        </tr>
                        <tr>
                            <td class="px-4 py-2 border-b">12347</td>
                            <td class="px-4 py-2 border-b">2025-01-03</td>
                            <td class="px-4 py-2 border-b">
                                <span
                                    class="px-2 py-1 text-sm rounded-full bg-red-100 text-red-700">Canceled</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
