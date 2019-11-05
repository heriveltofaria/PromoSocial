<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/>  
<br>
<br>
<br>
<br>
<br>
<br>
<form class="form-horizontal" action="CadastrarServi�osPrestados" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Servi�os Prestados do Conselho Tutetar</legend>
        <!-- Text input-->

        <div class="form-group">
            <label class="col-md-4 control-label">M�s de refer�ncia</label>
            <div class="col-md-5">
                <select name="mes" class="form-control">
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
                <input name="atendimentos" type="number" placeholder="N�mero de atendimentos realizados no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ato infracional</label>
            <div class="col-md-5">
                <input name="atoinfracional" type="number" placeholder="N�mero de atos infracionais realizados no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Den�ncia</label>
            <div class="col-md-5">
                <input name="denuncia" type="number" placeholder="N�mero de den�ncias realizadas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Encaminhamento para o judici�rio</label>
            <div class="col-md-5">
                <input name="encaminhamentopjud" type="number" placeholder="N�mero de encaminhamentos para o juci�rio realizados no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Evas�o</label>
            <div class="col-md-5">
                <input name="evasao" type="number" placeholder="N�mero de evas�es no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Indisciplina</label>
            <div class="col-md-5">
                <input name="indisciplina" type="number" placeholder="N�mero de atendimentos por indisciplina realizadas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Notifica��o</label>
            <div class="col-md-5">
                <input name="notificacao" type="number" placeholder="N�mero de notifica��es realizadas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Representa��o no minist�rio p�blico</label>
            <div class="col-md-5">
                <input name="representacaompub" type="number" placeholder="N�mero de representa��es realizadas no minist�rio p�blico" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requis�o de creche</label>
            <div class="col-md-5">
                <input name="requisaocreche" type="number" placeholder="N�mero de requisi��es de creche pedidas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label" for="idEstado">Requisi��o de sa�de</label>
            <div class="col-md-5">
                <input name="requisicaosaude" type="number" placeholder="N�mero de requisi��es de sa�de pedidas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisi��o de servi�o social</label>
            <div class="col-md-5">
                <input name="requisicaoservsocial" type="number" placeholder="N�mero de requisi��es pedidas de servi�o social no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Requisi��o de educa��o</label>
            <div class="col-md-5">
                <input name="requisicaoeducacao" type="number" placeholder="N�mero de requisi��es pedidas de educa��o no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Respostas</label>
            <div class="col-md-5">
                <input name="respostas" type="number" placeholder="N�mero de respostas obtidas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Solicita��o da PM</label>
            <div class="col-md-5">
                <input name="solicitacaopm" type="number" placeholder="N�mero de solicita��es da pol�cia militar no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita abuso sexual</label>
            <div class="col-md-5">
                <input name="suspeitaabusosex" type="number" placeholder="N�mero supeitas de abuso sexual no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita de maus tratos</label>
            <div class="col-md-5">
                <input name="suspeitamaustratos" type="number" placeholder="N�mero de suspeitas de maus tratos no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Suspeita de trabalho infantil</label>
            <div class="col-md-5">
                <input name="suspeitatrabinf" type="number" placeholder="N�mero de suspeitas de trabalho infantil no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Visitas domiciliar</label>
            <div class="col-md-5">
                <input name="visitasdomi" type="number" placeholder="N�mero de visitas domiciliares realizadas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Outros servi�os</label>
            <div class="col-md-5">
                <input name="outrosserv" type="number" placeholder="N�mero de outros servi�os realizados no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Plant�o</label>
            <div class="col-md-5">
                <input name="plantao" type="number" placeholder="N�mero de plant�es realizadas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Palestra</label>
            <div class="col-md-5">
                <input name="palestra" type="number" placeholder="N�mero de palestras realizadas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Acolhimento</label>
            <div class="col-md-5">
                <input name="acolhimento" type="number" placeholder="N�mero de acolhimento realizados no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Telefonemas recebido</label>
            <div class="col-md-5">
                <input name="telefonesrecebido" type="number" placeholder="N�mero de telefonemas recebidos no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ida as UBS</label>
            <div class="col-md-5">
                <input name="idaubs" type="number" placeholder="N�mero de idas as UBS no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Ida a escola</label>
            <div class="col-md-5">
                <input name="idaescola" type="number" placeholder="N�mero de idas as escolas no m�s" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Encaminhamento de of�cios</label>
            <div class="col-md-5">
                <input name="encaminhamentooficios" type="number" placeholder="N�mero de encaminhamento de of�cios no m�s" class="form-control input-md" required="">
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
                                <p><span class="glyphicon glyphicon-thumbs-up"></span>  TEM CERTEZA QUE DESEJA SALVAR O CADASTRO DE SERVI�OS?</p>
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
