<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<br>
<br>
<br>
<br>
<br>
<br>
<script>
    function alert(id) {

        //bootbox.alert('deseja excluir o participante');
        swal({

            title: "Tem certeza que deseja excluir o grupo familiar?",
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
                        window.location.href = "<c:url value="/excluirGrupo="/>" + id;
                    } else {
                        swal("Cancelado", "A exclusão do grupo familiar foi cancelada :)", "error");
                    }

                });
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-13">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title text-center"><span class="glyphicon glyphicon-user"></span> Grupos Familiares</h2>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                        <tr>
                            <th class="text-center">NIS</th>
                            <th class="text-center">Responsável</th>
                            <th class="text-center">Bairro</th>
                            <th class="text-center">Telefone</th>
                            <th class="text-center">Sexo</th>
                            <th class="text-center">Data</th>
                            <th class="text-center">Paif</th>
                            <th class="text-center">Status</th>
                                <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                                <th class="text-center">Situação</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="grupoFamiliarList" items="${grupoFamiliarList}">
                        <td class="text-center">${grupoFamiliarList.getNis()}</td>
                        <td class="text-center">${grupoFamiliarList.getNomeresponsavel()}</td>
                        <td class="text-center">${grupoFamiliarList.getBairro()}</td>
                        <td class="text-center">${grupoFamiliarList.getTelefone()}</td> 
                        <td class="text-center">${grupoFamiliarList.getSexo()}</td> 
                        <td><fmt:formatDate value="${grupoFamiliarList.getData()}" pattern="dd/MM/yyyy"/></td>
                        <td>${grupoFamiliarList.getPaif()}</td>
                        <td class="text-center">${grupoFamiliarList.getStatus()}</td>
                        <c:if test="${usuarioLogado.getTipousuario()!='Secretária da Promoção'}">
                            <td>
                                <div class="btn-group-xs text-center">
                                    <a href="<c:url value="/alterarGrupo=${grupoFamiliarList.getId()}"/>" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> Alterar</a>
                                    <a type="button" onclick="alert(${grupoFamiliarList.getId()});" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
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
                                    <a class="page-link" href="<c:url value="/listarGrupos=${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                                </li> 
                            </c:if>
                            <c:if test="${first+1!=count}">                            
                                <a class="page-link" href="<c:url value="/listarGrupos=${count-1}"/>">${count}</a>
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