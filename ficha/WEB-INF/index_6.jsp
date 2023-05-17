<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Ordenação Ascendente</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Ordenação Ascendente</h1>
    <form action="index_6.jsp" method="post">
        <label for="valorA">Valor A:</label>
        <input type="number" id="valorA" name="valorA" required>
        <br>
        <label for="valorB">Valor B:</label>
        <input type="number" id="valorB" name="valorB" required>
        <br>
        <label for="valorC">Valor C:</label>
        <input type="number" id="valorC" name="valorC" required>
        <br>
        <button type="submit">Ordenar</button>
    </form>

 
    <%
        if (request.getMethod().equals("POST")) {
            int valorA = Integer.parseInt(request.getParameter("valorA"));
            int valorB = Integer.parseInt(request.getParameter("valorB"));
            int valorC = Integer.parseInt(request.getParameter("valorC"));

            int menor, meio, maior;

            if (valorA <= valorB && valorA <= valorC) {
                menor = valorA;
                if (valorB <= valorC) {
                    meio = valorB;
                    maior = valorC;
                } else {
                    meio = valorC;
                    maior = valorB;
                }
            } else if (valorB <= valorA && valorB <= valorC) {
                menor = valorB;
                if (valorA <= valorC) {
                    meio = valorA;
                    maior = valorC;
                } else {
                    meio = valorC;
                    maior = valorA;
                }
            } else {
                menor = valorC;
                if (valorA <= valorB) {
                    meio = valorA;
                    maior = valorB;
                } else {
                    meio = valorB;
                    maior = valorA;
                }
            }
    %>

    <h2>Valores em ordem ascendente:</h2>
    <ul>
        <li><%= menor %></li>
        <li><%= meio %></li>
        <li><%= maior %></li>
    </ul>

    <% } %>
    </div>
</body>
</html>
