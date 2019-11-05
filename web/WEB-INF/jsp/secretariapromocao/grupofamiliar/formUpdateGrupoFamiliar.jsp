<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>       
<br>
<br>
<br>
<br>
<br>
<script>
    function formatar(mascara, documento) {
        var i = documento.value.length;
        var saida = mascara.substring(1, 2);
        var texto = mascara.substring(i);

        if (texto.substring(0, 1) !== saida) {
            documento.value += texto.substring(0, 1);
        }

    }
</script>
<div class="container">
    <legend class="bg-warning text-center">Atualizar Grupo Familiar</legend>
    <form class="form-horizontal" action="alterar=${grupoFamiliar.getId()}" method="POST">
        <div class="form-group">
            <label for="nis" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> NIS</label>
            <div class="col-md-5">
                <input name="nis"  type="number" class="form-control" placeholder="${grupoFamiliar.getNis()}" required="" readonly="">
            </div>
        </div>
        <div class="form-group">
            <label for="nome" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Nome do Responsável</label>
            <div class="col-md-5">
                <input name="nome" value="${grupoFamiliar.getNomeresponsavel()}" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label for="bairro" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Bairro</label>
            <div class="col-md-5">
                <input name="bairro" value="${grupoFamiliar.getBairro()}" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label for="telefone" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Telefone</label>
            <div class="col-md-5">
                <input name="telefone" value="${grupoFamiliar.getTelefone()}" OnKeyPress="formatar('(##)#####-####', this)" maxlength="14" type="text" class="form-control" required="">
            </div>
        </div>
        <div class="form-group">
            <label for="data" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Data</label>
            <div class="col-md-5">
                <input name="data" type="text" class="form-control" placeholder="${grupoFamiliar.getData()}" readonly="" required="">
            </div>
        </div>
        <div class="form-group">
            <label for="paif" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> PAIF</label>
            <div class="col-md-5">
                <input name="paif" type="text" class="form-control"  placeholder="${grupoFamiliar.getPaif()}" readonly="" required="">
            </div>
        </div>
        <div class="form-group">
            <label for="sexo" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Sexo</label>
            <div class="col-md-5">
                <input name="sexo" type="text" class="form-control" placeholder="${grupoFamiliar.getSexo()}" readonly="" required="">
            </div>
        </div>
        <div class="form-group">
            <label for="status" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Status</label>
            <div class="col-md-5">
                <select name="status" type="text" class="form-control" required="">
                    <option value="${grupoFamiliar.getStatus()}" selected="">${grupoFamiliar.getStatus()}</option>
                    <option value="ativo">ativo</option>
                    <option value="desativado">desativado</option>         
                </select>
            </div>
        </div>
        <br>
        <div class="form-group">
            <label class="col-md-4 control-label" for="idConfirmar"></label>
            <div class="col-md-5">
                <div class="text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Salvar</button>
                    <a href="<c:url value="/voltar"/>" class="btn btn-info"><span class="glyphicon glyphicon-repeat"></span> Voltar</a>
                </div>
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog modal-md">

                        <div class="modal-content">
                            <div class="modal-body">
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA ATUALIZAR O GRUPO FAMILIAR?</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
                                <a href="<c:url value="/listarGrupos"/>" class="btn btn-danger"><span class="glyphicon glyphicon-erase"></span> Cancelar</a>         
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
