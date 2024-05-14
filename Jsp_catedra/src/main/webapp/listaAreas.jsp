
<html>

<body>
<a href="${context}/areas.do?operacion=nuevo" class="button">Agregar Area</a>
<br>
<table>
    <thead>
    <tr>
        <th>Id</th>
        <th>Nombre</th>
        <th>Codigo</th>
        <th colspan="2">Operaciones</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty requestScope.listaAreas}">
        <c:forEach var="area" items="${requestScope.listaAreas}">
            <tr>
                <form action="${context}/areas.do" id="fmrEditar${area.id}" method="post" role="form">
                    <input type="hidden" name="operacion" value="obtener">
                    <input type="hidden" name="codigo" value="${area.codigo}">
                </form>
                <td>${area.id}</td>
                <td>${area.nombre}</td>
                <td>${area.codigo}</td>
                <td>
                    <input type="submit" name="Editar" class="button" value="Editar" form="fmrEditar${area.id}">
                </td>
                <td>
                    <button class="button" onclick="alerta('${area.codigo}')">Eliminar</button>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>

</body>
</html>
