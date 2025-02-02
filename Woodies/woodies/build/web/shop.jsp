<%-- 
    Document   : shop
    Created on : Dec 8, 2024, 11:27:29 PM
    Author     : Kavinda
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="app.classes.Products"%>
<%@page import="app.classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!User user = new User();
    Products products = new Products();%>
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
            </style>
            <div class="bg-[#faf7f0] w-screen">
                <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                    <!-- Logo -->
                    <a href="home.jsp" class="inline-block transform transition duration-200 hover:scale-105 hover:shadow-md hover:opacity-90 active:scale-95">
                        <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                    </a>
                    <!-- Navigation list -->
                    <nav class="flex items-center space-x-6">
                        <a href="checkout.jsp" class="text-gray-700 bg-opacity-30 hover:text-yellow-500 bg-opacity-30">HOME</a>
                        <a href="shop.jsp" class="text-yellow-500 hover:text-yellow-500 bg-opacity-30">SHOP</a>
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

                categoryDropdown.addEventListener('mouseenter', () => {
                    clearTimeout(hideTimeout);
                    dropdownContent.classList.add('show');
                });

                categoryDropdown.addEventListener('mouseleave', () => {
                    hideTimeout = setTimeout(() => {
                        dropdownContent.classList.remove('show');
                    }, 200);
                });

                dropdownContent.addEventListener('mouseenter', () => {
                    clearTimeout(hideTimeout);
                });

                dropdownContent.addEventListener('mouseleave', () => {
                    hideTimeout = setTimeout(() => {
                        dropdownContent.classList.remove('show');
                    }, 200);
                });
            </script>
        </header>

        <!-- Banner Section -->
        <div class="relative">
            <img src="resources/images/heading_cover/cover.png" alt="Checkout Banner" class="w-full h-[328px] object-cover">
            <div class="absolute inset-0 flex flex-col items-center justify-center bg-black bg-opacity-30 text-center">
                <h1 class="text-4xl font-bold text-white">Shop</h1>
                <p class="text-white text-sm mt-2">
                    <a href="home.jsp" class="hover:text-[#b68f2f]">Home</a> &gt; <span>Shop</span>
                </p>
            </div>
        </div>

        <!-- Shop Title Section -->
        <div class="relative w-full h-48 flex items-center justify-center mb-2">
            <div class="text-center">
                <h1 class="text-4xl font-bold text-gray-800 mb-2">Shop Collection</h1>
                <p class="text-lg text-gray-600">Discover our handcrafted wooden furniture</p>
            </div>
        </div>

        <div class="max-w-6xl mx-auto p-6">
            <!-- Product Grid -->
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-16">
                <%
                    Connection con = null;
                    try {
                        con = DbConnector.getConnection();
                        List<Products> productList = products.getAllProducts(con);
                        for (Products p : productList) {
                %>
                <!-- Product Card -->
                <a href="product.jsp?id=<%=p.getProduct_id()%>" class="block">
                    <div class="group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom mt-8">
                        <div class="relative">
                            <img src="<%=p.getImage_url()%>" alt="<%=p.getName()%>" class="w-full h-48 object-cover"/>
                        </div>
                        <div class="p-4">
                            <h3 class="text-sm font-medium text-gray-900"><%=p.getName()%></h3>
                            <p class="mt-1 text-xs text-gray-500"><%=p.getCategory()%></p>
                            <p class="mt-1 text-sm font-medium text-gray-900">Rs. <%=p.getPrice()%></p>
                        </div>
                    </div>
                </a>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<p>Error loading products: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    } finally {
                        if (con != null) {
                            try {
                                con.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </div>
        </div>
        <!-- Footer -->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
