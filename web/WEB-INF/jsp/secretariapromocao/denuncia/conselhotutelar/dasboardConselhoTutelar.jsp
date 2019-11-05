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
        
        <div class="thumbnail">
            <img class="img-circle" src="<c:url value="/resources/img/Conselho-Tutelar.png"/>" alt="Generic placeholder image" width="240" height="240"/> 
            <div class="caption">
                <h3>Olá ${usuarioLogado.getLogin()},</h3>
                <h3>seja bem vindo!!!</h3>
                <br>
                <br>
                <div class="btn-group" role="group" aria-label="...">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Serviços no sistema
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="btn btn-group-justified" href="<c:url value="/cadastrarTabela"/>">Cadastrar Tabela</a></li>
                            <li><a href="<c:url value="/listarServicos=${0}"/>" class="btn btn-group-justified">Listar Tabela</a></a>
                            <li><a class="btn btn-group-justified" href="<c:url value="/listDenuncias/usuario=${usuarioLogado.getTipousuario()}/${0}"/>">Visualizar Denúncias</a></li>
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
            </div>
        </div>
    </div>    
    <c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>   