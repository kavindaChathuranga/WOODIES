<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Woodies</title>
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

            <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                <!-- Navbar -->
                <!-- Logo -->
                <a href="home.jsp">
                    <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                </a>

                <nav class="flex items-center space-x-6">
                    <a href="shop.jsp" class="text-yellow-500 bg-opacity-30 hover:text-yellow-500 bg-opacity-30">HOME</a>
                    <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">SHOP</a>
                    <a href="about.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">ABOUT</a>

                    <!-- Category with Dropdown -->
                    <div class="relative dropdown" id="categoryDropdown">
                        <a href="#" class="text-gray-700 hover:text-yellow-500 bg-opacity-30 dropdown-text">CATEGORY</a>
                        <div
                            class="absolute left-0 flex-col bg-white border border-gray-200 rounded shadow-lg mt-2 z-50 min-w-[200px] dropdown-content">
                            <a href="homeandliving.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 bg-opacity-30 hover:bg-gray-100">Home & Living Shelves</a>
                            <a href="kitchenanddining.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 bg-opacity-30 hover:bg-gray-100">Kitchen & Dining Shelves</a>
                            <a href="garden.jsp" class="block px-4 py-2 text-gray-700 hover:text-yellow-500 bg-opacity-30 hover:bg-gray-100">Garden Shelves</a>
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
    </body>
</html>