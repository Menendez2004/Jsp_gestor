<%@ page import="java.util.List" %>
<%@ page import="sv.edu.udb.jsp_catedra.beans.TicketsBeans" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 08/05/2024
  Time: 5:50 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%if (request.getAttribute("tickets") == null){
%><jsp:forward page="/fetch-case"/>
<%}%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <title>Control de Tickets</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
</head>
<body class="flex flex-row">
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
        <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_user.jsp">
            <i class="fa-solid fa-user-tie"></i>
            <h3 class="ml-2 hidden lg:block">Añadir usuarios</h3>
        </a>
        <a class="flex p-4 items-center rounded-md my-1 bg-[#59656F] text-white justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_depa.jsp">
            <i class="fa-solid fa-clipboard"></i>
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

<!-- CONTENIDO DE LA PÁGINA -->
<main class="overflow-x-auto p-7 mb-4 md:bt-0 md:ml-2 bg-white md:w-5/6 rounded-lg h-full">
    <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
        <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">tickets</h2>
     <%
        List<TicketsBeans> tk = (List<TicketsBeans>) request.getAttribute("tickets");
     %>

     <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
        <%
            if (tk == null || tk.isEmpty()) { %>
        <p class="italic text-slate-400">No hay casos registrados</p>
        <%} else {
        %>
        <table class="min-w-full">
            <thead>
            <tr class="bg-gray-100">
                <th class="px-4 py-2">Codigo</th>
                <th class="px-4 py-2">titulo</th>
                <th class="px-4 py-2">descripcion</th>
                <th class="px-4 py-2">argumentos</th>
                <th class="px-4 py-2">Departamento</th>
                <th class="px-4 py-2">Estado</th>
                <th class="px-4 py-2">PDF</th>
                <th class="px-4 py-2">Programador</th>
                <th class="px-4 py-2">Tester</th>
                <th class="px-4 py-2">Fecha Inicio</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (TicketsBeans tickets : tk) {
            %>
            <tr>
                <td class="border px-4 py-2"><%=tickets.getCode()%></td>
                <td class="border px-4 py-2"><%=tickets.getTittle()%></td>
                <td class="border px-4 py-2"><%=tickets.getDescription()%></td>
                <td class="border px-4 py-2"><%=tickets.getAguement()%></td>
                <td class="border px-4 py-2"><%=tickets.getDepaCode()%></td>
                <td class="border px-4 py-2"><%=tickets.getStatusCode()%></td>
                <td class="border px-4 py-2"><%=tickets.getPdfFile()%></td>
                <td class="border px-4 py-2"><%=tickets.getProgramerCode()%></td>
                <td class="border px-4 py-2"><%=tickets.getTesterCode()%></td>
                <td class="border px-4 py-2"><%=tickets.getDate()%></td>
                <td class="border px-4 py-2 flex justify-center gap-4 h-[3.5rem]">
                    <form action="delete" method="post" class="h-fit">
                        <input type="hidden" name="id" id="id" value="<%=tickets.getIdTicke()%>">
                        <input type="hidden" name="tipo" id="tipo" value="usuario">
                        <button type="submit" class="self-center font-semibold bg-red-400 hover:opacity-90 text-white font-bold py-2 px-4 rounded">
                            Eliminar
                        </button>
                    </form>

                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
        <%
            }
        %>
     </div>
    </div>
</main>
</body>
</html>
