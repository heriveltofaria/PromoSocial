<%-- 
    Document   : dashboardBolsaFamilia
    Created on : 17/07/2017, 19:07:15
    Author     : body8
--%>
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
            <c:choose>
                <c:when test="${usuarioLogado.getTipousuario() == 'Psicóloga'}">
                    <img class="img-circle" src="<c:url value="/resources/img/debora.jpg"/>" alt="Generic placeholder image" width="240" height="240"/>    
                </c:when>
                <c:when test="${usuarioLogado.getTipousuario() == 'Assistente Social'}">
                    <img class="img-circle" src="<c:url value="/resources/img/Katiana.jpg"/>" alt="Generic placeholder image" width="240" height="240"/>
                </c:when>
                <c:otherwise>
                    <p class="alert-danger">Não foi possivel carregar imagem</p>
                </c:otherwise>
            </c:choose>
            <div class="caption">
                <h3>Olá ${usuarioLogado.getLogin()},</h3>
                <h3>seja bem vindo!!!</h3>
                <br>
                <br>
                <div class="btn-group" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Grupo Familiar
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="btn btn-group-justified" href="<c:url value="/listDenuncias/usuario=${usuarioLogado.getTipousuario()}"/>"/>Listar Denúncias</a></li>
                            
                        </ul>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Oficinas
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="btn btn-group-lg" href="<c:url value="/cadastroOficina"/>">Cadastrar Nova Oficina</a></li>
                            <form action="listarOficinasCadastradas" method="GET" >
                                <li><button class="btn btn-group-justified" type="submit">Listar</button></li>
                            </form>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>   
