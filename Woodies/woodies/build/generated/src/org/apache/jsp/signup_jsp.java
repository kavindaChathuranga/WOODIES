package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class signup_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>signup Page</title>\n");
      out.write("        <script src=\"https://kit.fontawesome.com/fc0bcca8a3.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap\" rel=\"stylesheet\">\n");
      out.write("         \n");
      out.write("    </head>\n");
      out.write("    <body class=\"flex justify-center items-center min-h-screen bg-gray-100 font-sans\">\n");
      out.write("        <div class=\"container bg-white rounded-lg shadow-2xl overflow-hidden w-[900px] max-w-full min-h-[480px] relative\">\n");
      out.write("            <!-- Left side - Sign Up Form -->\n");
      out.write("            <div class=\"grid grid-cols-2 h-full\">\n");
      out.write("                <div class=\"p-8\">\n");
      out.write("                    <form class=\"flex flex-col h-full justify-center items-center text-center\">\n");
      out.write("                        <h1 class=\"font-bold text-2xl mb-4\">Create Account</h1>\n");
      out.write("                      \n");
      out.write("                        <input type=\"text\" placeholder=\"First Name\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500\"/>\n");
      out.write("                        <input type=\"text\" placeholder=\"Last Name\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500\"/>\n");
      out.write("                        <input type=\"email\" placeholder=\"Email\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500\"/>\n");
      out.write("                        <div class=\"relative w-full\">\n");
      out.write("                            <input type=\"password\" placeholder=\"Password\" class=\"bg-gray-100 border-none py-3 px-4 mb-6 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500\" id=\"signupPassword\"/>\n");
      out.write("                            <i class=\"fas fa-eye-slash fa-sm absolute right-4 top-1/2 -translate-y-1/2 cursor-pointer text-gray-600\" id=\"signupTogglePassword\"></i>\n");
      out.write("                        </div>\n");
      out.write("                        <a \n");
      out.write("                            href=\"login.jsp\" \n");
      out.write("                            class=\"rounded-full border border-yellow-500 bg-yellow-500 text-white text-base font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-yellow-600 mb-5 inline-block text-center\">\n");
      out.write("                            Sign Up\n");
      out.write("                        </a>                        \n");
      out.write("                        <span class=\"text-sm mb-4\">or use your email for registration</span>\n");
      out.write("                        <div class=\"flex gap-2 my-3\">\n");
      out.write("                            <a href=\"#\" class=\"border border-yellow-500 rounded-full w-10 h-10 flex items-center justify-center transition hover:bg-yellow-200\"><i class=\"fab fa-facebook-f\"></i></a>\n");
      out.write("                            <a href=\"#\" class=\"border border-yellow-500 rounded-full w-10 h-10 flex items-center justify-center transition hover:bg-yellow-200\"><i class=\"fab fa-google\"></i></a>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                 <!-- Right side - Image and Sign In Button -->\n");
      out.write("                <div class=\"bg-yellow-50 flex flex-col items-center justify-center p-8 relative\">\n");
      out.write("                    <img src=\"resources/images/login_signup_image/signup.png\" alt=\"Sign Up Image\" class=\"rounded-lg mb-4 max-w-xs h-auto\"/>\n");
      out.write("                    <div class=\"text-center\">\n");
      out.write("                        <h2 class=\"text-xl font-semibold mb-2\">Already have an account?</h2>\n");
      out.write("                        <p class=\"text-gray-600 mb-6\">Sign in to access your account</p>\n");
      out.write("                        <a href=\"login.jsp\" class=\"rounded-full border-2 border-yellow-500 text-yellow-500 text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-yellow-500 hover:text-white\">Sign In</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <script>\n");
      out.write("            const signupTogglePassword = document.getElementById('signupTogglePassword');\n");
      out.write("            const signupPassword = document.getElementById('signupPassword');\n");
      out.write("\n");
      out.write("            signupTogglePassword.addEventListener('click', function() {\n");
      out.write("                const type = signupPassword.getAttribute('type') === 'password' ? 'text' : 'password';\n");
      out.write("                signupPassword.setAttribute('type', type);\n");
      out.write("                this.classList.toggle('fa-eye');\n");
      out.write("                this.classList.toggle('fa-eye-slash');\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("            \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
