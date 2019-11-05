<%-- 
    Document   : sobreOficina
    Created on : 16/01/2018, 08:52:23
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
<div class="container">
    <div class="jumbotron">
        <h1 class="display-3 text-center">Oficinas</h1>
        <br>
        <p class="lead text-justify">A principal miss�o da Secretaria de Promo��o Social � a constru��o da Pol�tica Municipal
            de Assist�ncia Social atrav�s da implanta��o do SUAS que � o Sistema �nico da Assist�ncia
            Social, por meio do trabalho com as fam�lias da cidade que por alguma raz�o estejam em 
            situa��o de vulnerabilidade social.</p>
        <p class="lead text-justify">Estas raz�es podem ser por situa��o de risco social proveniente da pobreza, viol�ncia, 
            abandono, desajustes familiares, preconceito e outros. Este trabalho � feito em 
            v�rias etapas como escuta, acolhida, oferta de benef�cios eventuais, 
            programas de conv�vio, programas de transfer�ncia de renda e cursos de 
            capacita��o para gera��o de trabalho e renda. Nossa maior tarefa � estabelecer 
            uma rede de prote��o social para a comunidade com foco nas fam�lias e aten��o �s 
            crian�as, adolescentes, jovens, idosos e pessoas com defici�ncia.</p>
            <c:forEach var="oficinasCadastradasList" items="${oficinasCadastradasList}">
            <br>
            <br>
            <p class="text-center"><strong> Oficina: ${oficinasCadastradasList.getNome()}</strong>
                <br><strong>Descri��o:</strong> ${oficinasCadastradasList.getDescricao()}
                <br><strong>Vagas dispon�veis:</strong> ${oficinasCadastradasList.getVaga()}
                <br><strong>Vagas em reserva:</strong> ${oficinasCadastradasList.getCadastroreserva()}
                <br><br><a class="btn btn-primary" href="<c:url value="/formParticipantesOficina"/>"<span class="glyphicon glyphicon-save"></span> Inscri��o</a>
            </c:forEach>
        <nav aria-label="..." class="text-center">
            <ul class="pagination">
                <c:forEach var="count" begin="1" end="${count}">
                    <li class="page-item">
                        <c:if test="${first+1==count}">
                        <li class="page-item active">
                            <a class="page-link" href="<c:url value="/sobreOficina=${count-1}"/>">${count}<span class="sr-only">(current)</span></a>
                        </li> 
                    </c:if>
                    <c:if test="${first+1!=count}">                            
                        <a class="page-link" href="<c:url value="/sobreOficina=${count-1}"/>">${count}</a>
                    </c:if>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </div>
</div>

<c:import url="/WEB-INF/jsp/componentes/rodape.jsp"/>  

