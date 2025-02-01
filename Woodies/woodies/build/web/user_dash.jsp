<%@page import="java.sql.SQLException"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="app.classes.User" %>
<%@ page import="app.classes.DbConnector" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="app.classes.Order" %>

<%
    // Get the user ID from session
    Integer userId = (Integer) session.getAttribute("user_id");
    User user = new User();
    String firstName = "";
    String lastName = "";
    String email = "";

    if (userId != null) {
        user.setId(userId);
        Connection con = null;
        try {
            con = DbConnector.getConnection();
            user = user.getUserById(con);
            firstName = user.getFirstname();
            lastName = user.getLastname();
            email = user.getEmail();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Dashboard - Woodies</title>
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
                        <a href="user_dash.jsp" class="text-yellow-500 hover:text-yellow-500 bg-opacity-30">
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

        <div class="container mx-auto p-6">
            <!-- Dashboard Header -->
            <div class="flex justify-between items-center mb-6">
                <h1 class="text-3xl font-bold text-gray-800">User Dashboard</h1>
                <form action="LogoutServlet" method="post">
                    <button class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600 transition">Logout</button>
                </form>
            </div>

            <!-- User Profile Section -->
            <div class="bg-white shadow rounded-lg p-6 mb-6">
                <h2 class="text-xl font-semibold text-gray-700 mb-4">User Profile</h2>
                <div>
                    <form id="profileForm" method="post" action="UpdateProfileServlet">
                        <div class="space-y-4">
                            <div>
                                <label for="firstname" class="block text-gray-600 font-medium">First Name:</label>
                                <input type="text" id="firstname" name="firstname" value="<%= firstName%>" class="w-full border rounded-lg p-2 text-gray-700" readonly>
                            </div>
                            <div>
                                <label for="lastname" class="block text-gray-600 font-medium">Last Name:</label>
                                <input type="text" id="lastname" name="lastname" value="<%= lastName%>" class="w-full border rounded-lg p-2 text-gray-700" readonly>
                            </div>
                            <div>
                                <label for="email" class="block text-gray-600 font-medium">Email:</label>
                                <input type="email" id="email" name="email" value="<%= email%>" class="w-full border rounded-lg p-2 text-gray-700" readonly>
                            </div>
                        </div>
                        <div class="flex space-x-4 mt-4">
                            <button type="button" id="edit-profile" class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600">Edit Profile</button>
                            <button type="submit" id="save-profile" class="bg-green-500 text-white px-4 py-2 rounded-lg hover:bg-green-600 hidden">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                const editButton = document.getElementById('edit-profile');
                const saveButton = document.getElementById('save-profile');
                const inputs = document.querySelectorAll('#firstname, #lastname, #email');
                const form = document.getElementById('profileForm');
                editButton.addEventListener('click', (e) => {
                e.preventDefault();
                inputs.forEach(input => input.removeAttribute('readonly'));
                editButton.classList.add('hidden');
                saveButton.classList.remove('hidden');
                });
                form.addEventListener('submit', async (e) => {
                e.preventDefault();
                try {
                const formData = new FormData(form);
                const response = await fetch('UpdateProfileServlet', {
                method: 'POST',
                        body: formData
                });
                if (response.ok) {
                inputs.forEach(input => input.setAttribute('readonly', true));
                editButton.classList.remove('hidden');
                saveButton.classList.add('hidden');
                alert('Profile updated successfully!');
                } else {
                alert('Failed to update profile. Please try again.');
                }
                } catch (error) {
                console.error('Error:', error);
                alert('An error occurred while updating the profile.');
                }
                });</script>

            <!-- Order History Section -->
            <div class="bg-white shadow rounded-lg p-6 mb-6">
                <h2 class="text-xl font-semibold text-gray-700 mb-4">Order History</h2>
                <%
                    List<Order> userOrders = null;
                    Connection orderCon = null;
                    try {
                        orderCon = DbConnector.getConnection();
                        userOrders = Order.getUserOrders(orderCon, user);
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (orderCon != null) {
                            try {
                                orderCon.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
                <div class="overflow-x-auto">
                    <table class="w-full border-collapse">
                        <thead>
                            <tr>
                                <th class="border-b p-3 text-gray-600">Order No</th>
                                <th class="border-b p-3 text-gray-600">Date</th>
                                <th class="border-b p-3 text-gray-600">Status</th>
                                <th class="border-b p-3 text-gray-600">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (userOrders != null && !userOrders.isEmpty()) { %>
                            <% for (Order order : userOrders) {%>
                            <tr class="hover:bg-gray-50 text-center">
                                <td class="border-b p-3"><%= order.getOrderNo()%></td>
                                <td class="border-b p-3"><%= order.getOrderDate().toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))%></td>
                                <td class="border-b p-3">
                                    <span class="<%= order.getOrderStatus()%>"><%= order.getOrderStatus()%></span>
                                </td>
                                <td class="border-b p-3">Rs <%= String.format("%.2f", order.getAmount())%></td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr class="text-center">
                                <td colspan="4" class="border-b p-3 text-gray-500">No orders found</td>
                            </tr>
                            <% }%>
                        </tbody>

                    </table>
                </div>
            </div>

            <!-- Address Book Section -->
            <div class="bg-white shadow rounded-lg p-6">
                <h2 class="text-xl font-semibold text-gray-700 mb-4">Address Book</h2>
                <div class="mb-4 p-4 bg-gray-50 border rounded-lg flex justify-between">
                    <p class="text-gray-600">123 Main Street, Badulla</p>
                    <div class="space-x-2">
                        <button class="bg-yellow-500 text-white px-3 py-1 rounded-lg hover:bg-yellow-600">Edit</button>
                        <button class="bg-red-500 text-white px-3 py-1 rounded-lg hover:bg-red-600">Delete</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"/>

        <script>
            const editButton = document.getElementById('edit-profile');
            const saveButton = document.getElementById('save-profile');
            const inputs = document.querySelectorAll('#name, #email, #phone');
            editButton.addEventListener('click', (e) => {
            e.preventDefault();
            inputs.forEach(input => input.removeAttribute('readonly'));
            editButton.classList.add('hidden');
            saveButton.classList.remove('hidden');
            });
            saveButton.addEventListener('click', (e) => {
            e.preventDefault();
            inputs.forEach(input => input.setAttribute('readonly', true));
            editButton.classList.remove('hidden');
            saveButton.classList.add('hidden');
            // Add code to save changes to the server here
            alert('Profile updated successfully!');
            });
        </script>
    </body>
</html>