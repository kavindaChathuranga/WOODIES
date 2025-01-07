<%-- 
    Document   : shop
    Created on : Dec 8, 2024, 11:27:29 PM
    Author     : Kavinda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    </head>
    <body class="bg-gray-50 font-sans">
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
                        <a href="product.jsp" class="text-yellow-500 hover:text-yellow-500 bg-opacity-30">product</a>
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
                        <a href="cart.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">
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

        <main class="container mx-auto p-6">
            <div class="flex flex-col md:flex-row bg-white shadow-lg rounded-lg p-6">
                <img src="resources/images/slider_container/card2.jpg" alt="Product Image" class="w-[300px] h-[300px] rounded-lg">
                <div class="md:ml-6 mt-6 md:mt-0 w-full md:w-1/2">
                    <h2 class="text-3xl font-bold text-gray-800">Wooden Shelf</h2>
                    <p class="text-gray-600 mt-4">A beautiful handcrafted wooden shelf that adds style and utility to any room. Perfect for displaying your favorite decor items or storing books.</p>
                    <p class="text-2xl font-semibold text-yellow-500 mt-4">$120.00</p>
                    <p class="text-gray-600 mt-2">Stock: 25</p>
                    <form action="AddToCartServlet" method="post" class="mt-6 inline-block mr-4">
                        <input type="hidden" name="productId" value="1">
                        <button type="submit" class="bg-white text-black border-2 border-gray-600 rounded-3xl px-6 py-2 hover:bg-transparent hover:border-gray-400 hover:text-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-400 transition-all duration-300">
                            Add to Cart
                        </button>
                    </form>
                    <form action="BuyNowServlet" method="post" class="mt-6 inline-block">
                        <input type="hidden" name="productId" value="1">
                        <button type="submit" class="bg-white text-black border-2 border-gray-600 rounded-3xl px-6 py-2 hover:bg-transparent hover:border-gray-400 hover:text-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-400 transition-all duration-300">
                            Buy Now
                        </button>
                    </form>
                </div>
            </div>
            <div class="flex flex-col">
                <!-- Title Section -->
                <div class="text-center mb-6 mt-12">
                    <p class="font-medium text-gray-700 text-2xl cursor-pointer">Description</p>
                </div>
                <!-- Description Text -->
                <div class="text-center px-4 md:px-8">
                    <p class="text-gray-700 leading-relaxed mb-4">
                        Embodying the raw, wayward spirit of rock 'n' roll, the Kilburn portable active stereo speaker takes the unmistakable look and
                        sound of Marshall, unplugs the chords, and takes the show on the road.
                    </p>
                    <p class="text-gray-700 leading-relaxed mb-4">
                        Weighing in under 7 pounds, the Kilburn is a lightweight piece of vintage styled engineering. Setting the bar as one of the loudest
                        speakers in its class, the Kilburn is a compact, stout-hearted hero with a well-balanced audio which boasts a clear midrange
                        and extended highs for a sound that is both articulate and pronounced.
                    </p>
                    <p class="text-gray-700 leading-relaxed">
                        The analogue knobs allow you to fine tune the controls to your personal preferences while the guitar-influenced leather strap enables easy and stylish travel.
                    </p>
                </div>
                <!-- Image Containers -->
                <div class="mt-8 flex flex-col md:flex-row gap-6">
                    <div class="md:w-1/2">
                        <img src="resources/images/slider_container/card2.jpg" alt="Image 1" class="w-full h-[300px] rounded-lg shadow-md">
                    </div>
                    <div class="md:w-1/2">
                        <img src="resources/images/slider_container/card2.jpg" alt="Image 2" class="w-full h-[300px] rounded-lg shadow-md">
                    </div>
                </div>
            </div>



            <!-- Container -->
            <div class="container mx-auto mb-6 mt-12 px-6 py-10">
                <h2 class="text-3xl font-bold text-gray-800  mb-10">Related Products</h2>


                <!-- Product Cards -->
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <!-- Card 1 -->
                    <a href="productDetails.jsp?id=1" class="block bg-white shadow-lg rounded-lg overflow-hidden transition transform hover:scale-105 hover:shadow-2xl duration-300">
                        <div class="relative">
                            <img src="resources/images/slider_container/card3.jpg" alt="Product Image" class="w-full h-56 object-cover">
                        </div>
                        <div class="p-4">
                            <h3 class="text-lg font-semibold text-gray-800">Syltherine</h3>
                            <p class="text-gray-600 text-sm">Stylish cafe chair</p>
                            <p class="text-lg font-bold text-yellow-500">Rs 2.500.000</p>
                        </div>
                    </a>

                    <!-- Card 2 -->
                    <a href="productDetails.jsp?id=2" class="block bg-white shadow-lg rounded-lg overflow-hidden transition transform hover:scale-105 hover:shadow-2xl duration-300">
                        <div class="relative">
                            <img src="resources/images/slider_container/card4.jpg" alt="Product Image" class="w-full h-56 object-cover">
                        </div>
                        <div class="p-4">
                            <h3 class="text-lg font-semibold text-gray-800">Leviosa</h3>
                            <p class="text-gray-600 text-sm">Stylish cafe chair</p>
                            <p class="text-lg font-bold text-yellow-500">Rs 2.500.000</p>
                        </div>
                    </a>

                    <!-- Card 3 -->
                    <a href="productDetails.jsp?id=3" class="block bg-white shadow-lg rounded-lg overflow-hidden transition transform hover:scale-105 hover:shadow-2xl duration-300">
                        <div class="relative">
                            <img src="resources/images/slider_container/card1.jpg" alt="Product Image" class="w-full h-56 object-cover">
                        </div>
                        <div class="p-4">
                            <h3 class="text-lg font-semibold text-gray-800">Lolito</h3>
                            <p class="text-gray-600 text-sm">Luxury big sofa</p>
                            <p class="text-lg font-bold text-yellow-500">Rs 7.000.000</p>
                        </div>
                    </a>

                    <!-- Card 4 -->
                    <a href="productDetails.jsp?id=4" class="block bg-white shadow-lg rounded-lg overflow-hidden transition transform hover:scale-105 hover:shadow-2xl duration-300">
                        <div class="relative">
                            <img src="resources/images/slider_container/card2.jpg" alt="Product Image" class="w-full h-56 object-cover">
                        </div>
                        <div class="p-4">
                            <h3 class="text-lg font-semibold text-gray-800">Respira</h3>
                            <p class="text-gray-600 text-sm">Outdoor bar table and stool</p>
                            <p class="text-lg font-bold text-yellow-500">Rs 500.000</p>
                        </div>
                    </a>
                </div>
        </main>

        <!-- Footer -->
        <jsp:include page="footer.jsp"/>

    </body>
</html>
