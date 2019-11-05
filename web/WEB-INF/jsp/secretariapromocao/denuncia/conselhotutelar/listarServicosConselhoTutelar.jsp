<%-- 
    Document   : listarServicosConselhoTutelar
    Created on : 14/07/2017, 12:03:24
    Author     : body8
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<script>
    function alert(id) {

        //bootbox.alert('deseja excluir o participante');
        swal({

            title: "Tem certeza que deseja excluir a tabela?",
            text: "A tabela será excluído permanentemente",
            type: "warning",
            showCancelButton: false,
            showConfirmButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Sim",
            cancelButtonText: "Não",
            closeOnConfirm: false,
            closeOnCancel: false

        },
                function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "<c:url value="/excluirServicos="/>" + id;
                    } else {
                        swal("Cancelado", "A exclusão da tabela foi cancelada :)", "error");
                    }

                });
    }
</script>
<br>
<br>
<br>
<br> 
<br>
<div class="container">
    <div class="row">
        <div class="col-md-13">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title text-center"><span class="glyphicon glyphicon-user"></span>Serviços Prestados do Conselho Tutetar</h2>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                        <tr>
                            <th class="text-center">Mês de referência</th>
                            <th class="text-center">Atendimentos</th>
                            <th class="text-center">Ato infracional</th>
                            <th class="text-center">Denúncia</th>
                            <th class="text-center">Encaminhamento para o judiciário</th>
                            <th class="text-center">Evasão</th>
                            <th class="text-center">Indisciplina</th>   
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="servicosList" items="${servicosList}">
                            <tr> 
                                <td class="text-center">${servicosList.getMesreferencia()}</td>
                                <td class="text-center">${servicosList.getAtendimento()}</td>
                                <td class="text-center">${servicosList.getAtoinfracional()}</td>                   
                                <td class="text-center">${servicosList.getDenuncia()}</td>
                                <td class="text-center">${servicosList.getEncaminhamentopjud()}</td>
                                <td class="text-center">${servicosList.getEvasao()}</td>
                                <td class="text-center">${servicosList.getIndisciplina()}</td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                    <thead>
                        <tr>
                            <th class="text-center">Notificação</th>
                            <th class="text-center">Representação no ministério público</th>
                            <th class="text-center">Requisão de creche</th>
                            <th class="text-center">Requisição de saúde</th>
                            <th class="text-center">Requisição de serviço social</th>
                            <th class="text-center">Requisição de educação</th>
                            <th class="text-center">Respostas</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="servicosList" items="${servicosList}"> 
                            <tr>
                                <td class="text-center">${servicosList.getNotificacao()}</td>
                                <td class="text-center">${servicosList.getRepresentacaompub()}</td>
                                <td class="text-center">${servicosList.getRequisaocreche()}</td>
                                <td class="text-center">${servicosList.getRequisicaosaude()}</td>
                                <td class="text-center">${servicosList.getRequisicaoservsocial()}</td>
                                <td class="text-center">${servicosList.getRequisicaoeducacao()}</td>
                                <td class="text-center">${servicosList.getRespostas()}</td>

                            </tr>
                        </c:forEach> 
                    </tbody>
                    <thead>
                        <tr>
                            <th class="text-center">Solicitação da PM</th>
                            <th class="text-center">Suspeita abuso sexual</th>
                            <th class="text-center">Suspeita de maus tratos</th>
                            <th class="text-center">Suspeita de trabalho infantil</th>
                            <th class="text-center">Visitas domiciliar</th>
                            <th class="text-center">Outros serviços</th>
                            <th class="text-center">Plantão</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="servicosList" items="${servicosList}"> 
                            <tr> 
                                <td class="text-center">${servicosList.getSolicitacaopm()}</td>
                                <td class="text-center">${servicosList.getSuspeitaabusosex()}</td>
                                <td class="text-center">${servicosList.getSuspeitamaustratos()}</td>
                                <td class="text-center">${servicosList.getSuspeitatrabinf()}</td>
                                <td class="text-center">${servicosList.getVisitasdomi()}</td>
                                <td class="text-center">${servicosList.getOutrosserv()}</td>
                                <td class="text-center">${servicosList.getPlantao()}</td>

                            </tr>
                        </c:forEach>
                    </tbody>
                    <thead>
                        <tr>
                            <th class="text-center">Palestra</th>
                            <th class="text-center">Acolhimento</th>
                            <th class="text-center">Telefonemas recebido</th>
                            <th class="text-center">Ida as UBS</th>
                            <th class="text-center">Ida a escola</th>
                            <th class="text-center">Encaminhamento de ofícios</th>
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                <th class="text-center col-lg-3">Situação</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="servicosList" items="${servicosList}"> 
                            <tr> 
                                <td class="text-center">${servicosList.getPalestra()}</td>
                                <td class="text-center">${servicosList.getAcolhimento()}</td>
                                <td class="text-center">${servicosList.getTelefonesrecebido()}</td>
                                <td class="text-center">${servicosList.getIdaubs()}</td>
                                <td class="text-center">${servicosList.getIdaescola()}</td>
                                <td class="text-center">${servicosList.getEncaminhamentooficios()}</td>
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                    <td>
                                        <div class="btn-group-xs text-center">
                                            <a href="<c:url value="/alterarServicos=${servicosList.getId()}"/>" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span> Alterar</a>
                                            <a type="button" onclick="alert(${servicosList.getId()});" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
                                        </div>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>

                    <tbody>
                        <c:forEach var="oficinasCadastradasList" items="${oficinasCadastradasList}">
                            <tr>
                                <td class="text-center">${oficinasCadastradasList.getNome()}</td>
                                <td class="text-center ">${oficinasCadastradasList.getDescricao()}</td>
                                <td class="text-center">${oficinasCadastradasList.getVaga()}</td>
                                <td class="text-center">${oficinasCadastradasList.getCadastroreserva()}</td> 
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                    <td>
                                        <div class="btn-group-xs text-center">
                                            <a href="<c:url value="/alterarServicos=${servicosList.getId()}"/>" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span> Alterar</a>
                                    <a type="button" onclick="alert(${servicosList.getId()});" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
                                        </div>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="..." class="text-center">
                    <ul class="pagination">
                        <c:forEach var="count" begin="1" end="${count}">
                            <li class="page-item">
                                <c:if test="${first+1==count}">
                                <li class="page-item active">
                                    <a class="page-link" href="<c:url value="//listarServicos=${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                                </li> 
                            </c:if>
                            <c:if test="${first+1!=count}">                            
                                <a class="page-link" href="<c:url value="//listarServicos=${count-1}"/>">${count}</a>
                            </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  
