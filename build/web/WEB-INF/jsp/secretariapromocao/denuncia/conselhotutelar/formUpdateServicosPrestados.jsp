<%-- 
    Document   : formUpdateServicosPrestados
    Created on : 17/07/2017, 11:50:01
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
<form class="form-horizontal" action="update=${servicos.getId()}" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Servi�os Prestados do Conselho Tutetar</legend>
        <!-- Text input-->

        <div class="form-group">
            <label class="col-md-4 control-label">M�s de refer�ncia</label>
            <div class="col-md-5">
                <select name="mes" class="form-control">
                    <option value="${servicos.getMesreferencia()}">${servicos.getMesreferencia()}</option>
                    <option value="Janeiro">Janeiro</option>
                    <option value="Fevereiro">Fevereiro</option>
                    <option value="Mar�o">Mar�o</option>
                    <option value="Abril">Abril</option>
                    <option value="Maio">Maio</option>
                    <option value="Junho">Junho</option>
                    <option value="Julho">Julho</option>
                    <option value="Agosto">Agosto</option>
                    <option value="Novembro">Novembro</option>
                    <option value="Outubro">Outubro</option>
                    <option value="Novembro">Novembro</option>
                    <option value="Dezembro">Dezembro</option>
                </select>             
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Atendimentos</label>
            <div class="col-md-5">
                <input name="atendimentos" type="number" value="${servicos.getAtendimento()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ato infracional</label>
            <div class="col-md-5">
                <input name="atoinfracional" type="number" value="${servicos.getAtoinfracional()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Den�ncia</label>
            <div class="col-md-5">
                <input name="denuncia" type="number" value="${servicos.getDenuncia()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Encaminhamento para o judici�rio</label>
            <div class="col-md-5">
                <input name="encaminhamentopjud" type="number" value="${servicos.getEncaminhamentopjud()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Evas�o</label>
            <div class="col-md-5">
                <input name="evasao" type="number" value="${servicos.getEvasao()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Indisciplina</label>
            <div class="col-md-5">
                <input name="indisciplina" type="number" value="${servicos.getIndisciplina()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Notifica��o</label>
            <div class="col-md-5">
                <input name="notificacao" type="number" value="${servicos.getNotificacao()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Representa��o no minist�rio p�blico</label>
            <div class="col-md-5">
                <input name="representacaompub" type="number" value="${servicos.getRepresentacaompub()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requis�o de creche</label>
            <div class="col-md-5">
                <input name="requisaocreche" type="number" value="${servicos.getRequisaocreche()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="idEstado">Requisi��o de sa�de</label>
            <div class="col-md-5">
                <input name="requisicaosaude" type="number" value="${servicos.getRequisicaosaude()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisi��o de servi�o social</label>
            <div class="col-md-5">
                <input name="requisicaoservsocial" type="number" value="${servicos.getRequisicaoservsocial()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisi��o de educa��o</label>
            <div class="col-md-5">
                <input name="requisicaoeducacao" type="number" value="${servicos.getRequisicaoeducacao()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Respostas</label>
            <div class="col-md-5">
                <input name="respostas" type="number" value="${servicos.getRespostas()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Solicita��o da PM</label>
            <div class="col-md-5">
                <input name="solicitacaopm" type="number" value="${servicos.getSolicitacaopm()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita abuso sexual</label>
            <div class="col-md-5">
                <input name="suspeitaabusosex" type="number" value="${servicos.getSuspeitaabusosex()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita de maus tratos</label>
            <div class="col-md-5">
                <input name="suspeitamaustratos" type="number" value="${servicos.getSuspeitamaustratos()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita de trabalho infantil</label>
            <div class="col-md-5">
                <input name="suspeitatrabinf" type="number" value="${servicos.getSuspeitatrabinf()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Visitas domiciliar</label>
            <div class="col-md-5">
                <input name="visitasdomi" type="number" value="${servicos.getVisitasdomi()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Outros servi�os</label>
            <div class="col-md-5">
                <input name="outrosserv" type="number" value="${servicos.getOutrosserv()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Plant�o</label>
            <div class="col-md-5">
                <input name="plantao" type="number" value="${servicos.getPlantao()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Palestra</label>
            <div class="col-md-5">
                <input name="palestra" type="number" value="${servicos.getPalestra()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Acolhimento</label>
            <div class="col-md-5">
                <input name="acolhimento" type="number" value="${servicos.getAcolhimento()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Telefonemas recebido</label>
            <div class="col-md-5">
                <input name="telefonesrecebido" type="number" value="${servicos.getTelefonesrecebido()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ida as UBS</label>
            <div class="col-md-5">
                <input name="idaubs" type="number" value="${servicos.getIdaubs()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ida a escola</label>
            <div class="col-md-5">
                <input name="idaescola" type="number" value="${servicos.getIdaescola()}" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Encaminhamento de of�cios</label>
            <div class="col-md-5">
                <input name="encaminhamentooficios" type="number" value="${servicos.getEncaminhamentooficios()}" class="form-control input-md" required="">
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
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR A ATUALIZA��O?</p>
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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  
