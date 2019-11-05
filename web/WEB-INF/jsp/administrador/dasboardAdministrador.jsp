<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="row text-center col-lg-11">
    <div class="col-md-offset-1">
        <div class="text-right col-lg-12">
            <a href="logout" class="btn btn-success">Sair do sistema</a>
        </div>
        <div class="thumbnail">
            <img class="img-circle" src="<c:url value="/resources/img/rock.jpg"/>" alt="Generic placeholder image" width="240" height="240"/> 
            <div class="caption">
                <h3>Olá ${usuarioLogado.getLogin()},</h3>
                <h3>seja bem vindo!!!</h3>
                <br>
                <br>
                <div class="btn-group" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Grupo Usuários do Sistema
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="btn btn-group-justified" href="<c:url value="/formCadastrarUsuario/id=${usuarioLogado.getTipousuario()}"/>">Cadastrar Usuários</a></li>
                            <li><a class="btn btn-group-justified" href="<c:url value="/listarUsuario=${0}"/>">Listar Usuários</button></a>
                            <li><a class="btn btn-group-justified" href="<c:url value="/editarSite"/>">Editar site</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>    
    <c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>   