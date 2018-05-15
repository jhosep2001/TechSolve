<%-- 
    Document   : nuevaReserva
    Created on : 12-may-2018, 23:59:25
    Author     : jhosepgranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/principal.css">
        <script src="<c:url value="/resources/js/fun.js"/>"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        
        <title>Realizar reserva </title>
    </head>
    <body>
        <h1>Listado de vuelos con reserva posible</h1>
        <button class="btn btn-success" onclick="reservar()">
                Actualizar
        </button>
        <button class="btn btn-warning" onclick="index()">
                Regresar
        </button>
        <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Fecha</th>
                            <th>codigo</th>
                            <th>Descripcion</th>
                            <th>Asientos totales</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${vuelosDis}" var="vuelo">
                            <c:forEach items="${vuelo}" var="v">
                                <tr>
                                <td>${v.id}</td>
                                <td>${v.fecha}</td>
                                <td>${v.código}</td>
                                <td>${v.descripcion}</td>
                                <td>${v.asientos}</td>
                                <td>${v.precio}</td>
                            </tr>
                            </c:forEach>    
                        </c:forEach>
                    </tbody>
        </table>
        <hr>
        <h3>Datos de reserva: </h3>
        <form:form>
            <form:label path="nombre">Nombre</form:label>
            <form:input path="nombre"></form:input>
             <form:label path="documento">Documento</form:label>
            <form:input path="documento"></form:input>
             <form:label path="nacimiento">Nacimineto</form:label>
             <form:input path="nacimiento" type="date"></form:input> 
             <form:label path="codigoVuelo">Codigo vuelo</form:label>
             <form:select path="codigoVuelo">
                <c:forEach items="${vuelosDis}" var="vuelo">
                    <c:forEach items="${vuelo}" var="v">
                        <form:option value="${v.código}"></form:option>  
                    </c:forEach>
                </c:forEach>
            </form:select>
            <hr>
             <form:button class="btn btn-success">Reservar</form:button>
        </form:form>
             <!-- se hizo uso de una variable al final del documento para exponer errores o avisos de usuario -->
        <c:out value="${errors}" > </c:out>
    </body>
</html>