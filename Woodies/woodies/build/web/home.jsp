<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Woodies</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        <style>
            /* Prevent body overflow */
            body, html {
                margin: 0;
                padding: 0;
                overflow-x: hidden; /* Hide horizontal scrollbar */
            }

            /* Reset margins and paddings for all elements */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box; /* Ensure padding and border are included in the element's total size */
            }
        </style>

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
                        <a href="home.jsp" class="text-yellow-500 bg-opacity-30 hover:text-yellow-500 bg-opacity-30">HOME</a>
                        <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">SHOP</a>
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

        <!-- Hero Section -->
        <section class="relative hero-section">
            <div class="flex items-center justify-center px-6 py-16 space-x-10 bg-cover bg-center w-full h-[80vh]" 
                 style="background-image: url('resources/images/homepage_images/cover.jpg');">
                <div class="w-1/2 bg-yellow-500 bg-opacity-30 p-8 flex flex-col justify-center items-center rounded-lg">
                    <h2 class="text-4xl font-bold text-gray-800">Discover Our New Collection</h2>
                    <p class="mt-4 text-gray-600">
                        Crafted for charm, built to inspire ? elevate your space with Woodies.
                    </p>
                    <a href="shop.jsp">
                        <button class="mt-6 px-6 py-3 bg-yellow-500 text-white font-medium rounded hover:bg-yellow-600">
                            Buy Now
                        </button>
                    </a>
                </div>
            </div>
        </section>

        <!-- Category Cards -->
        <div class="container mx-auto px-6 py-8">
            <!-- Container for the heading and slogan -->
            <div class="flex justify-center items-center h-[30vh] px-4">
                <div class="text-center">
                    <!-- Heading -->
                    <h1 class="text-4xl font-semibold text-gray-800">Browse the Range</h1>

                    <!-- Slogan -->
                    <p class="mt-2 text-xl text-gray-600">Find the perfect wood wall shelf to complement your space, style, and needs.</p>
                </div>
            </div>

            <!-- Grid layout for the category cards -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8 justify-items-center">
                <!-- Home & Living Shelves -->
                <a href="homeandliving.jsp" class="bg-white rounded-lg shadow-lg overflow-hidden transform transition-all hover:scale-105 hover:shadow-xl">
                    <div>
                        <img src="resources/images/category/home&living.jpg" alt="Home & Living" class="w-full h-64 object-cover">
                    </div>
                    <div class="p-4">
                        <h3 class="text-lg font-semibold text-gray-800">Home & Living Shelves</h3>
                        <p class="mt-2 text-gray-600">Explore a variety of shelves designed for your living spaces. Functional and stylish!</p>
                    </div>
                </a>

                <!-- Kitchen & Dining -->
                <a href="kitchenanddining.jsp" class="bg-white rounded-lg shadow-lg overflow-hidden transform transition-all hover:scale-105 hover:shadow-xl">
                    <div>
                        <img src="resources/images/category/kitchen&dining.jpg" alt="Kitchen & Dining" class="w-full h-64 object-cover">
                    </div>
                    <div class="p-4">
                        <h3 class="text-lg font-semibold text-gray-800">Kitchen & Dining Shelves</h3>
                        <p class="mt-2 text-gray-600">Discover shelves that bring organization and style to your kitchen and dining area.</p>
                    </div>
                </a>

                <!-- Garden Shelves -->
                <a href="garden.jsp" class="bg-white rounded-lg shadow-lg overflow-hidden transform transition-all hover:scale-105 hover:shadow-xl">
                    <div>
                        <img src="resources/images/category/garden.jpg" alt="Garden" class="w-full h-64 object-cover">
                    </div>
                    <div class="p-4">
                        <h3 class="text-lg font-semibold text-gray-800">Garden Shelves</h3>
                        <p class="mt-2 text-gray-600">Enhance your outdoor space with beautiful and functional garden shelving options.</p>
                    </div>
                </a>
            </div>
        </div>


        <!-- SlideShow -->
        <div class="bg-[#faf7f0] p-10 flex flex-col lg:flex-row items-center justify-center gap-10 min-h-full">
            <!-- Text Content -->
            <div class="max-w-lg text-center lg:text-left">
                <h1 class="text-4xl font-bold mb-4">50+ Stunning Room Inspirations</h1>
                <p class="text-gray-600 mb-6">
                    Transform Your Space with Our Beautifully Crafted Shelves & Decor Ideas from Woodies
                </p>
                <a href="shop.jsp">
                    <button class="mt-6 px-6 py-3 bg-yellow-500 text-white font-medium rounded hover:bg-yellow-600">
                        Explore More
                    </button>
                </a>
            </div>

            <!-- Slider Section -->
            <div class="w3-content w3-section" style="max-width:500px; position:relative">
                <!-- Slider Images -->
                <img class="mySlides w3-animate-fading" src="resources/images/slider_container/card1.jpg" style="width:100%">
                <img class="mySlides w3-animate-fading" src="resources/images/slider_container/card2.jpg" style="width:100%">
                <img class="mySlides w3-animate-fading" src="resources/images/slider_container/card3.jpg" style="width:100%">
                <img class="mySlides w3-animate-fading" src="resources/images/slider_container/card4.jpg" style="width:100%">

                <!-- Dots Navigation -->
                <div class="dots-container" style="position:absolute; bottom:-22px; left:10%; transform:translateX(-50%);">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>
            </div>
        </div>

        <script>
            var myIndex = 0;
            carousel();

            function carousel() {
                var i;
                var slides = document.getElementsByClassName("mySlides");
                var dots = document.getElementsByClassName("dot");

                // Hide all slides
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }

                // Reset the dots
                for (i = 0; i < dots.length; i++) {
                    dots[i].classList.remove("active");
                }

                // Show the current slide
                myIndex++;
                if (myIndex > slides.length) {
                    myIndex = 1;
                }

                slides[myIndex - 1].style.display = "block"; // Display current slide
                dots[myIndex - 1].classList.add("active");  // Add active class to the current dot

                // Call the carousel function every 2 seconds
                setTimeout(carousel, 2000);
            }
        </script>

        <style>
            /* Style for the dots */
            .dot {
                height: 12px;
                width: 12px;
                margin: 0 4px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
                opacity: 0.8; /* Adding some opacity to the non-active dots */
            }

            /* Style for the active dot */
            .active {
                background-color: #fbbf24; /* Yellow color */
                opacity: 1; /* Full opacity for active dot */
            }

            /* Style for the dots container */
            .dots-container {
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    </div>

    <!-- style container -->
    <!-- Container for the heading and slogan -->
    <div class="flex justify-center items-center h-[30vh] px-4">
        <div class="text-center">
            <p class="mt-2 text-xl text-gray-600">share your setup with</p>
            <h1 class="text-4xl font-semibold text-gray-800">#WOODIES</h1>
        </div>
    </div>
    <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mt-4 md:mt-8 lg:mt-12">
        <div class="grid gap-4">
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-1.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-2.jpg" alt="">
            </div>
        </div>
        <div class="grid gap-4">
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-3.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-4.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-5.jpg" alt="">
            </div>
        </div>
        <div class="grid gap-4">
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-6.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-7.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-8.jpg" alt="">
            </div>
        </div>
        <div class="grid gap-4">
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-9.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-10.jpg" alt="">
            </div>
            <div>
                <img class="h-auto max-w-full rounded-lg" src="https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-11.jpg" alt="">
            </div>
        </div>
    </div>




    <!-- Footer -->
    <jsp:include page="footer.jsp"/>
</body>
</html>
