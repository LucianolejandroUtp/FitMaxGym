<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>




<t:template title="FitMax Gym">
    <jsp:attribute name="head_area">

    </jsp:attribute>
    <jsp:attribute name="body_area">


        <h4 class="page-title">Binvenido al Gimnasio FitMax</h4>


        <c:forEach var="tmpObj" items="${listaDePaquetes}">
            <h6>${tmpObj.nombre}</h6> 
            <h6>${tmpObj.descripcion}</h6>
            <h6>${tmpObj.precio}</h6>
            <h6>${tmpObj.duracion}</h6>
        </c:forEach>

    </jsp:attribute>

</t:template>