<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${usuarioLogado.getTipousuario() == 'Psicóloga'}">
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
        <legend class="bg-warning text-center">Cadastrar Grupos Familiares</legend>
        <br>
        <form class="form-horizontal" action="salvarGrupoFamiliar" method="POST">
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> NIS</label>
                <div class="col-md-5">
                    <input name="nis" type="number" class="form-control" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Nome do Responsável</label>
                <div class="col-md-5">
                    <input name="nome" type="text" class="form-control" maxlength="40" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Bairro</label>
                <div class="col-md-5">
                    <input name="bairro" type="text" class="form-control" maxlength="100" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Telefone</label>
                <div class="col-md-5">
                    <input name="telefone" type="text" OnKeyPress="formatar('(##)#####-####', this)" class="form-control" maxlength="14" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Data</label>
                <div class="col-md-5">
                    <input name="data" type="date" OnKeyPress="formatar('##/##/####', this)" maxlength="10" class="form-control" required="">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> PAIF</label>
                <div class="col-md-5">
                    <select name="paif" type="text" class="form-control" required="">
                        <option value="" selected=""></option>
                        <option value="Sim">Possui</option>
                        <option value="Não">Não Possui</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Sexo</label>
                <div class="col-md-5">
                    <select  name="sexo" class="form-control" type="text" required="">
                        <option value="" selected=""></option>
                        <option value="M">M</option>
                        <option value="F">F</option>         
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-md-4 control-label"><span class="glyphicon glyphicon-asterisk"></span> Status</label>
                <div class="col-md-5">
                    <select  name="status" class="form-control" type="text" required="">
                        <option value="" selected=""></option>
                        <option value="Ativo">Ativo</option>
                        <option value="Desativado">Desativado</option>         
                    </select>
                </div>
            </div>
            <br>
            <div class="form-group">
                <label class="col-md-4 control-label"></label>
                <div class="col-md-5">
                    <div class="text-right">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Salvar</button>
                        <button type="reset" class="btn btn-info"><span class="glyphicon glyphicon-repeat"></span> Voltar</button>
                    </div>
                    <div class="modal fade" id="confirm" role="dialog">
                        <div class="modal-dialog modal-md">
                            <div class="modal-content">
                                <div class="modal-body">
                                    <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR O GRUPO FAMILIAR?</p>
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
</c:if>