<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calcular Média</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
</head>
<body>
    <div class="container">
    <h1>Calcular Média</h1>
    <form action="index_9.jsp" method="post">
        <label for="nota1">Nota 1:</label>
        <input type="number" id="nota1" name="nota1" required min="0" max="20">
        <br>
        <label for="nota2">Nota 2:</label>
        <input type="number" id="nota2" name="nota2" required min="0" max="20">
        <br>
        <button type="submit">Calcular</button>
    </form>


    <%
        if (request.getMethod().equals("POST")) {
            double nota1 = Double.parseDouble(request.getParameter("nota1"));
            double nota2 = Double.parseDouble(request.getParameter("nota2"));

            if (nota1 > 20 || nota2 > 20) {
    %>
            <h2>Valor inválido!</h2>
    <%
            } else {
                double media = (nota1 + nota2) / 2;
                String mensagem;

                if (media >= 7 && media < 10) {
                    mensagem = "Oral";
                } else if (media < 7) {
                    mensagem = "Reprovado";
                } else {
                    mensagem = "Aprovado";
                }
    %>
                <h2>Média:</h2>
                <p><%= media %></p>
                <h2>Mensagem:</h2>
                <p><%= mensagem %></p>
    <%
            }
        }
    %>
    </div>
</body>
</html>
