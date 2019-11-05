<%-- 
    Document   : listarDenuncias
    Created on : 17/07/2017, 18:27:30
    Author     : body8
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<br>
<br>
<br>
<br>
<script>
    function alert(id) {

        //bootbox.alert('deseja excluir o participante');
        swal({

            title: "Tem certeza que deseja excluir a denuncia?",
            text: "A denuncia será excluído permanentemente",
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
                        window.location.href = "<c:url value="/excluirDenuncia="/>" + id;
                    } else {
                        swal("Cancelado", "A exclusão da tabela foi cancelada :)", "error");
                    }

                });
    }
</script>
<div class="container">
    <div class="row">
        <div class="col-md-13">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title text-center"><span class="glyphicon glyphicon-user"></span> Denúncias</h2>
                </div>
                <table class="table table-hover" id="dev-table">
                    <thead>
                        <tr>
                            <th class="text-center">Nome</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Telefone</th>
                            <th class="text-center">Descrição da Denúncia</th>
                            <th class="text-center">Análise da denuncia</th>
                            <th class="text-center">Status</th>
                                <c:if test="${usuarioLogado.getTipousuario()=='Secretária da Promoção'}">
                                <th class="text-center">Tipo de Denúncia</th>
                                </c:if>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="denuncia" items="${denuncia}">
                            <tr class="text-center"> 
                                <td class="text-center">${denuncia.getNome()}</td>
                                <td class="text-center">${denuncia.getEmail()}</td>
                                <td class="text-center">${denuncia.getTelefone()}</td>                    
                                <td class="text-center">${denuncia.getDescricao()}</td>
                                <td class="text-center">${denuncia.getAnalise()}</td>
                                <td class="text-center"><a href="<c:url value="/alterarDenunciaConselho=${denuncia.getId()}"/>" class="btn btn-info">Alterar</a>
                                    <c:if test="${usuarioLogado.getTipousuario()=='Secretária da Promoção'}">
                                        <a type="button" onclick="alert(${denuncia.getId()});" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Excluir</a>
                                    </c:if>
                                    <c:if test="${usuarioLogado.getTipousuario()=='Secretária da Promoção'}">
                                    <th class="text-center">${denuncia.getTipo()}</th>
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
                                    <a class="page-link" href="<c:url value="/listDenuncias/usuario=${usuarioLogado.getTipousuario()}/${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                                </li> 
                            </c:if>
                            <c:if test="${first+1!=count}">                            
                                <a class="page-link" href="<c:url value="/listDenuncias/usuario=${usuarioLogado.getTipousuario()}/${count-1}"/>">${count}</a>
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
