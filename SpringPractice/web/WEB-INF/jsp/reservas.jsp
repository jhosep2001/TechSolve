<%-- 
    Document   : reserva
    Created on : 12-may-2018, 23:03:01
    Author     : jhosepgranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/principal.css">
        <script src="<c:url value="/resources/js/fun.js"/>"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        
        <title>Vuelos Con reserva actuales</title>
    </head>
    <body>
        <h1>Listado de vuelos reservados</h1>
        <hr>
        <div class="container">
            
        
        <button class="btn btn-warning" onclick="index()">Regresar</button>
        <hr/>
        <c:choose>
            <c:when test="${datos==null}">
                <p>
                   El documento seleccionado no cuenta con reservas de vuelos en nuestro servicios
                </p>
                <button class="btn btn-success" onclick="reservar()">Hacer nueva reserva</button>
            </c:when>
            <c:otherwise>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Documento</th>
                            <th>Fecha nacimiento</th>
                            <th>Codigo vuelo</th>
                            <th>Fecha de vuelo</th>
                            <th>Descripcion de vuelo</th>
                            <th>Precio de vuelo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="reserva">
                            <tr>
                                <td>${reserva.nombre}</td>
                                <td>${reserva.documento}</td>
                                <td>${reserva.nacimiento}</td>
                                <td>${reserva.codigoVuelo}</td>
                                <td>${reserva.fecha}</td>
                                <td>${reserva.descripcion}</td>
                                <td>${reserva.precio}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
            </div>
    </body>
</html>
