<%-- 
    Document   : formUpdateOficina
    Created on : 17/07/2017, 15:52:44
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
<div class="form-horizontal">
    <legend class="bg-warning text-center">Atualizar Oficinas</legend>
    <form action="update/oficina=${oficinasCadastradasList.getId()}" method="POST">
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Nome da Oficina</label>
            <div class="col-md-5">
                <input name="nome" value="${oficinasCadastradasList.getNome()}" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Descrição</label>
            <div class="col-md-5">
                <input name="descricao" value="${oficinasCadastradasList.getDescricao()}" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Vagas</label>
            <div class="col-md-5">
                <input name="vagas" value="${oficinasCadastradasList.getVaga()}" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Vagas em Reserva</label>
            <div class="col-md-5">
                <input name="reserva" value="${oficinasCadastradasList.getCadastroreserva()}" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-5">
                <div class="text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Atualizar Oficina</button>
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
    </form>

    <br>
    <br>

</div>
<br>
<br>
<br>


<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>       


