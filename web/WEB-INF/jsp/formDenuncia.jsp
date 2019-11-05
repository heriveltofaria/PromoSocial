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
<script>
    function validar() {
        if (document.form.descricao.value === " " || document.form.descricao.value === "")
        {
            alert("Por favor, Digite a descrição!");
            form.descricao.focus();
            return(false);
        }
    }

</script>
<form class="form-horizontal" name="form" action="CadastrarDenuncia" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Denúncia</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">*Tipo da denúncia</label>
            <div class="col-md-5">
                <select name="tipoDenuncia" type="text" class="form-control" required="">
                    <option value="" selected=""></option>
                    <option value="BolsaFamilia">Bolsa Família</option>
                    <option value="ConselhoTutelar">Conselho Tutelar</option>
                </select>
            </div>
        </div>   
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">Nome</label>
            <div class="col-md-5">
                <input id="idNomeOficina"  name="nome" type="text" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Email</label>
            <div class="col-md-5">
                <input name="email" type="email" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Telefone</label>
            <div class="col-md-5">
                <input name="telefone" type="number" class="form-control input-md">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">*Descrição da Denúncia</label>
            <div class="col-md-5">
                <textarea name="descricao" type="text" class="form-control input-md" required=""></textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-8">                
                <button class="btn btn-primary ">Confirmar</button>
                <a class="btn btn-danger" href="/PromocaoSocial2">Cancelar</a>
            </div>
        </div>
    </fieldset>
</form>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  
