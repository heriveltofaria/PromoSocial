<%-- 
    Document   : menuPrinciapal
    Created on : 13/05/2017, 12:27:04
    Author     : Herivelto
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
        function alert() {

            //bootbox.alert('deseja excluir o participante');
            swal({

                title: "Para consulta pública do bolsa família recomendamos o uso do navegador Internet Explorer",
                
                type: "warning",
                showCancelButton: false,
                showConfirmButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "OK",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false,
                closeOnCancel: false

            },
                    function (isConfirm) {
                        if (isConfirm) {
                            window.location.href="http://www.caixa.gov.br/programas-sociais/bolsa-familia/Paginas/default.aspx";
                        } else {
                            swal("Você permanecerá nesta página :)");
                        }

                    });
        }
    </script>
<!-- NAVBAR
    ================================================== -->
<body ng-app="">
    
    <div class="navbar-wrapper">
        <div class="container-fluid">
            <nav class="navbar navbar-inverse navbar-static-top">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Secretaria de Promoção Social - Pedralva-MG</a>
                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="<c:url value="/index"/>">Home</a></li>
                            <li><a href="<c:url value="/sobre"/>">Sobre</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Serviços <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a onclick="alert();" href="">Bolsa Família</a></li>
                                    <li><a href="<c:url value="/sobreOficina=${0}"/>">Oficinas</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="<c:url value="/denuncia"/>">Denuncias de Irregularidades</a></li>
                                </ul>
                            </li>
                            <c:choose>
                                <c:when test="${usuarioLogado == null}">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Acesso Restrito<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="col-md-12">
                                                    <div class="col-lg-11">
                                                        <form class="form-horizontal" action="loginAutenticacao" method="POST">
                                                            <div class="form-group">
                                                                <label class="form-horizontal">Login</label>
                                                                <input type="text" class="form-control" name="login" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-horizontal">Password</label>
                                                                <input type="password" class="form-control" name="password" required="">
                                                            </div>
                                                            <div class="form-group">
                                                                <button class="btn btn-primary btn-block" type="submit">Enviar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                                <c:when test="${usuarioLogado != null}">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Acesso Restrito<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <div class="col-md-12">
                                                    <div class="col-lg-11">
                                                        <form class="form-horizontal" action="loginAutenticacao" method="POST">
                                                            <div class="btn-group-vertical">
                                                                <label><span class="glyphicon glyphicon-user"></span> Olá, ${usuarioLogado.getLogin()}</label>
                                                            </div>
                                                            <br>
                                                            <br>
                                                            <div class="btn-group-vertical">
                                                                <a href="<c:url value="/voltarDashboard=${usuarioLogado.getTipousuario()}"/>" class="btn btn-warning"><span class="glyphicon glyphicon glyphicon-edit"></span> Sua página de serviços</a>
                                                                <a href="<c:url value="/editarPerfil=${usuarioLogado.getId()}"/>" class="btn btn-primary text-justify"><span class="glyphicon glyphicon glyphicon-edit"></span> Editar perfil</a>
                                                                <a href="<c:url value="logout"/>" class="btn btn-danger"> <span class="glyphicon glyphicon-log-out"></span> Sair do sistema</a>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                </c:when>
                            </c:choose>  
                        </ul>
                    </div>

                </div>

            </nav>
        </div>
    </div>
