<%-- 
    Document   : login
    Created on : 09/12/2020, 15:46:18
    Author     : User
--%>

<%@page import="Modelos.Usuario"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="background-color:rgba(0, 0, 242, 0.1)">
    <head>
        <title>Minha Agenda Financeira</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/estilos.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="style/estilos.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
    </head>
    <body>
        <header>
            <div class="logo"><img src="imagens/logo.png"></div>
        </header>
        
        <div class="login">
        <img src="imagens/avatar.jpg" style="width:76px">
        <h3> Olá,
            <% 
              String nomeUser = (String) session.getAttribute("nome");
              out.write(nomeUser);
            %> !!
        <h3>
        <div class="topnav a">
            <a href="#"><i class="fa fa-envelope"></i> </a>
            <a href="#"><i class="fa fa-user"></i></a>
            <a href="#"><i class="fa fa-cog"></i></a>
        </div>
        </div>
        
        <div class="painel"> Painel de Controle </div><br>
        
        <div class="menu"
        <div class="clearfix">
        <div class="column">
        <ul>
            <li><a href="menu.jsp" ><i class="fa fa-users fa-fw"></i> MENU </a></li>
            <li><a href="cadastroDespesa.jsp"><i class="fas fa-comments-dollar"></i>  Seu novo Gasto</a> </li>
            <li><a href="cadastroReceita.jsp"><i class="fas fa-donate"></i>  Sua nova Renda</a></li>
            <li><a href="cadastroCategoria.jsp"><i class="fas fa-clipboard"></i>  Crie nova Categoria</a></li>
            <li><a href="consultaBalancete.jsp"><i class="fas fa-balance-scale"></i>  Resumo Financeiro</a></li>
            <li><a href="#"><i class="fa fa-bell fa-fw"></i>  Meus Dados</a></li>
            <li><a href="#"><i class="fa fa-cog fa-fw"></i>  Configurações</a></li>
        </ul>
        </div>
        </div>

            <div class="cadcat1"><h1>Tela de Login Default</h1>
            <br>
            <form action="loginDefault.jsp" method="POST">
                <label>Usuario</label>
                <input style="width:50%" type="text" name="usuario" />
                <br>
                <br>
                <label>Senha</label>
                <input style="width:30%" type="password" name="senha" />
                <br>
                <br>
                <input class="salvar" type="submit" value="Logar" />  
                <a href="index.html"><input class="cancelar" type="button" value="Cancelar" /><a/>
            </form>        
        </div>   
        <%
            String usuarioEsperado = "entra21";     // usuario autorizado para manutenção
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
  
            if ((usuario != null) && (senha != null) && !(usuario.isEmpty())
                    && !(senha.isEmpty())) {
                if (Usuario.podeLogar(usuario, senha)) {
                    if (usuario.contains(usuarioEsperado)) {
                        response.sendRedirect("consultaCategoriaDefault.jsp");
                    } else {
                        String msg = "Usuario não Autorizado na Manutenção!";
                        response.sendRedirect("informacao.jsp?msg=" + msg);
                    }
                }
            }
        %>
        
        <footer>
            <i class="final"><img src="imagens/icon-c.png" > - 2021 - Desenvolvido nas aulas de Java da Turma Maturitech </i>
        </footer>
        
    </body>
</html>
