<%-- 
    Document   : reservado
    Created on : 14-may-2018, 0:16:02
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
        
        <title>Resultados de reserva</title>
    </head>
    <body>     
        <div class="container ">
        <h2>Estos son los resultados de la reserva: </h2>
        <img src="${pageContext.request.contextPath}/resources/images/ok.png">
        <ul>
            <li>Nombre: <c:out value="${nombre}"/></li>
            <li>Documento: <c:out value="${documento}"/></li>
            <li>Fecha Nacimiento: <c:out value="${nacimiento}"/></li>
            <li>Codigo Vuelo: <c:out value="${codigoVuelo}"/></li>
        </ul>
        <button class="btn btn-success" onclick="index()"> Aceptar </button>
        </div>
    </body>
</html>
