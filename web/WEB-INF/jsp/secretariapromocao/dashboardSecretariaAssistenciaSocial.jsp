<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>       

<br>
<br>
<br>
<br>
<br>
<br>

<div class="form-group-sm">


</div>

<div class="row text-center col-lg-11">
    <div class="col-md-offset-1">
        <div class="thumbnail">
            <c:choose>
                <c:when test="${usuarioLogado.getTipousuario() == 'Secretária da Promoção'}">
                    <img class="img-circle" src="<c:url value="/resources/img/jussara.jpg"/>" alt="Generic placeholder image" width="240" height="240"/>
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
                <div class="btn-group-vertical" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Grupo Familiar
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu ">

                            <li><a class="btn btn-group-justified" href="<c:url value="/listarGrupos=${0}"/>">Listar Grupos Familiares</a></li></ul>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Pesquisar Grupo Familiar
                            <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu ">
                            <form action="pesquisarCriterio" method="GET">
                                <label class="control-label"></label>
                                <div class="col-lg-13">
                                    <input name="nomeResponsavel" type="text" class="form-control text-center" placeholder="Nome do Responsável" required="">
                                    <button type="submit" class="btn btn-primary btn-group-justified">
                                        <span class="glyphicon glyphicon-search"></span>  Pesquisar
                                    </button>

                                </div>
                            </form>
                        </ul>

                    </div>
                </div>
                <div class="btn-group-vertical" role="group" aria-label="..."> 
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Oficinas
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">

                            <li><a class="btn btn-group-lg text-center" href="<c:url value="/listarOficinas=${0}"/>">Listar oficinas</a></li>     
                            <li><a class="btn btn-group-lg text-center" href="<c:url value="/listarParticipante=${0}"/>">Listar participantes</a></li>
                        </ul>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Pesquisar Participantes
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu ">
                            <form action="listarCriterioNomeParicipante" method="GET">
                                <label class="control-label"></label>
                                <div class="col-lg-13">
                                    <input type="text" class="form-control text-center" name="nomeParticipante" placeholder="Nome do Participante" required="">
                                    <button class="btn btn-primary btn-group-justified" type="submit" aria-expanded="false" aria-controls="collapseExample">
                                        <span class="glyphicon glyphicon-search"></span>  Pesquisar
                                    </button>
                                </div>
                            </form>
                            <form action="listarCriterioOficina" method="GET">
                                <label class="control-label"></label>
                                <div class="col-lg-13">
                                    <input type="text" class="form-control text-center" name="nomeOficina" placeholder="Nome da Oficina" required="">
                                    <button class="btn btn-primary btn-group-justified" type="submit" aria-expanded="false" aria-controls="collapseExample">
                                        <span class="glyphicon glyphicon-search"></span>  Pesquisar
                                    </button>
                                </div>
                            </form>
                        </ul>
                    </div>
                </div>
                <div class="btn-group-vertical" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Conselho Tutelar
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu ">
                            <li><a href="<c:url value="/listarServicos=${0}"/>" class="btn btn-group-justified">Listar Tabela</a></li>
                        </ul>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Pesquisar Tabela por mês
                            <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu ">
                            <form action="pesquisarCriterioMes" method="GET">
                                <label class="control-label"></label>
                                <div class="col-lg-13">
                                    <input name="mesreferencia" type="text" class="form-control " placeholder="digite o mês de referência" required="">
                                    <button type="submit" class="btn btn-primary btn-group-justified">
                                        <span class="glyphicon glyphicon-search"></span>  Pesquisar
                                    </button>

                                </div>
                            </form>
                        </ul>

                    </div>
                </div>
                <div class="btn-group-vertical" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Denúncias
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu ">
                            <li><a class="btn btn-group-justified" href="<c:url value="/listDenuncias/usuario=${usuarioLogado.getTipousuario()}/${0}"/>">Denúncias Bolsa Família</a></li>
                            <li><a class="btn btn-group-justified" href="<c:url value="/listDenuncias/usuario=${usuarioLogado.getTipousuario()}/${0}"/>">Denúncias Conselho Tutelar</a></li>
                        </ul>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Pesquisar Grupo Familiar
                            <span class="caret"></span>
                        </button>

                        <ul class="dropdown-menu ">
                            <form action="pesquisarCriterio" method="GET">
                                <label class="control-label"></label>
                                <div class="col-lg-13">
                                    <input name="nomeResponsavel" type="text" class="form-control text-center" placeholder="Nome do Responsável" required="">
                                    <button type="submit" class="btn btn-primary btn-group-justified">
                                        <span class="glyphicon glyphicon-search"></span>  Pesquisar
                                    </button>

                                </div>
                            </form>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>


    <c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>   
