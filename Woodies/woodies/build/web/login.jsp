<%-- 
    Document   : login
    Created on : Jan 3, 2025, 10:49:49 PM
    Author     : chanuka
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login  Page</title>
        <script src="https://kit.fontawesome.com/fc0bcca8a3.js" crossorigin="anonymous"></script>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="flex justify-center items-center min-h-screen bg-gray-100 font-[Montserrat] -mt-5 mb-12">
        <div class="container bg-white rounded-lg shadow-2xl overflow-hidden w-[768px] max-w-full min-h-[480px] relative" id="container">
            <!-- Sign up form container-->
            <div class="form-container sign-up-container">
                <form class="bg-white flex flex-col px-12 h-full justify-center items-center text-center">
                    <h1 class="font-bold text-2xl mb-4">Create Account</h1>
                    <!--Social icons-->
                    <div class="flex gap-2 my-5">
                        <a herf class="border border -gray-200 rounded-full w-10 h-10 flex items-center justify-center"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="border border-gray-200 rounded-full w-10 h-10 flex items-center justify-center"><i class="fab fa-google-plus-g"></i></a>
                    </div>
                </form>
            </div>
            <span class="text-sm mb-4">or use your email for registration</span>
            
            <input type="text" placeholder="Name" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded"/>
        </div>  
    </body>
</html>
