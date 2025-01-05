<%-- 
    Document   : signup
    Created on : Jan 5, 2025, 11:56:39 AM
    Author     : chanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signup Page</title>
        <script src="https://kit.fontawesome.com/fc0bcca8a3.js" crossorigin="anonymous"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
         
    </head>
    <body class="flex justify-center items-center min-h-screen bg-gray-100 font-sans">
        <div class="container bg-white rounded-lg shadow-2xl overflow-hidden w-[900px] max-w-full min-h-[480px] relative">
            <!-- Left side - Sign Up Form -->
            <div class="grid grid-cols-2 h-full">
                <div class="p-8">
                    <form class="flex flex-col h-full justify-center items-center text-center">
                        <h1 class="font-bold text-2xl mb-4">Create Account</h1>
                      
                        <input type="text" placeholder="Name" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
                        <input type="email" placeholder="Email" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
                        <div class="relative w-full">
                            <input type="password" placeholder="Password" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500" id="signupPassword"/>
                            <i class="fas fa-eye-slash fa-sm absolute right-4 top-1/2 -translate-y-1/2 cursor-pointer text-gray-600" id="signupTogglePassword"></i>
                        </div>
                        <button class="rounded-full border border-yellow-500 bg-yellow-500 text-black text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-yellow-600 mb-5">Sign Up</button>
                        
                        <span class="text-sm mb-4">or use your email for registration</span>
                        <div class="flex gap-2 my-5">
                            <a href="#" class="border border-yellow-200 rounded-full w-10 h-10 flex items-center justify-center transition hover:bg-yellow-200"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="border border-yellow-200 rounded-full w-10 h-10 flex items-center justify-center transition hover:bg-yellow-200"><i class="fab fa-google"></i></a>
                        </div>
                    </form>
                </div>
                
                 <!-- Right side - Image and Sign In Button -->
                <div class="bg-yellow-50 flex flex-col items-center justify-center p-8 relative">
                    <img src="/api/placeholder/400/300" alt="Sign Up Image" class="rounded-lg mb-8"/>
                    <div class="text-center">
                        <h2 class="text-xl font-semibold mb-4">Already have an account?</h2>
                        <p class="text-gray-600 mb-6">Sign in to access your account</p>
                        <a href="signin.html" class="rounded-full border-2 border-yellow-500 text-yellow-500 text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-yellow-500 hover:text-white">Sign In</a>
                    </div>
                </div>
            </div>
        </div>    
            
    </body>
</html>
