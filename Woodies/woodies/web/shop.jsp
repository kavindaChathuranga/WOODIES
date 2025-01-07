<%-- 
    Document   : shop
    Created on : Dec 8, 2024, 11:27:29 PM
    Author     : Kavinda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>shop</title>
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
                .card-zoom img {
                    transition: transform 0.3s ease;
                }
                .card-zoom:hover img {
                    transform: scale(1.05);
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
                        <a href="shop.jsp" class="text-yellow-500 hover:text-yellow-500 bg-opacity-30">SHOP</a>
                        <a href="about.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">ABOUT</a>
                        <a href="product.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">product</a>
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
        <div class="max-w-6xl mx-auto p-6">
        <!-- Product Grid -->
        <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <!-- Product Card 1 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" alt="Stylhome" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
            <!-- Product Card 2 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" alt="Stylhome" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
            
             <!-- Product Card 3 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" alt="Stylhome" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
             
              <!-- Product Card 3 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
              
             <!-- Product Card 4 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
             
              <!-- Product Card 5 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" alt="Stylhome" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
              
               <!-- Product Card 6 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" alt="Stylhome" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rp 2.500.000</p>
                </div>
            </div>
               
                <!-- Product Card 7 -->
            <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom">
                <div class="relative">
                    <img src="resources/images/slider_container/card1.jpg" alt="Stylhome" class="w-full h-48 object-cover"/>
                    
                </div>
                <div class="p-4">
                    <h3 class="text-sm font-medium text-gray-900">Stylhome</h3>
                    <p class="mt-1 text-xs text-gray-500">home</p>
                    <p class="mt-1 text-sm font-medium text-gray-900">Rs 2.500.000</p>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
        </div>
         

        
        
        
    </body>
</html>
