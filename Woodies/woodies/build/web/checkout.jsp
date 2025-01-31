<%-- 
    Document   : checkout
    Created on : Dec 10, 2024, 12:31:15 PM
    Author     : Kavinda
--%>

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
            <div class="bg-[#faf7f0] w-screen">
                <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                    <!-- Logo -->
                    <a href="home.jsp" class="inline-block transform transition duration-200 hover:scale-105 hover:shadow-md hover:opacity-90 active:scale-95">
                        <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                    </a>
                    <!-- Navigation list -->
                    <nav class="flex items-center space-x-6">
                        <a href="home.jsp" class="text-gray-700 bg-opacity-30 hover:text-yellow-500 bg-opacity-30">HOME</a>
                        <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">SHOP</a>
                        <a href="about.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">ABOUT</a>
                        <!-- Category with Dropdown -->
                        <div class="relative dropdown" id="categoryDropdown">
                            <a href="#" class="text-gray-700 hover:text-yellow-500 bg-opacity-30 dropdown-text">CATEGORY</a>
                            <div class="absolute left-0 flex-col bg-white border border-gray-200 rounded shadow-lg mt-2 z-50 min-w-[200px] dropdown-content">
                                <a href="homeandliving.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 hover:bg-yellow-100 bg-opacity-30">
                                    Home & Living Shelves
                                </a>
                                <a href="kitchenanddining.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 hover:bg-yellow-100 bg-opacity-30">Kitchen & Dining Shelves</a>
                                <a href="garden.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 hover:bg-yellow-100 bg-opacity-30">Garden Shelves</a>
                            </div>
                        </div>
                    </nav>
                    <!-- Right Icons -->
                    <div class="flex items-center space-x-4">
                        <a href="cart.jsp" class="text-yellow-500 hover:text-yellow-500 bg-opacity-30">
                            <i class="fas fa-shopping-cart h-6 w-6"></i>
                        </a>
                        <a href="user_dash.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">
                            <i class="fas fa-user h-6 w-6"></i>
                        </a>
                    </div>
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


        <!-- Banner Section -->
        <div class="relative">
            <img src="resources/images/heading_cover/cover.png" alt="Checkout Banner" class="w-full h-[328px] object-cover">
            <div class="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-30 text-center">
                <h1 class="text-4xl font-bold text-white">Checkout</h1>
                <p class="text-white text-sm mt-2">
                    <a href="home.jsp" class="hover:text-[#b68f2f]">Home</a> &gt; <span><a href="cart.jsp" class="hover:text-[#b68f2f]">Cart</a></span> &gt; <span>Checkout</span>
                </p>
            </div>
        </div>

        <!-- Checkout Section -->
        <div class="container mx-auto px-6 py-12 grid grid-cols-1 md:grid-cols-2 gap-8 mt-16 mb-16">
            <div>
                <h2 class="text-2xl font-bold mb-4">Billing details</h2>
                <form>
                    <div class="grid grid-cols-2 gap-4">
                        <input type="text" placeholder="First Name" class="border p-2 rounded">
                        <input type="text" placeholder="Last Name" class="border p-2 rounded"> 
                    </div>
                    <input type="text" placeholder="Company Name (Optional)" class="w-full border p-2 rounded mt-4">

                    <input type="text" placeholder="Address" class="w-full border p-2 rounded mt-4">
                    <select class="w-full border p-2 rounded mt-4">
                        <option>Western Province</option>
                        <option>Central Province</option>
                        <option>Southern Province</option>
                        <option>Eastern Province</option>
                        <option>Northern Province</option>
                        <option>North Western Province</option>
                        <option>North Central Province</option>
                        <option>Uva Province</option>
                        <option>Sabaragamuwa Province</option>
                        <option>Western Province</option>
                    </select>
                    <input type="text" placeholder="ZIP code" class="w-full border p-2 rounded mt-4">
                    <input type="text" placeholder="Phone" class="w-full border p-2 rounded mt-4">
                    <input type="email" placeholder="Email address" class="w-full border p-2 rounded mt-4">
                    <textarea placeholder="Additional information" class="w-full border p-2 rounded mt-4"></textarea>
                </form>
            </div>

            <div>
                <h2 class="text-2xl font-bold mb-4">Product</h2>
                <div class="border p-4 rounded">
                    <p>Asgaard sofa x 1</p>
                    <p>Subtotal: <strong>Rs. 250,000.00</strong></p>
                    <p class="flex justify-between text-yellow-500 font-bold">
                        <span>Total:</span>
                        <strong>Rs. 250,000.00</strong>
                    </p>
                </div>
                <div class="mt-4">
                    <p>Cash On Delivery</p>
                </div>
                <a href="place_order.jsp"><button class="bg-yellow-500 text-white py-2 rounded hover:bg-yellow-600 px-4 py-2 rounded mt-4 ">Place order</button></a>
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
