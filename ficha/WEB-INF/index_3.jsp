<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculadora de Área de Trapézio</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Calculadora de Área de Trapézio</h1>
    <form action="index_3.jsp" method="post">
        <label for="baseMaior">Base Maior:</label>
        <input type="number" id="baseMaior" name="baseMaior" required>
        <br>
        <label for="baseMenor">Base Menor:</label>
        <input type="number" id="baseMenor" name="baseMenor" required>
        <br>
        <label for="altura">Altura:</label>
        <input type="number" id="altura" name="altura" required>
        <br>
        <button type="submit">Calcular Área</button>
    </form>

 
    <% if (request.getMethod().equals("POST")) { %>

        <% double baseMaior = Double.parseDouble(request.getParameter("baseMaior")); %>
        <% double baseMenor = Double.parseDouble(request.getParameter("baseMenor")); %>
        <% double altura = Double.parseDouble(request.getParameter("altura")); %>
        

        <% double area = ((baseMaior + baseMenor) * altura) / 2; %>
    
        <h2>A área do trapézio é: <%= area %></h2>
    <% } %>
    </div>
</body>
</html>
