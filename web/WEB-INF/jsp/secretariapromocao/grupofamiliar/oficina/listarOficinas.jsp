<%-- 
    Document   : listarOficinasCadastradas
    Created on : 04/06/2017, 22:11:56
    Author     : Herivelto
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/> 
<script>
    function alert(id) {

        //bootbox.alert('deseja excluir o participante');
        swal({

            title: "Tem certeza que deseja excluir a oficina?",
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
                        window.location.href = "<c:url value="/excluirOficinas="/>" + id;
                    } else {
                        swal("Cancelado", "A exclusão da oficina foi cancelada :)", "error");
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
                    <h2 class="panel-title text-center"><span class="glyphicon glyphicon-user"></span>Oficinas</h2>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                        <tr>
                            <th class="text-center">Oficina</th>
                            <th class="text-center col-lg-10">Descrição</th>
                            <th class="text-center">Vagas</th>
                            <th class="text-center">Vagas em Reserva</th>
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                <th class="text-center col-lg-5">Situação</th>
                                </c:if>
                        </tr>
                    </thead>
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
                                            <a href="<c:url value="/updateOficina=${oficinasCadastradasList.getId()}"/>" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> Alterar</a>
                                            <a onclick="alert(${oficinasCadastradasList.getId()});" class="btn btn-danger dropdown-menu-right" ><span class="glyphicon glyphicon-trash"></span> Excluir</a>
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
                                    <a class="page-link" href="<c:url value="/listarOficinas=${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                                </li> 
                            </c:if>
                            <c:if test="${first+1!=count}">                            
                                <a class="page-link" href="<c:url value="/listarOficinas=${count-1}"/>">${count}</a>
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
