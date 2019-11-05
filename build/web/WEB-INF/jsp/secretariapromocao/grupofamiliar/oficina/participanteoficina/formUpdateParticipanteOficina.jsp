<%-- 
    Document   : formUpdateParticipanteOficina
    Created on : 26/07/2017, 11:04:53
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
<form class="form-horizontal" action="AtualizarParticipante=${pessoasOficinas.getId()}" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Atualizar Cadastro Participantes</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">Oficina escolhida</label>
            <div class="col-md-5">
                <select name="idOficina" class="form-control">
                    <option value="${pessoasOficinas.getOficinaescolhida()}">${pessoasOficinas.getOficinaescolhida()}</option>
                    <c:forEach var="oficinasCadastradasList" items="${oficinasCadastradasList}">
                        <option value="${oficinasCadastradasList.getNome()}">${oficinasCadastradasList.getNome()}</option>
                    </c:forEach>
                </select>             
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Nome do Participante</label>
            <div class="col-md-5">
                <input name="idParticipante" type="text" value="${pessoasOficinas.getNome()}" maxlength="100" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">CPF</label>
            <div class="col-md-5">
                <input name="idCpf" type="text" OnKeyPress="formatar('###.###.###-##', this)" maxlength="14" value="${pessoasOficinas.getCpf()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Telefone</label>
            <div class="col-md-5">
                <input name="idTelefone" type="text" OnKeyPress="formatar('(##)####-####', this)" maxlength="13" value="${pessoasOficinas.getTelefone()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Logradouro</label>
            <div class="col-md-5">
                <input name="idLogradouro" type="text" maxlength="100" value="${pessoasOficinas.getLogradouro()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Número</label>
            <div class="col-md-5">
                <input name="idNumero" type="text" maxlength="10" value="${pessoasOficinas.getNumero()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Complemento</label>
            <div class="col-md-5">
                <input name="idComplemento" type="text" maxlength="50" value="${pessoasOficinas.getComplemento()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Bairro</label>
            <div class="col-md-5">
                <input name="idBairro" type="text" maxlength="100" value="${pessoasOficinas.getBairro()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Cidade</label>
            <div class="col-md-5">
                <input name="idCidade" type="text" maxlength="100" value="${pessoasOficinas.getCidade()}" class="form-control input-md" required="">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label">Status</label>
            <div class="col-md-5">
                <select name="idStatus" class="form-control">
                    <option value="${pessoasOficinas.getStatus()}" class="form-control input-md" required="">${pessoasOficinas.getStatus()}</option>
                    <option value="Cursando" class="form-control input-md" required="">Cusando</option>
                    <option value="Concluído" class="form-control input-md" required="">Concluído</option>
                    <option value="Desistente" class="form-control input-md" required="">Desistente</option>
                </select>
            </div>
        </div>    

        <div class="form-group">
            <label class="col-md-4 control-label" for="idConfirmar"></label>
            <div class="col-md-5">
                <div class="text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Salvar</button>
                    <a href="<c:url value="/cancelarParticipante"/>" class="btn btn-info"><span class="glyphicon glyphicon-repeat"></span> Voltar</a>
                </div>
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog modal-md">

                        <div class="modal-content">
                            <div class="modal-body">
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR O CADASTRO?</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
                                <a href="<c:url value="/cancelarParticipante"/>" class="btn btn-danger"><span class="glyphicon glyphicon-erase"></span> Cancelar</a>         
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        </div> 


    </fieldset>
</form>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  