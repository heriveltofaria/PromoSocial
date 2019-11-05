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
    function validaSenha() {
        if (document.f1.senha1.value !== document.f1.senha2.value) {
            bootbox.alert('As senhas digitadas estão diferentes');
            f1.senha1.focus();
            return false;
        }
    }
</script>
<form class="form-horizontal" name="f1" action="atualizarperfil" method="POST">
    <fieldset>
        <!-- Form Name -->
        <legend class="bg-warning text-center">Editar Perfil</legend>   
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label">Nome do Usuário</label>
            <div class="col-md-5">
                <input name="usuario" type="text" class="form-control input-md" value="${usuario.getNome()}" readonly="" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Login</label>
            <div class="col-md-5">
                <input name="login" type="text" class="form-control input-md" value="${usuario.getLogin()}" minlength="8" required="">
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Senha</label>
            <div class="col-md-5">
                <input name="senha1" type="password" class="form-control input-md"  value="${usuario.getSenha()}" required="" minlength="8" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Confirmar senha</label>
            <div class="col-md-5">
                <input name="senha2" type="password" class="form-control input-md" value="${usuario.getSenha()}" required="" minlength="8" />
            </div>
        </div>
            
        <div class="form-group">
            <label class="col-md-4 control-label">Tipo Usuario</label>
            <div class="col-md-5">
                <select name="tipoUsuario" type="text" class="form-control"  required="">
                    <option value="${usuario.getTipousuario()}" selected="">${usuario.getTipousuario()}</option>
                    <option value="Psicóloga">Psicóloga</option>
                    <option value="Assistente Social">Assistente Social</option>
                    <option value="Assistente Bolsa Família">Assistente Bolsa Família</option>
                    <option value="Conselheiro Tutelar">Conselheiro Tutelar</option>
                    <option value="Secretária da Promoção">Secretária da Promoção</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label"></label>
            <div class="col-md-8">
                <button type="submit" class="btn btn-primary"  onclick="return validaSenha()">Confirmar</button>
                <button  name="Cancelar" class="btn btn-danger">Cancelar</button>
            </div>
        </div>
    </fieldset>
</form>
<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  

