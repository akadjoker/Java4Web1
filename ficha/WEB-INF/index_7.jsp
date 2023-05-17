<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verificar Forma</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Verificar Forma</h1>
    <form action="index_7.jsp" method="post">
        <label for="peso">Peso (kg):</label>
        <input type="number" id="peso" name="peso" required>
        <br>
        <label for="altura">Altura (m):</label>
        <input type="number" id="altura" name="altura" step="0.01" required>
        <br>
        <button type="submit">Verificar</button>
    </form>


    <%
        if (request.getMethod().equals("POST")) {
            double peso = Double.parseDouble(request.getParameter("peso"));
            double altura = Double.parseDouble(request.getParameter("altura"));

            double imc = peso / (altura * altura);
            String status;

            if (imc < 20) {
                status = "Abaixo do peso";
            } else if (imc >= 20 && imc < 25) {
                status = "Peso Normal";
            } else if (imc >= 25 && imc < 30) {
                status = "Sobrepeso";
            } else if (imc >= 30 && imc < 40) {
                status = "Obeso";
            } else {
                status = "Obeso Mórbido";
            }
    %>

    <h2>Status:</h2>
    <p>IMC: <%= imc %></p>
    <p>Status: <%= status %></p>

    <% } %>
    </div>
</body>
</html>
