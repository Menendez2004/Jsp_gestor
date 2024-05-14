
<html>

<body>
<a href="${context}/bitacoras.do?operacion=nuevo&cod=${requestScope.codigo}" class="button d-inline-block">Agregar Avance</a>
<br><br>
<div class="w-25 m-auto">
    <p>Progreso:</p><div class="progress">
    <div class="progress-bar progress-bar-striped bg-warning text-dark" role="progressbar" style="width: ${requestScope.caso.progreso}%;" aria-valuenow="${requestScope.caso.progreso}" aria-valuemin="0" aria-valuemax="100"><b>${requestScope.caso.progreso}%</b></div>
    </div>
</div>
<c:choose>
    <c:when test="${not empty requestScope.listaBitacora}">
        <table>
            <thead>
            <tr>
                <th>Id</th>
                <th>Caso</th>
                <th>Descripcion</th>
                <th>fecha</th>
                <th>avance</th>
                <th>Operaciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="bita" items="${requestScope.listaBitacora}">
                <c:if test="${requestScope.codigo eq bita.codigo}">
                    <tr>
                        <form action="${context}/usuarios.do" id="fmrEditar${bita.id}" method="post" role="form">
                            <input type="hidden" name="operacion" value="obtener">
                            <input type="hidden" name="id" value="${bita.id}">
                        </form>
                        <td>${bita.id}</td>
                        <td>${bita.caso}</td>
                        <td class="descripcion">${bita.descripcion}</td>
                        <td>${bita.fecha}</td>
                        <td>${bita.progreso}%</td>
                        <td>
                            <button class="button" onclick="alerta('${bita.id}', '${bita.codigo}')">Eliminar</button>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
        <br><br>
    </c:when>
    <c:otherwise>
        <div class="alert-info m-5 py-4 text-center">
            Aún no hay ningún registro en la bitacora
        </div>
    </c:otherwise>
</c:choose>

<script>
    function alerta(id, cod)
    {
        var mensaje;
        var opcion = confirm("Esta seguro de eliminar este registro");
        if (opcion === true) {
            location.href ="${context}/bitacoras.do?operacion=eliminar&id="+id+"&cod="+cod;
        }
    }
</script>
</body>
</html>
