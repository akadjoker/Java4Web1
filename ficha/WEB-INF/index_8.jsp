<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verificar Gênero</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Verificar Gênero</h1>
    <form action="index_8.jsp" method="post">
        <label for="letra">Digite uma letra:</label>
        <input type="text" id="letra" name="letra" required maxlength="1">
        <br>
        <button type="submit">Verificar</button>
    </form>

   
    <%
        if (request.getMethod().equals("POST")) {
            String letra = request.getParameter("letra");

            String genero;

            if (letra.equalsIgnoreCase("F")) {
                genero = "Feminino";
            } else if (letra.equalsIgnoreCase("M")) {
                genero = "Masculino";
            } else {
                genero = "Sexo Inválido";
            }
    %>

    <h2>Gênero:</h2>
    <p><%= genero %></p>

    <% } %>
    </div>
</body>
</html>
