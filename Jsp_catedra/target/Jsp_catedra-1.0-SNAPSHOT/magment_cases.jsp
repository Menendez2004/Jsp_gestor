<%@ page import="java.util.List" %>
<%@ page import="sv.edu.udb.jsp_catedra.beans.TicketsBeans" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="sv.edu.udb.jsp_catedra.model.SelectModel" %>
<%@ page import="sv.edu.udb.jsp_catedra.beans.UsersBeans" %><%--
  Created by IntelliJ IDEA.
  Date: 08/05/2024
  Time: 5:50 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%if (request.getAttribute("tickets") == null){
%><jsp:forward page="//caseController"/>
<%}%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <title>Control de peticiones</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/modal_styles.css">
</head>
<body class="flex flex-row">
<%
    SelectModel selecUser = new SelectModel();
    SelectModel selectTester = new SelectModel();
%>
<!-- SIDEBAR -->
<div class="w-fulll flex flex-col-reverse md:flex-row md:h-screen bg-[#F7EBEC] p-5 h-dvh">
<div class="sticky top-4 z-10 w-64 bg-white p-4 rounded-lg w-[20rem]">
    <div class="items-center justify-center lg:justify-start p-2 hidden md:flex text-[#59656F] text-2xl">
        <i class="fa-solid fa-book"></i>
        <h2 class="font-black ml-2 hidden lg:block">Gestión de peticiones</h2>
    </div>
    <div class="md:mt-5 p-2 flex justify-around md:block">
        <a class="flex p-4 items-center text-[#59656F] rounded-md my-1 justify-center cursor-pointer lg:justify-start" href="admin.jsp">
            <i class="fa-solid fa-house"></i>
            <h3 class="ml-2 hidden lg:block">Inicio</h3>
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
                    <th class="px-4 py-2">Acciones</th>

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
                        <button class="font-semibold bg-[#AC9FBB] hover:opacity-90 text-white font-bold py-2 px-4 rounded" onclick="openEditModal('<%=tickets.getIdTicke()%>', '<%=tickets.getAguement()%>', '<%=tickets.getProgramerCode()%>', '<%=tickets.getTesterCode()%>')">Editar</button>
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
</div>

<div id="editModal">
    <div class="modal-content">
        <div class="flex w-[100%] justify-end"><span class="close" onclick="closeEditModal()">&times;</span></div>
        <h2 class="text-center font-semibold text-lg mb-4">Editar caso</h2>
        <form id="editForm" class="flex flex-col gap-4">
            <input type="hidden" id="casoId" name="casoId">
            <div class="container">
                <label for="argumentos">Argumentos:</label>
                <input type="text" id="argumentos" name="argumentos" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" required>
            </div>
            <div class="flex items-center my-[1.5rem] w-[90%]">
                <div class="mr-4">
                    <i class="fa-solid fa-user text-gray-400"></i>
                </div>
                <select name="codProgramador"  id="codProgramador" class="flex-1 p-2 border border-slate-200 rounded" required>
                    <option class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB]" value="" selected disabled>Seleccione un programador</option>
                    <%
                        ArrayList<UsersBeans> listaUser = selecUser.showProgramers() ;
                        for (UsersBeans user : listaUser) {
                    %>
                    <option value="<%= user.getCode() %>"> <%= user.getUsername()%></option>
                    <%
                        }
                    %>
                </select>
            </div>

            <div class="flex items-center my-[1.5rem] w-[90%]">
                <div class="mr-4">
                    <i class="fa-solid fa-user text-gray-400"></i>
                </div>
                <select name="codTester" id="codTester"  class="flex-1 p-2 border border-slate-200 rounded" required>
                    <option class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB]" value="" selected disabled>Seleccione un tester</option>
                    <%
                        ArrayList<UsersBeans> listEst = selectTester.showTester() ;
                        for (UsersBeans user : listEst) {
                    %>
                    <option value="<%= user.getCode() %>"> <%= user.getUsername()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <button type="button" onclick="saveUpdate()">Guardar cambios</button>
        </form>
    </div>
</div>

<script>
    // Función para abrir el modal y pasar los detalles del estudiante
    function openEditModal(casoId, argumentos, codProgramador, codTester) {
        document.getElementById("casoId").value = casoId;
        document.getElementById("argumentos").value = argumentos;
        document.getElementById("codProgramador").value = codProgramador;
        document.getElementById("codTester").value = codTester;
        document.getElementById("editModal").style.display = "block";
    }

    // Función para cerrar el modal
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }

    // Función para guardar la nota editada
    function saveUpdate() {
        let casoId = document.getElementById("casoId").value
        let argumento = document.getElementById("argumentos").value
        let codProgramador = document.getElementById("codProgramador").value;
        let codTester = document.getElementById("codTester").value;


        let form = document.createElement("form");
        form.method = "POST";
        form.action = "/editCase";

        let casoIdInput = document.createElement("input");
        casoIdInput.type = "hidden";
        casoIdInput.name = "casoId";
        casoIdInput.value = casoId;
        form.appendChild(casoIdInput);

        let argumentosInput = document.createElement("input");
        argumentosInput.type = "hidden";
        argumentosInput.name = "argumentos";
        argumentosInput.value = argumento;
        form.appendChild(argumentosInput);

        let programerInput = document.createElement("input");
        programerInput.type = "hidden";
        programerInput.name = "codProgramador";
        programerInput.value = codProgramador;
        form.appendChild(programerInput);

        let testerInput = document.createElement("input");
        testerInput.type = "hidden";
        testerInput.name = "codTester";
        testerInput.value = codTester;
        form.appendChild(testerInput);


        document.body.appendChild(form);
        form.submit();
    }
</script>

</body>
</html>
