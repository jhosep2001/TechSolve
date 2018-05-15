<%-- 
    Document   : verVuelos
    Created on : 13-may-2018, 0:00:20
    Author     : jhosepgranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/principal.css">
        <script src="<c:url value="/resources/js/fun.js"/>"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <title>Proximos vuelos</title>
    </head>
    <body>
        <h1 class="text-center">Listado de vuelos proximos en nuestros servicios!</h1>
        <hr>
        <div class="container ">
            <div class="row">
                <p class="text-center">
                    <a href="verVuelos.htm" class="btn btn-success">Actualizar</a>
                    <a href="index.htm" class="btn btn-warning">Regresar</a>
                </p>
                
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Fecha de vuelo</th>
                            <th>Codigo</th>
                            <th>Descripcion</th>
                            <th>Asientos totales</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${datos}" var="vuelo">
                            <tr>
                                <td>${vuelo.fecha}</td>
                                <td>${vuelo.código}</td>
                                <td>${vuelo.descripcion}</td>
                                <td>${vuelo.asientos}</td>
                                <td>${vuelo.precio}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
    </body>
</html>
