
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
<%if (logueado.getNombrePuesto().equals("Jefe de area")){%>
    <a href="${context}/casos.do?operacion=nuevo" class="button">Agregar Caso</a><br><br>
<%}%>
<%if (logueado.getNombrePuesto().equals("Jefe de desarrollo")){%>
<a href="" class="button">Generar reportes</a><br><br>
<%}%>
        <c:if test="${not empty requestScope.listaCasos}">
            <c:forEach var="caso" items="${requestScope.listaCasos}">
                <form id="fmrEditar${caso.codigo}" method="post" action="${context}/casos.do">
                    <input type="hidden" name="operacion" value="obtener">
                    <input type="hidden" name="cod" value="${caso.codigo}">
                    <input type="hidden" name="pagina" value="/Casos/modificarCaso.jsp">
                </form>
                <form id="fmrAprobar${caso.codigo}" method="post" action="${context}/casos.do">
                    <input type="hidden" name="operacion" value="obtener">
                    <input type="hidden" name="cod" value="${caso.codigo}">
                    <input type="hidden" name="pagina" value="/Casos/aprobarCaso.jsp">
                </form>
                <form id="fmrBita${caso.codigo}" method="post" action="${context}/bitacoras.do">
                    <input type="hidden" name="operacion" value="listar">
                    <input type="hidden" name="cod" value="${caso.codigo}">
                </form>
                <c:choose>
                    <c:when test="${caso.estado eq 'En espera de respuesta'}">
                        <div class="cajas">
                    </c:when>
                    <c:when test="${caso.estado eq 'En desarrollo'}">
                        <div class="cajas desarrollo">
                    </c:when>
                    <c:when test="${caso.estado eq 'Finalizado'}">
                        <div class="cajas desarrollo">
                    </c:when>
                    <c:when test="${caso.estado eq 'Solicitud rechazada'}">
                        <div class="cajas rechazada">
                    </c:when>
                    <c:when test="${caso.estado eq 'Vencido'}">
                        <div class="cajas rechazada">
                    </c:when>
                </c:choose>
                <h2>${caso.titulo}</h2>
                <div class="info">
                <c:choose>
                    <c:when test="${caso.estado eq 'Solicitud rechazada'}">
                        <p>${caso.sugerencias}</p>
                    </c:when>
                    <c:otherwise>
                        <p>${caso.descripcion}</p>
                    </c:otherwise>
                </c:choose>
                    <p>${caso.tipo}</p>
                    <p>${caso.estado}</p>
                </div>
            <%if (logueado.getNombrePuesto().equals("Jefe de area")){%>
                        <form id="fmrBita${caso.codigo}" method="post" action="${context}/bitacoras.do">
                            <input type="hidden" name="operacion" value="listar">
                            <input type="hidden" name="cod" value="${caso.codigo}">
                        </form>
                <c:choose>
                    <c:when test="${caso.estado eq 'En espera de respuesta'}">
                        <article>
                            <input type="submit" name="editar" value="editar" form="fmrEditar${caso.codigo}" class="button">
                            <button class="button" onclick="alerta('${caso.codigo}')">Eliminar</button>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'Solicitud rechazada'}">
                        <article class="rechazo">
                            <button>Rechazado</button>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'En desarrollo'}">
                        <article class="aceptado">
                            <button>Progreso ${caso.progreso}%</button>
                            <article class="aceptado">
                                <input type="submit" name="bitacora" value="bitacora" form="fmrBita${caso.codigo}" class="button">
                                <button>Progreso ${caso.progreso}%</button>
                            </article>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'Vencido'}">
                        <article class="rechazo">
                            <button>Vencido</button>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'Finalizado'}">
                        <article class="esperando">
                            <button>Finalizado</button>
                        </article>
                    </c:when>
                </c:choose>

            <%}%>
            <%if (logueado.getNombrePuesto().equals("Jefe de desarrollo")){%>
                <c:choose>
                    <c:when test="${caso.estado eq 'En espera de respuesta'}">
                        <article>
                            <input type="submit" name="aprobar" value="Aprobar" form="fmrAprobar${caso.codigo}" class="button">
                            <button class="button" onclick="alertaRechazo('${caso.codigo}')">Rechazar</button>
                        </article>
                    </c:when>

                    <c:when test="${caso.estado eq 'Solicitud rechazada'}">
                        <article class="rechazo">
                            <button>Rechazado</button>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'En desarrollo'}">
                        <article class="aceptado">
                            <button>Progreso ${caso.progreso}%</button>
                            <article class="aceptado">
                                <input type="submit" name="bitacora" value="bitacora" form="fmrBita${caso.codigo}" class="button">
                                <button>Progreso ${caso.progreso}%</button>
                            </article>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'Vencido'}">
                        <article class="rechazo">
                            <button>Vencido</button>
                        </article>
                    </c:when>
                    <c:when test="${caso.estado eq 'Finalizado'}">
                        <article class="esperando">
                            <button>Finalizado</button>
                        </article>
                    </c:when>
                    <c:otherwise>
                        <article class="aceptado">
                            <button>Progreso ${caso.progreso}%</button>
                            <input type="submit" name="bitacora" value="Bitacora" form="fmrBitacora${caso.codigo}" class="button">
                        </article>
                    </c:otherwise>
                </c:choose>
                 <%}%>
                </div>
            </c:forEach>
        </c:if>
</body>
<script>
    function alerta(id)
    {
        var opcion = confirm("Esta seguro de eliminar este registro");
        if (opcion === true) {
            location.href ="${context}/casos.do?operacion=eliminar&cod="+id;
        }
    }
    function alertaRechazo(id){
        var pagina = "/Casos/rechazarCasos.jsp";
        var opcion = confirm("Esta seguro de rechazar este caso");
        if (opcion === true) {
            location.href ="${context}/casos.do?operacion=obtener&cod="+id+"&pagina="+pagina;
        }
    }
    function reporte(){
        var inicio = prompt("Ingrese la fecha de inicio");
        var final = prompt("Ingrese la fecha final");
        location.href = "${context}/casos.do?operacion=reporte&inicio="+inicio+"&final="+final;
    }
</script>
</html>
