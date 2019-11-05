<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<br>
<br>
<br>
<br>
<br>
<br>
<form class="form-horizontal" action="CadastrarServiçosPrestados" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Serviços Prestados do Conselho Tutetar</legend>
        <!-- Text input-->

        <div class="form-group">
            <label class="col-md-4 control-label">Mês de referência</label>
            <div class="col-md-5">
                <select name="mes" class="form-control">
                    <option value="Janeiro">Janeiro</option>
                    <option value="Fevereiro">Fevereiro</option>
                    <option value="Março">Março</option>
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
                <input name="atendimentos" type="number" placeholder="Número de atendimentos realizados no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ato infracional</label>
            <div class="col-md-5">
                <input name="atoinfracional" type="number" placeholder="Número de atos infracionais realizados no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Denúncia</label>
            <div class="col-md-5">
                <input name="denuncia" type="number" placeholder="Número de denúncias realizadas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Encaminhamento para o judiciário</label>
            <div class="col-md-5">
                <input name="encaminhamentopjud" type="number" placeholder="Número de encaminhamentos para o juciário realizados no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Evasão</label>
            <div class="col-md-5">
                <input name="evasao" type="number" placeholder="Número de evasões no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Indisciplina</label>
            <div class="col-md-5">
                <input name="indisciplina" type="number" placeholder="Número de atendimentos por indisciplina realizadas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Notificação</label>
            <div class="col-md-5">
                <input name="notificacao" type="number" placeholder="Número de notificações realizadas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Representação no ministério público</label>
            <div class="col-md-5">
                <input name="representacaompub" type="number" placeholder="Número de representações realizadas no ministério público" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisão de creche</label>
            <div class="col-md-5">
                <input name="requisaocreche" type="number" placeholder="Número de requisições de creche pedidas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="idEstado">Requisição de saúde</label>
            <div class="col-md-5">
                <input name="requisicaosaude" type="number" placeholder="Número de requisições de saúde pedidas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisição de serviço social</label>
            <div class="col-md-5">
                <input name="requisicaoservsocial" type="number" placeholder="Número de requisições pedidas de serviço social no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisição de educação</label>
            <div class="col-md-5">
                <input name="requisicaoeducacao" type="number" placeholder="Número de requisições pedidas de educação no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Respostas</label>
            <div class="col-md-5">
                <input name="respostas" type="number" placeholder="Número de respostas obtidas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Solicitação da PM</label>
            <div class="col-md-5">
                <input name="solicitacaopm" type="number" placeholder="Número de solicitações da polícia militar no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita abuso sexual</label>
            <div class="col-md-5">
                <input name="suspeitaabusosex" type="number" placeholder="Número supeitas de abuso sexual no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita de maus tratos</label>
            <div class="col-md-5">
                <input name="suspeitamaustratos" type="number" placeholder="Número de suspeitas de maus tratos no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita de trabalho infantil</label>
            <div class="col-md-5">
                <input name="suspeitatrabinf" type="number" placeholder="Número de suspeitas de trabalho infantil no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Visitas domiciliar</label>
            <div class="col-md-5">
                <input name="visitasdomi" type="number" placeholder="Número de visitas domiciliares realizadas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Outros serviços</label>
            <div class="col-md-5">
                <input name="outrosserv" type="number" placeholder="Número de outros serviços realizados no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Plantão</label>
            <div class="col-md-5">
                <input name="plantao" type="number" placeholder="Número de plantões realizadas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Palestra</label>
            <div class="col-md-5">
                <input name="palestra" type="number" placeholder="Número de palestras realizadas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Acolhimento</label>
            <div class="col-md-5">
                <input name="acolhimento" type="number" placeholder="Número de acolhimento realizados no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Telefonemas recebido</label>
            <div class="col-md-5">
                <input name="telefonesrecebido" type="number" placeholder="Número de telefonemas recebidos no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ida as UBS</label>
            <div class="col-md-5">
                <input name="idaubs" type="number" placeholder="Número de idas as UBS no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ida a escola</label>
            <div class="col-md-5">
                <input name="idaescola" type="number" placeholder="Número de idas as escolas no mês" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Encaminhamento de ofícios</label>
            <div class="col-md-5">
                <input name="encaminhamentooficios" type="number" placeholder="Número de encaminhamento de ofícios no mês" class="form-control input-md" required="">
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="idConfirmar"></label>
            <div class="col-md-5">
                <div class="text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#confirm"><span class="glyphicon glyphicon-save"></span> Salvar</button>
                    <a href="<c:url value="/cancelarTabela"/>" class="btn btn-info"><span class="glyphicon glyphicon-repeat"></span> Cancelar</a>
                </div>
                <div class="modal fade" id="confirm" role="dialog">
                    <div class="modal-dialog modal-md">

                        <div class="modal-content">
                            <div class="modal-body">
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR O CADASTRO DE SERVIÇOS?</p>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-floppy-disk"></span> Salvar</button>
                                <a href="<c:url value="cancelarTabela"/>" class="btn btn-danger"><span class="glyphicon glyphicon-erase"></span> Cancelar</a>         
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
