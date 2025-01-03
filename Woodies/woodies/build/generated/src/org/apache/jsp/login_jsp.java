package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>login  Page</title>\n");
      out.write("        <script src=\"https://kit.fontawesome.com/fc0bcca8a3.js\" crossorigin=\"anonymous\"></script>\n");
      out.write("        <script src=\"https://cdn.tailwindcss.com\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"flex justify-center items-center min-h-screen bg-gray-100 font-[Montserrat] -mt-5 mb-12\">\n");
      out.write("        <div class=\"container bg-white rounded-lg shadow-2xl overflow-hidden w-[768px] max-w-full min-h-[480px] relative\" id=\"container\">\n");
      out.write("            <!-- Sign up form container-->\n");
      out.write("            <div class=\"form-container sign-up-container\">\n");
      out.write("                <form class=\"bg-white flex flex-col px-12 h-full justify-center items-center text-center\">\n");
      out.write("                    <h1 class=\"font-bold text-2xl mb-4\">Create Account</h1>\n");
      out.write("                    <!--Social icons-->\n");
      out.write("                    <div class=\"flex gap-2 my-5\">\n");
      out.write("                        <a herf class=\"border border -gray-200 rounded-full w-10 h-10 flex items-center justify-center\"><i class=\"fab fa-facebook-f\"></i></a>\n");
      out.write("                        <a href=\"#\" class=\"border border-gray-200 rounded-full w-10 h-10 flex items-center justify-center\"><i class=\"fab fa-google-plus-g\"></i></a>\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <span class=\"text-sm mb-4\">or use your email for registration</span>\n");
      out.write("            \n");
      out.write("                    <input type=\"text\" placeholder=\"Name\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded\"/>\n");
      out.write("                    <input type=\"email\" placeholder=\"Email\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded\"/>\n");
      out.write("                    <input type=\"password\" placeholder=\"password\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded\"/>\n");
      out.write("                    <button class=\"rounded-full border border-red-500 text-white text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-red-600\">Sign Up</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <!-- Sign in form container-->\n");
      out.write("            <div class=\"form-container sign-in-container\">\n");
      out.write("                <form class=\"bg-white flex flex-col px-12 h-full justify-center items-center text-center\">\n");
      out.write("                <h1 class=\"font-bold text-2xl mb-4\">Sign In</h1>  \n");
      out.write("                \n");
      out.write("                <div class=\"flex gap-2 my-5\">\n");
      out.write("                    <a href=\"#\" class=\"border border-gray-200 rounded-full w-10 h-10 flex items-center justify-center\"><i class=\"fab fa-facebook-f\"></i></a>\n");
      out.write("                    <a href=\"#\" class=\"border border-gray-200 rounded-full w-10 h-10 flex items-center justify-center\"><i class=\"fab fa-google-plus-g\"></i></a>\n");
      out.write("                </div>\n");
      out.write("                <span class=\"text-sm mb-4\">or use your account</span>\n");
      out.write("                \n");
      out.write("                <input type=\"email\" placeholder=\"Email\" class=\"bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded\" />\n");
      out.write("                <input type=\"password\" placeholder=\"Password\" class=\"bg-gray-100 border-none py-3 px-4 mb-4 w-full rounded\" />\n");
      out.write("                \n");
      out.write("                <a href=\"#\" class=\"text-gray-700 text-sm no-underline mb-4\">Forgot your password?</a>\n");
      out.write("                \n");
      out.write("                <button class=\"rounded-full border border-red-500 bg-red-500 text-white text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-red-600\">Sign In</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        <!-- Overlay Container -->   \n");
      out.write("        <div class=\"overlay-container\">\n");
      out.write("            <div class=\"overlay\">\n");
      out.write("                <div class=\"overlay-panel overlay-left\">\n");
      out.write("                    <h1 class=\"font-bold text-2xl mb-4 text-white\">Welcome back</h1>\n");
      out.write("                    <p class=\"text-sm font-light leading-5 tracking-wide mb-6 text-white \">Enter your personal details and start journey with us</p>\n");
      out.write("                     <button class=\"ghost rounded-full border border-white bg-transparent text-white text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-white/10\" id=\"signIn\">Sign In</button>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"overlay-panel overlay-right\">\n");
      out.write("                    \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        </div>  \n");
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
