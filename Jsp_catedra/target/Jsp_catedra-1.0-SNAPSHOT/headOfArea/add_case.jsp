<%@ page import="sv.edu.udb.jsp_catedra.model.SelectModel" %>
<%@ page import="sv.edu.udb.jsp_catedra.beans.DepaBeans" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 08/05/2024
  Time: 10:04 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE>
<html>
<head>
    <title>Add case</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
</head>
<body class="">
<%
    SelectModel depaSelectModel = new SelectModel();
%>
 <div class="w-fulll flex flex-col-reverse md:flex-row md:h-screen bg-[#F7EBEC] p-5 h-dvh">

     <div class="sticky top-4 z-10 w-64 bg-white p-4 rounded-lg w-[20rem]">
         <div class="items-center justify-center lg:justify-start p-2 hidden md:flex text-[#59656F] text-2xl">
             <i class="fa-solid fa-book"></i>
             <h2 class="font-black ml-2 hidden lg:block">Gestión de notas</h2>
         </div>
         <div class="md:mt-5 p-2 flex justify-around md:block">
             <a class="flex p-4 items-center text-[#59656F] rounded-md my-1 justify-center cursor-pointer lg:justify-start" href="admin.jsp">
                 <i class="fa-solid fa-house"></i>
                 <h3 class="ml-2 hidden lg:block">Inicio</h3>
             </a>
             <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_user.jsp">
                 <i class="fa-solid fa-user-tie"></i>
                 <h3 class="ml-2 hidden lg:block">Añadir usuarios</h3>
             </a>
             <a class="flex p-4 items-center rounded-md my-1 bg-[#59656F] text-white justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_depa.jsp">
                 <i class="fa-solid fa-clipboard"></i>
                 <h3 class="ml-2 hidden hidden lg:block">Añadir departamento</h3>
             </a>
             <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="students_view.jsp">
                 <i class="fa-solid fa-id-card-clip"></i>
                 <h3 class="ml-2 hidden hidden lg:block">Ver casos</h3>
             </a>
             <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="users_views.jsp">
                 <i class="fa-solid fa-book"></i>
                 <h3 class="ml-2 hidden hidden lg:block">Ver usuarios</h3>
             </a>
         </div>
     </div>


     <main class="overflow-x-auto p-7 mb-4 md:bt-0 md:ml-2 bg-white md:w-5/6 rounded-lg h-full">
         <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">Abrir ticket</h2>
         <div class="bg-white shadow-md rounded-md p-8 w-full border border-gray-300 mt-8">
             <form action="request-case" method="POST" enctype="multipart/form-data" class="space-y-4">
                 <div class="flex items-center mb-4">
                     <div>
                         <i class="fa-solid fa-ticket text-gray-700"></i>
                     </div>
                     <input type="text" name="titulo" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" placeholder="Título" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1 ml-4" required>
                 </div>
                 <div class="flex items-center mb-4">
                     <div>
                         <i class="fa-solid fa-file-prescription text-gray-700"></i>
                     </div>
                     <input type="text" name="descripcion" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" placeholder="Descripción" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1 ml-4" required>
                 </div>
                 <div class="relative">
                     <div class="flex items-center mb-4">
                         <div>
                             <i class="fa-solid fa-building text-gray-700"></i>
                         </div>
                         <select name="depaCode" class="border-b border-gray-300 rounded-md focus:outline-none focus:border-[#AC9FBB] w-full py-2 px-3 pl-8 pr-4 appearance-none bg-white">
                             <option value="" selected disabled>Seleccione un departamento</option>
                             <% ArrayList<DepaBeans> lista = depaSelectModel.showDepa();
                                 for (DepaBeans dept : lista) { %>
                             <option value="<%= dept.getCode() %>"> <%= dept.getNombre()%></option>
                             <% } %>
                         </select>
                     </div>
                     <div class="flex items-center mb-4">
                         <div>
                             <i class="fa-solid fa-file-pdf text-gray-700"></i>
                         </div>
                         <label for="pdf" class="cursor-pointer ml-4 py-2 px-3 bg-gray-200 text-gray-700 rounded-md hover:bg-gray-300 transition duration-200">Seleccionar PDF</label>
                         <input id="pdf" type="file" name="pdf" accept=".pdf" class="hidden" required>
                     </div>
                     <button type="submit" class="font-semibold bg-[#FB0456] text-white py-2 px-4 rounded-md focus:outline-none hover:opacity-90 transition w-full">Enviar</button>
                 </div>
             </form>
         </div>
     </main>



 </div>
</body>
</html>