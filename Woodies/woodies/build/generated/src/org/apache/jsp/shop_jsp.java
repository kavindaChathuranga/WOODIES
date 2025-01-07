package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class shop_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>shop</title>\r\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\r\n");
      out.write("        <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <!-- Navbar -->\r\n");
      out.write("        <header class=\"bg-white shadow\">\r\n");
      out.write("            <!-- Internal CSS -->\r\n");
      out.write("            <style>\r\n");
      out.write("                .dropdown-content {\r\n");
      out.write("                    opacity: 0;\r\n");
      out.write("                    visibility: hidden;\r\n");
      out.write("                    transition: opacity 0.3s ease-in-out, visibility 0.3s ease-in-out;\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("                .dropdown-content.show {\r\n");
      out.write("                    opacity: 1;\r\n");
      out.write("                    visibility: visible;\r\n");
      out.write("                }\r\n");
      out.write("\r\n");
      out.write("                .dropdown:hover .dropdown-text {\r\n");
      out.write("                    color: #F59E0B; /* This is the hover color for CATEGORY */\r\n");
      out.write("                }\r\n");
      out.write("            </style>\r\n");
      out.write("            <div class=\"bg-[#faf7f0] w-screen\">\r\n");
      out.write("                <div class=\"container mx-auto px-6 py-4 flex justify-between items-center\">\r\n");
      out.write("                    <!-- Logo -->\r\n");
      out.write("                    <a href=\"home.jsp\" class=\"inline-block transform transition duration-200 hover:scale-105 hover:shadow-md hover:opacity-90 active:scale-95\">\r\n");
      out.write("                        <img src=\"resources/images/logo/woodies_logo.png\" alt=\"Logo\" class=\"h-10 w-auto\" />\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <!-- Navigation list -->\r\n");
      out.write("                    <nav class=\"flex items-center space-x-6\">\r\n");
      out.write("                        <a href=\"home.jsp\" class=\"text-gray-700 bg-opacity-30 hover:text-yellow-500 bg-opacity-30\">HOME</a>\r\n");
      out.write("                        <a href=\"shop.jsp\" class=\"text-yellow-500 hover:text-yellow-500 bg-opacity-30\">SHOP</a>\r\n");
      out.write("                        <a href=\"about.jsp\" class=\"text-gray-700 hover:text-yellow-500 bg-opacity-30\">ABOUT</a>\r\n");
      out.write("                        <a href=\"product.jsp\" class=\"text-gray-700 hover:text-yellow-500 bg-opacity-30\">product</a>\r\n");
      out.write("                        <!-- Category with Dropdown -->\r\n");
      out.write("                        <div class=\"relative dropdown\" id=\"categoryDropdown\">\r\n");
      out.write("                            <a href=\"#\" class=\"text-gray-700 hover:text-yellow-500 bg-opacity-30 dropdown-text\">CATEGORY</a>\r\n");
      out.write("                            <div class=\"absolute left-0 flex-col bg-white border border-gray-200 rounded shadow-lg mt-2 z-50 min-w-[200px] dropdown-content\">\r\n");
      out.write("                                <a href=\"homeandliving.jsp\" class=\"block px-4 py-2 text-gray-700 hover:text-yellow-500 hover:bg-yellow-100 bg-opacity-30\">\r\n");
      out.write("                                    Home & Living Shelves\r\n");
      out.write("                                </a>\r\n");
      out.write("                                <a href=\"kitchenanddining.jsp\" class=\"block px-4 py-2 text-gray-700 hover:text-yellow-500 hover:bg-yellow-100 bg-opacity-30\">Kitchen & Dining Shelves</a>\r\n");
      out.write("                                <a href=\"garden.jsp\" class=\"block px-4 py-2 text-gray-700 hover:text-yellow-500 hover:bg-yellow-100 bg-opacity-30\">Garden Shelves</a>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </nav>\r\n");
      out.write("                    <!-- Right Icons -->\r\n");
      out.write("                    <div class=\"flex items-center space-x-4\">\r\n");
      out.write("                        <a href=\"cart.jsp\" class=\"text-gray-700 hover:text-yellow-500 bg-opacity-30\">\r\n");
      out.write("                            <i class=\"fas fa-shopping-cart h-6 w-6\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a href=\"user_dash.jsp\" class=\"text-gray-700 hover:text-yellow-500 bg-opacity-30\">\r\n");
      out.write("                            <i class=\"fas fa-user h-6 w-6\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <!-- Internal JavaScript -->\r\n");
      out.write("            <script>\r\n");
      out.write("                const categoryDropdown = document.getElementById('categoryDropdown');\r\n");
      out.write("                const dropdownContent = categoryDropdown.querySelector('.dropdown-content');\r\n");
      out.write("                let hideTimeout;\r\n");
      out.write("\r\n");
      out.write("                // Show dropdown on hover\r\n");
      out.write("                categoryDropdown.addEventListener('mouseenter', () => {\r\n");
      out.write("                    clearTimeout(hideTimeout); // Cancel any hide delay\r\n");
      out.write("                    dropdownContent.classList.add('show'); // Show dropdown\r\n");
      out.write("                });\r\n");
      out.write("\r\n");
      out.write("                // Hide dropdown with delay on mouse leave\r\n");
      out.write("                categoryDropdown.addEventListener('mouseleave', () => {\r\n");
      out.write("                    hideTimeout = setTimeout(() => {\r\n");
      out.write("                        dropdownContent.classList.remove('show'); // Hide dropdown\r\n");
      out.write("                    }, 200); // Delay time in milliseconds (500ms)\r\n");
      out.write("                });\r\n");
      out.write("\r\n");
      out.write("                // Keep the dropdown visible when hovering over the dropdown itself\r\n");
      out.write("                dropdownContent.addEventListener('mouseenter', () => {\r\n");
      out.write("                    clearTimeout(hideTimeout); // Cancel hide delay\r\n");
      out.write("                });\r\n");
      out.write("\r\n");
      out.write("                dropdownContent.addEventListener('mouseleave', () => {\r\n");
      out.write("                    hideTimeout = setTimeout(() => {\r\n");
      out.write("                        dropdownContent.classList.remove('show'); // Hide dropdown\r\n");
      out.write("                    }, 200); // Delay time in milliseconds (500ms)\r\n");
      out.write("                });\r\n");
      out.write("            </script>\r\n");
      out.write("        </header>\r\n");
      out.write("\r\n");
      out.write("        <h1><center>Shop</center></h1>\r\n");
      out.write("        <div class=\"max-w-6xl mx-auto p-6\"\r\n");
      out.write("        <!-- Product Grid -->\r\n");
      out.write("        <div class=\"grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4\">\r\n");
      out.write("             <!-- Product Card 1 -->\r\n");
      out.write("            <div class=\"group relative bg-white rounded-lg overflow-hidden shadow-sm hover:shadow-lg transition-shadow duration-300 cursor-pointer card-zoom\">\r\n");
      out.write("                <div class=\"relative\">\r\n");
      out.write("                    <img src=\"img/boxengasse.png\" alt=\"Stylhome\" class=\"w-full h-48 object-cover\"/>\r\n");
      out.write("                    \r\n");
      out.write("                </div>  \r\n");
      out.write("                <div class=\"p-4\">\r\n");
      out.write("                    <h3 class=\"text-sm font-medium text-gray-900\">Stylhome</h3>\r\n");
      out.write("                    <p class=\"mt-1 text-xs text-gray-500\">home</p>\r\n");
      out.write("                    <p class=\"mt-1 text-sm font-medium text-gray-900\">Rp 2.500.000</p>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        <!-- Footer -->\r\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\r\n");
      out.write("        \r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
