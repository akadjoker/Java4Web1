<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resultado da Verificação de Senha</title>
    <link rel="stylesheet" type="text/css" href="estilo.css">
    </style>
</head>
<body>
    <div class="container">
    <h1>Resultado da Verificação de Senha</h1>
 
    <% String senha = request.getParameter("senha"); %>


    <% if ("12345".equals(senha)) { %>
        <h2>ACESSO PERMITIDO</h2>
    <% } else { %>
        <h2 class="error">ACESSO NEGADO</h2>
    <% } %>
    </div>
</body>
</html>
