<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Soma ou Multiplicação</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Soma ou Multiplicação</h1>
    <form action="index_5.jsp" method="post">
        <label for="valorA">Valor A:</label>
        <input type="number" id="valorA" name="valorA" required>
        <br>
        <label for="valorB">Valor B:</label>
        <input type="number" id="valorB" name="valorB" required>
        <br>
        <button type="submit">Calcular</button>
    </form>


    <%
        if (request.getMethod().equals("POST")) {
            int valorA = Integer.parseInt(request.getParameter("valorA"));
            int valorB = Integer.parseInt(request.getParameter("valorB"));

            int resultado = valorA == valorB ? valorA + valorB : valorA * valorB;
    %>

    <h2>Resultado: <%= resultado %></h2>

    <% } %>
    </div>
</body>
</html>

