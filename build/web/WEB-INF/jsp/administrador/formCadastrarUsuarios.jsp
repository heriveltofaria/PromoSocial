<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/jsp/componentes/cabecalho.jsp"/> 
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<form class="form-horizontal" action="cadastrarUsuario" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Cadastrar Usu�rio</legend>   
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">Nome do Usu�rio</label>
            <div class="col-md-5">
                <input name="usuario" type="text" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Login</label>
            <div class="col-md-5">
                <input name="login" type="text" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Senha</label>
            <div class="col-md-5">
                <input name="senha" type="password" class="form-control input-md" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Tipo Usuario</label>
            <div class="col-md-5">
                <select name="tipoUsuario" type="text" class="form-control"  required="">
                    <option value="" selected=""></option>
                    <option value="Psic�loga">Psic�loga</option>
                    <option value="Assistente Social">Assistente Social</option>
                    <option value="Assistente Bolsa Fam�lia">Assistente Bolsa Fam�lia</option>
                    <option value="Conselheiro Tutelar">Conselheiro Tutelar</option>
                    <option value="Secret�ria da Promo��o">Secret�ria da Promo��o</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-8">
                <button class="btn btn-primary">Confirmar</button>
                <button type="reset" name="Cancelar" class="btn btn-danger">Cancelar</button>
            </div>
        </div>
    </fieldset>
</form>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  
