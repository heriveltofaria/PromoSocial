<%-- 
    Document   : listarOficinas
    Created on : 04/06/2017, 19:52:11
    Author     : Herivelto
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<script>
    function alert(id) {

        //bootbox.alert('deseja excluir o participante');
        swal({

            title: "Tem certeza que deseja excluir o participante?",
            text: "Ele será excluído permanentemente",
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
                        window.location.href = "<c:url value="/excluirParticipante="/>" + id;
                    } else {
                        swal("Cancelado", "A exclusão do participante foi cancelada :)", "error");
                    }

                });
    }
</script>
<br>
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
                    <h2 class="panel-title text-center"><span class="glyphicon glyphicon-user"></span> Participantes</h2>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                        <tr>
                            <th class="text-center">Oficina Escolhida</th>
                            <th class="text-center">Participante</th>
                            <th class="text-center">Telefone</th>
                            <th class="text-center">Bairro</th>
                            <th class="text-center">Status</th>
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                <th class="text-center">Situação</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="participantesList" items="${participantesList}">
                            <tr>
                                <td class="text-center">${participantesList.getOficinaescolhida()}</td>
                                <td class="text-center">${participantesList.getNome()}</td>
                                <td class="text-center">${participantesList.getTelefone()}</td>
                                <td class="text-center">${participantesList.getBairro()}</td> 
                                <td class="text-center">${participantesList.getStatus()}</td>
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                    <td>
                                        <div class="btn-group-xs text-center">
                                            <a href="<c:url value="/alterarParticipante=${participantesList.getId()}"/>" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-edit"></span> Alterar</a>
                                            <a type="button" onclick="alert(${participantesList.getId()});" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
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
                                    <a class="page-link" href="<c:url value="/listarParticipante=${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                                </li> 
                            </c:if>
                            <c:if test="${first+1!=count}">                            
                                <a class="page-link" href="<c:url value="/listarParticipante=${count-1}"/>">${count}</a>
                            </c:if>
                            </li>
                        </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  