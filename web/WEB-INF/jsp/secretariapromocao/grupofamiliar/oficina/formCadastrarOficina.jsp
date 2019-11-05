<%-- 
    Document   : cadastroOficina
    Created on : 04/06/2017, 20:52:21
    Author     : Herivelto
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/> 
<br>
<br>
<br>
<br>
<br>
<br>
<form class="form-horizontal" action="CadastrarOficina" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Cadastrar Oficina</legend>
        <!-- Text input-->  
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Nome da Oficina</label>
            <div class="col-md-5">
                <input name="idNomeOficina" type="text" placeholder="Nome da Oficina" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Descrição</label>
            <div class="col-md-5">
                <textarea name="idDescricao" type="text" placeholder="Descricao" maxlength="983" class="form-control input-md" required=""></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Vagas</label>
            <div class="col-md-5">
                <input name="idVagas" type="number" placeholder="Vagas" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Vagas em Reserva</label>
            <div class="col-md-5">
                <input name="idVagasReserva" type="number" placeholder="Vagas em Reserva" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-5">
                <div class="text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Salvar</button>
                    <a href="<c:url value="/voltar"/>" class="btn btn-info"><span class="glyphicon glyphicon-repeat"></span> Voltar</a>
                </div>
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog modal-md">
                        <div class="modal-content">
                            <div class="modal-body">
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR A OFICINA?</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
                                <a href="<c:url value="/cancelarGrupoFamiliar"/>" class="btn btn-danger"><span class="glyphicon glyphicon-erase"></span> Cancelar</a>         
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div>  
    </fieldset>
</form>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  