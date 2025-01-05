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
    
    <style>
        * {
            box-sizing: border-box;
        }

        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
            transform: translateX(0);
        }
        
        
        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }
        
        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }
        
        .overlay {
            background: #E6D6C1;
            background: linear-gradient(to right, #E5D098, #E6D6C1);
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        
        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }
        
        .overlay-left {
            transform: translateX(-20%);
        }
        
        .overlay-right {
            right: 0;
            transform: translateX(0);
        }
 
    </style>
    
   <body class="flex justify-center items-center min-h-screen bg-gray-100 font-sans -mt-5 mb-12">
        <div class="container bg-white rounded-lg shadow-2xl overflow-hidden w-[768px] max-w-full min-h-[480px] relative" id="container">
            <!-- Sign up form container-->
            <div class="form-container sign-up-container">
                <form class="bg-white flex flex-col px-12 h-full justify-center items-center text-center">
                    <h1 class="font-bold text-2xl mb-4">Create Account</h1>
                  
                    <input type="text" placeholder="Name" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
                    <input type="email" placeholder="Email" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
                    <div class="relative w-full">
                        <input type="password" placeholder="password" class="bg-gray-100 border-none py-3 px-4 mb-3 w-full rounded-3xl focus:outline-none focus:ring-2 focus:ring-yellow-500" id="signupPassword"/>
                        <i class="fas fa-eye-slash fa-sm absolute right-4 top-1/2 -translate-y-1/2 cursor-pointer text-gray-600" id="signupTogglePassword"></i>
                    </div>
                    <button class="rounded-full border border-yellow-500 bg-yellow-500 text-black text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-yellow-600 mb-5">Sign Up</button>
                    
                    <span class="text-sm mb-4">or use your email for registration</span>
                    <!--Social icons-->
                    <div class="flex gap-2 my-5">
                        <a herf="#" class="border border-yellow-200 rounded-full w-10 h-10 flex items-center justify-center transition hover:bg-yellow-200"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="border border-yellow-200 rounded-full w-10 h-10 flex items-center justify-center transition hover:bg-yellow-200"><i class="fab fa-google"></i></a>
                    </div>
                </form>
            </div>
            
            <!-- Overlay Container -->   
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1 class="font-bold text-2xl mb-4 text-black">Welcome back</h1>
                    <p class="text-sm font-light leading-5 tracking-wide mb-6 text-black ">Enter your personal details and start journey with us</p>
                     <button class="ghost rounded-full border border-yellow-500 bg-transparent text-black text-xs font-bold py-3 px-11 uppercase tracking-wide transition hover:bg-white/10" id="signIn">Sign In</button>
                </div>
            </div>
        </div>
        </div>  
    </body>
</html>