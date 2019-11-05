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
        <p class="lead text-justify">A principal missão da Secretaria de Promoção Social é a construção da Política Municipal
            de Assistência Social através da implantação do SUAS que é o Sistema Único da Assistência
            Social, por meio do trabalho com as famílias da cidade que por alguma razão estejam em 
            situação de vulnerabilidade social.</p>
        <p class="lead text-justify">Estas razões podem ser por situação de risco social proveniente da pobreza, violência, 
            abandono, desajustes familiares, preconceito e outros. Este trabalho é feito em 
            várias etapas como escuta, acolhida, oferta de benefícios eventuais, 
            programas de convívio, programas de transferência de renda e cursos de 
            capacitação para geração de trabalho e renda. Nossa maior tarefa é estabelecer 
            uma rede de proteção social para a comunidade com foco nas famílias e atenção às 
            crianças, adolescentes, jovens, idosos e pessoas com deficiência.</p>
            <c:forEach var="oficinasCadastradasList" items="${oficinasCadastradasList}">
            <br>
            <br>
            <p class="text-center"><strong> Oficina: ${oficinasCadastradasList.getNome()}</strong>
                <br><strong>Descrição:</strong> ${oficinasCadastradasList.getDescricao()}
                <br><strong>Vagas disponíveis:</strong> ${oficinasCadastradasList.getVaga()}
                <br><strong>Vagas em reserva:</strong> ${oficinasCadastradasList.getCadastroreserva()}
                <br><br><a class="btn btn-primary" href="<c:url value="/formParticipantesOficina"/>"<span class="glyphicon glyphicon-save"></span> Inscrição</a>
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

