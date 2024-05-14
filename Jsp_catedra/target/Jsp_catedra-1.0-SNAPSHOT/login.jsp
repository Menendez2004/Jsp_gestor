<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
</head>
<body class="bg-gray-100 flex justify-center items-center h-screen">
<div class="bg-white p-8 rounded shadow-md w-80">
    <h2 class="text-2xl font-semibold mb-4 text-center">Login</h2>
    <form action="login-users" method="POST">
        <div class="mb-4 flex items-center">
            <label  class="block text-gray-700 mr-2">
                <i class="fas fa-user"></i>
            </label>
            <input type="text"  name="usuario" class="form-input mt-1 block w-full rounded-md border-gray-300" placeholder="Username" required>
        </div>
        <div class="mb-4 flex items-center">
            <label  class="block text-gray-700 mr-2">
                <i class="fas fa-lock"></i>
            </label>
            <input type="password" name="contrasenia" class="form-input mt-1 block w-full rounded-md border-gray-300" placeholder="Password" required>
        </div>
        <button type="submit" class="w-full bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600">Login</button>
    </form>
</div>
</body>
</html>
