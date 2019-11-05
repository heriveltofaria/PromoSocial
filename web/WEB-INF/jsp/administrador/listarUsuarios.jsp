<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<script>
    function alert(id) {

        //bootbox.alert('deseja excluir o participante');
        swal({

            title: "Tem certeza que deseja excluir o usuário?",
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
                        window.location.href = "<c:url value="excluirUsuario/id="/>" + id;
                    } else {
                        swal("Cancelado", "A exclusão do usuário foi cancelada :)", "error");
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
                    <h2 class="panel-title text-center"><span class="glyphicon glyphicon-user"></span> Usuários Cadastrados</h2>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                        <tr>
                            <th class="text-center">Nome do Usuário</th>
                            <th class="text-center">Tipo Usuario</th>
                            <th class="text-center">Login</th>
                            <th class="text-center">Senha</th>
                            <th class="text-center">Situação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuariosCadastradoList" items="${usuariosCadastradoList}">
                            <tr>
                                <td class="text-center">${usuariosCadastradoList.getNome()}</td>
                                <td class="text-center">${usuariosCadastradoList.getTipousuario()}</td>
                                <td class="text-center">${usuariosCadastradoList.getLogin()}</td>
                                <td class="text-center">${usuariosCadastradoList.getSenha()}</td>
                                <td>
                                    <div class="btn-group-xs text-center">
                                        <a href="<c:url value="alterar/grupo=${usuariosCadastradoList.getId()}"/>" class="btn btn-info"><span class="glyphicon glyphicon-refresh"></span> Alterar</a>
                                        <a type="button" onclick="alert(${usuariosCadastradoList.getId()});" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
                                    </div>
                                </td>
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
                                    <a class="page-link" href="<c:url value="/listarUsuario=${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                                </li> 
                            </c:if>
                            <c:if test="${first+1!=count}">                            
                                <a class="page-link" href="<c:url value="/listarUsuario=${count-1}"/>">${count}</a>
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
<br> 
<br>
<br>
<br>
<br>
<br>
<br>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  
