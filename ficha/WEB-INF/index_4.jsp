<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculadora de Média do Aluno</title>
</head>
<body>
    <div class="container">
    <h1>Calculadora de Média do Aluno</h1>
    <form action="index_4.jsp" method="post">
        <label for="nomeAluno">Nome do Aluno:</label>
        <input type="text" id="nomeAluno" name="nomeAluno" required>
        <br>
        <label for="notaProva1">Nota da Prova 1:</label>
        <input type="number" id="notaProva1" name="notaProva1" required>
        <br>
        <label for="notaProva2">Nota da Prova 2:</label>
        <input type="number" id="notaProva2" name="notaProva2" required>
        <br>
        <label for="notaProva3">Nota da Prova 3:</label>
        <input type="number" id="notaProva3" name="notaProva3" required>
        <br>
        <button type="submit">Calcular Média</button>
    </form>

    <% 
      
        if (request.getMethod().equals("POST")) {
        
            String nomeAluno = request.getParameter("nomeAluno");
            double notaProva1 = Double.parseDouble(request.getParameter("notaProva1"));
            double notaProva2 = Double.parseDouble(request.getParameter("notaProva2"));
            double notaProva3 = Double.parseDouble(request.getParameter("notaProva3"));

       
            double media = (notaProva1 + notaProva2 + notaProva3) / 3;
    %>
    
    <h2>Nome do Aluno: <%= nomeAluno %></h2>
    <h2>Média do Aluno: <%= media %></h2>
    
    <% 
        } 
    %>
    </div>
</body>
</html>
