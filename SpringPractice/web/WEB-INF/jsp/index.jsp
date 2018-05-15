<%-- 
    Document   : home
    Created on : 12-may-2018, 22:41:28
    Author     : jhosepgranda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/principal.css">
        <script src="<c:url value="/resources/js/fun.js"/>"></script>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        
        <title>Pagina Principal </title>
    </head>
    <body class="container">
        <div class="container-fluids">
            <h1 class="text-center">Bienvenido a la web de Tech and Fly</h1>
            <p class="text-center"> Puedes utilizar el siguiente menu para encontrar nuestras funcionalidades: </p>
        </div>
        <hr/>
        <div class="container-fluid text-center">
            <ul class="list-group">
                <li class="list-group-item">
                    <button class="btn btn-success" onclick="verVuelos()">
                    Consulta nuestros proximos vuelos
                </button>
            </li>
            <li class="list-group-item">
                <p>Ingresa la cedula</p>
                <form action="reservas.htm" method="POST" id="verReservas" name="verReservas" >
                    <input type="text" name="cedula" id="cedula" value="">
                    <button class="btn btn-success" onclick="" type="submit" id="btnSubmit" name="btnSubmit" value="Submit">
                        Consulta tus reservas actuales
                    </button>
                </form>
            </li>
            <li class="list-group-item">
                <button class="btn-success" onclick="reservar()">
                    Reserva un nuevo vuelo
                </button>
            </li>
        </ul>
        </div>
    </body>
</html>
