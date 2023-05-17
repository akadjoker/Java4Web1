<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculadora de Área do Círculo</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Calculadora de Área do Círculo</h1>

    <% double raio = Double.parseDouble(request.getParameter("raio")); %>
    <% double area = Math.PI * Math.pow(raio, 2); %>
    <p>A área do círculo é: <%= area %></p>
    </div>
</body>
</html>
