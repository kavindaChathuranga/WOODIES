<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Woodies</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            /* Prevent body overflow */
            body, html {
                margin: 0;
                padding: 0;
                overflow-x: hidden; /* Hide horizontal scrollbar */
            }
        </style>
    </head>
    <body class="bg-gray-50 font-sans">
        <!-- Navbar -->
        <jsp:include page="navbar.jsp"/>

        <!-- Hero Section -->

<div class="container mx-auto px-6 py-8">
    <div class="flex justify-center">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- Card 1 -->
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <img src="path/to/your/image1.jpg" alt="Image 1" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold text-gray-800">Card Title 1</h3>
                    <p class="mt-2 text-gray-600">Description for the first card. This is an example of an image card.</p>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <img src="path/to/your/image2.jpg" alt="Image 2" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold text-gray-800">Card Title 2</h3>
                    <p class="mt-2 text-gray-600">Description for the second card. This card also contains an image and text.</p>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <img src="path/to/your/image3.jpg" alt="Image 3" class="w-full h-64 object-cover">
                <div class="p-4">
                    <h3 class="text-lg font-semibold text-gray-800">Card Title 3</h3>
                    <p class="mt-2 text-gray-600">Description for the third card. It?s another example with image and text.</p>
                </div>
            </div>
        </div>
    </div>
</div>



    <!-- Footer -->
    <jsp:include page="footer.jsp"/>
</body>
</html>
