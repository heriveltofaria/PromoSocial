<%-- 
    Document   : formDenuncia
    Created on : 17/07/2017, 13:33:57
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
<br>
<form class="form-horizontal" action="AtualizarDenunciaConselho=${denuncia.getId()}" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Denúncia</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">Nome</label>
            <div class="col-md-5">
                <input name="nome" value="${denuncia.getNome()}" type="text" class="form-control input-md" readonly="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Email</label>
            <div class="col-md-5">
                <input name="email" value="${denuncia.getEmail()}" type="email" class="form-control input-md" readonly="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Telefone</label>
            <div class="col-md-5">
                <input name="telefone" value="${denuncia.getTelefone()}" type="number" class="form-control input-md" readonly="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">*Descrição da Denúncia</label>
            <div class="col-md-5">
                <textarea name="descricao" value="${denuncia.getDescricao()}" type="text" class="form-control input-md" required="" readonly="">${denuncia.getDescricao()}</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">*Analise</label>
            <div class="col-md-5">
                <select name="analise" type="text" class="form-control" required="">
                    <option value="${denuncia.getAnalise()}" selected="">${denuncia.getAnalise()}</option>
                    <option value="Concluído...(denuncia falsa)">Concluído...(denuncia falsa)</option>
                    <option value="Concluído...(denuncia verídica)">Concluído...(denuncia verídica)</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="idConfirmar"></label>
            <div class="col-md-5">
                <div class="text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Salvar</button>
                    <a href="<c:url value="/cancelarAtualizacao"/>" class="btn btn-info"><span class="glyphicon glyphicon-repeat"></span> Voltar</a>
                </div>
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog modal-md">

                        <div class="modal-content">
                            <div class="modal-body">
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR A ATUALIZAÇÃO?</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
                                <a href="<c:url value="/cancelarAtualizacao"/>" class="btn btn-danger"><span class="glyphicon glyphicon-erase"></span> Cancelar</a>         
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </fieldset>
</form>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  
