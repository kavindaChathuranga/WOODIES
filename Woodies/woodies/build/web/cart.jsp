<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="app.classes.DbConnector"%>
<%@page import="java.sql.*"%>
<%@page import="app.classes.Products"%>
<%
    int userId = 1;
    List<Products> cartItems = new ArrayList<Products>();
    double total = 0;

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        con = DbConnector.getConnection();
        // Fetch the quantity the user wants to buy from the cart table
        String sql = "SELECT p.*, c.quantity AS cart_quantity FROM cart c JOIN products p ON c.product_id = p.product_id WHERE c.user_id = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, userId);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            Products product = new Products();
            product.setProduct_id(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getDouble("price"));
            product.setQuantity(rs.getInt("cart_quantity"));
            product.setImage_url(rs.getString("image_url"));
            cartItems.add(product);
            total += product.getPrice() * product.getQuantity();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
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
                        <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">SHOP</a>
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
                <h1 class="text-4xl font-bold text-white">Cart</h1>
                <p class="text-white text-sm mt-2">
                    <a href="home.jsp" class="hover:text-[#b68f2f]">Home</a> &gt; <span>Cart</span>
                </p>
            </div>
        </div>

        <!-- Cart Section -->
        <div class="container mx-auto px-4 py-8 mt-16 mb-16">
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
                            <% for (Products item : cartItems) {%>
                            <tr class="border-b">
                                <td class="flex items-center px-4 py-2">
                                    <img src="<%= item.getImage_url()%>" alt="Product Image" class="h-16 w-16 object-cover rounded mr-2">
                                    <span><%= item.getName()%></span>
                                </td>
                                <td class="px-4 py-2">$<%= String.format("%.2f", item.getPrice())%></td>
                                <td class="px-4 py-2 text-center">
                                    <form action="updateCart.jsp" method="post" class="inline">
                                        <input type="hidden" name="productId" value="<%= item.getProduct_id()%>">
                                        <input type="number" name="quantity" value="<%= item.getQuantity()%>" min="1" class="w-12 border rounded text-center">
                                        <button type="submit" class="bg-yellow-500 text-white px-2 py-1 rounded">Update</button>
                                    </form>
                                </td>
                                <td class="px-4 py-2 text-right">Rs <%= String.format("%.2f", item.getPrice() * item.getQuantity())%></td>
                                <td class="px-4 py-2 text-center">
                                    <form action="removeFromCart.jsp" method="post" class="inline">
                                        <input type="hidden" name="productId" value="<%= item.getProduct_id()%>">
                                        <button type="submit" class="text-yellow-500 hover:text-red-500">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>

                <!-- Cart Summary -->
                <div class="w-full lg:w-1/3 bg-[#f9f0e7] shadow rounded-lg p-6">
                    <h2 class="text-xl font-semibold mb-4">Cart Totals</h2>
                    <div class="mb-4 flex justify-between">
                        <span>Subtotal</span>
                        <span>Rs <%= String.format("%.2f", total)%></span>
                    </div>
                    <hr class="border-t border-gray-300 my-2">
                    <div class="flex justify-between font-bold text-lg">
                        <span>Total</span>
                        <span class="text-yellow-500">Rs <%= String.format("%.2f", total)%></span>
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
        <section class="bg-[#faf7f0] py-10 border-t border-gray-200 mt-12 mb-12">
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