<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="app.classes.User" %>
<%@ page import="app.classes.DbConnector" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="app.classes.Order" %>

<%
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

    // Fetch order history for the user
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
            <div class="bg-[#faf7f0] w-screen">
                <div class="container mx-auto px-6 py-4 flex justify-between items-center">
                    <a href="home.jsp" class="inline-block transform transition duration-200 hover:scale-105 hover:shadow-md hover:opacity-90 active:scale-95">
                        <img src="resources/images/logo/woodies_logo.png" alt="Logo" class="h-10 w-auto" />
                    </a>
                    <nav class="flex items-center space-x-6">
                        <a href="home.jsp" class="text-gray-700 bg-opacity-30 hover:text-yellow-500 bg-opacity-30">HOME</a>
                        <a href="shop.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">SHOP</a>
                        <a href="about.jsp" class="text-gray-700 hover:text-yellow-500 bg-opacity-30">ABOUT</a>
                    </nav>
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
        </header>

        <div class="container mx-auto p-6">
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
                    </form>
                </div>
            </div>
            <script>
                public static List < Order > getUserOrders(Connection con, User user) {
                List < Order > orders = new ArrayList < > ();
                String query = "SELECT * FROM orders WHERE user_id = ?";
                try (PreparedStatement stmt = con.prepareStatement(query)) {
                stmt.setInt(1, user.getId());
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                Order order = new Order();
                order.setQuantity(rs.getInt("quantity"));
                order.setPrice(rs.getDouble("price"));
                // set other order properties as needed
                orders.add(order);
                }
                } catch (SQLException e) {
                e.printStackTrace();
                }
                return orders;
                }

            </script>
            <!-- Order History Section -->
            <div class="bg-white shadow rounded-lg p-6 mb-6">
                <h2 class="text-xl font-semibold text-gray-700 mb-4">Order History</h2>
                <div class="overflow-x-auto">
                    <table class="w-full border-collapse">
                        <thead>
                            <tr>

                                <th class="border-b p-3 text-gray-600">Quantity</th>
                                <th class="border-b p-3 text-gray-600">Price</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if (userOrders != null && !userOrders.isEmpty()) {
                                    for (Order order : userOrders) {
                            %>
                            <tr class="hover:bg-gray-50 text-center">
                                <td class="border-b p-3"><%= order.getQuantity()%></td>
                                <td class="border-b p-3">Rs <%= String.format("%.2f", order.getPrice())%></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr class="text-center">
                                <td colspan="3" class="border-b p-3 text-gray-500">No orders found</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>



            <!-- Address Book Section (as previously defined) -->
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
