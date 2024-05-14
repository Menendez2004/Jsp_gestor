<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="sv.edu.udb.jsp_catedra.model.SelectModel"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="sv.edu.udb.jsp_catedra.beans.DepaBeans"%>
<%@ page import="sv.edu.udb.jsp_catedra.beans.TypeUser"%>
<!DOCTYPE>
<html>
<head>
    <title>Add Users</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
</head>
<body class="">
<%
    SelectModel depaSelectModel = new SelectModel();
    SelectModel typerUserSelectModel = new SelectModel();
%>
<div class="w-fulll flex flex-col-reverse md:flex-row md:h-screen bg-[#F7EBEC] p-5 h-dvh">
    <!-- SIDEBAR -->
    <div class="sticky top-4 z-10 w-64 bg-white p-4 rounded-lg w-[20rem]">
        <div class="items-center justify-center lg:justify-start p-2 hidden md:flex text-[#59656F] text-2xl">
            <i class="fa-solid fa-book"></i>
            <h2 class="font-black ml-2 hidden lg:block">Gestión de tickets</h2>
        </div>
        <div class="md:mt-5 p-2 flex justify-around md:block">
            <a class="flex p-4 items-center text-[#59656F] rounded-md my-1 justify-center cursor-pointer lg:justify-start" href="admin.jsp">
                <i class="fa-solid fa-house"></i>
                <h3 class="ml-2 hidden lg:block">Inicio</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 bg-[#59656F] text-white justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_user.jsp">
                <i class="fa-solid fa-user-tie"></i>
                <h3 class="ml-2 hidden lg:block">Añadir usuarios</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_depa.jsp">
                <i class="fa-solid fa-pencil"></i>
                <h3 class="ml-2 hidden hidden lg:block">Añadir departamento</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="cases_views.jsp">
                <i class="fa-solid fa-id-card-clip"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver casos</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="users_views.jsp">
                <i class="fa-solid fa-book"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver usuarios</h3>
            </a>
        </div>
    </div>
    <!--CONTENIDO DE LA PÁGINA-->
    <main class="overflow-x-auto p-7 mb-4 md:bt-0 md:ml-2 bg-white md:w-5/6 rounded-lg h-full">
        <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">Añadir un usuario</h2>
        <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
            <form action="add-user" method="POST">
                <div class="flex items-center mb-[3rem]">
                    <div class="mr-4">
                        <i class="fas fa-user text-gray-400"></i>
                    </div>
                    <input type="text" name="nombre" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" placeholder="Nombres" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1" required>
                </div>
                <div class="flex items-center mb-[3rem]">
                    <div class="mr-4">
                        <i class="fas fa-user text-gray-400"></i>
                    </div>
                    <input type="text" name="apellido" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" placeholder="apellidos" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1" required>
                </div>

                <div class="flex items-center mb-[3rem]">
                    <div class="mr-4">
                        <i class="fas fa-user text-gray-400"></i>
                    </div>
                    <input type="text" name="usuario" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" placeholder="Usuario" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1" required>
                </div>
                <div class="flex items-center mb-[3rem]">
                    <div class="mr-4">
                        <i class="fas fa-key text-gray-400"></i>
                    </div>
                    <input type="password" name="contrasenia" title="Ingrese solo letras" placeholder="contrasenia" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1" required>
                </div>

                <div class="flex gap-3 items-center" >
                    <div class="flex items-center my-[1.5rem] w-[90%]">
                        <div class="mr-4">
                            <i class="fa-solid fa-user text-gray-400"></i>
                        </div>
                        <select name="departamento"  class="flex-1 p-2 border border-slate-200 rounded" required>
                            <option class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB]" value="" selected disabled>Seleccione un departamento</option>
                            <%
                                ArrayList<DepaBeans> lista = depaSelectModel.showDepa();
                                for (DepaBeans dept : lista) {
                            %>
                            <option value="<%= dept.getCode() %>"> <%= dept.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="flex items-center my-[1.5rem] w-[90%]">
                        <div class="mr-4">
                            <i class="fa-solid fa-clipboard text-gray-400"></i>
                        </div>
                        <select name="tipo_usuario" class="flex-1 p-2 border border-slate-200 rounded" required>
                            <option class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB]" value="" selected disabled>Seleccione el tipo de usuario</option>
                            <%
                                ArrayList<TypeUser> list = typerUserSelectModel.showTypeUser();
                                for (TypeUser typ : list) {
                            %>
                            <option value="<%= typ.getCode() %>"> <%= typ.getPosition()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <button type="submit" class="font-semibold bg-[#AC9FBB] text-white py-2 px-4 rounded-md focus:outline-none hover:opacity-90 transition w-full">Registrar</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>