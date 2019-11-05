/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Servicosprestados;
import br.com.promocaosocial.model.service.ServicoPrestadoService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConselhoTutelarController {

    @RequestMapping("/cadastrarTabela")
    public String cadastrarTabela() {
        return "secretariapromocao/denuncia/conselhotutelar/formCadastrarServicosPrestados";
    }
    
    @RequestMapping("/cancelarTabela")
    public String cancelarTabela(){
        return "secretariapromocao/denuncia/conselhotutelar/formCadastrarServicosPrestados";
    }
    @RequestMapping("/cancelarAtualizacao")
    public String cancelarAtualizacao(Model model) throws Exception{
        listarServicos(model,0);
        return "secretariapromocao/denuncia/conselhotutelar/listarServicosConselhoTutelar";
    }
    

    @RequestMapping(value = "CadastrarServiçosPrestados", method = RequestMethod.POST)
    public String cadastrarServicosprestados(HttpServletRequest request) throws Exception {
        Servicosprestados servicosPrestados = new Servicosprestados();
        servicosPrestados.setMesreferencia(request.getParameter("mes"));
        servicosPrestados.setAtendimento(Long.parseLong(request.getParameter("atendimentos")));
        servicosPrestados.setAtoinfracional(Long.parseLong(request.getParameter("atoinfracional")));
        servicosPrestados.setDenuncia(Long.parseLong(request.getParameter("denuncia")));
        servicosPrestados.setEncaminhamentopjud(Long.parseLong(request.getParameter("encaminhamentopjud")));
        servicosPrestados.setEvasao(Long.parseLong(request.getParameter("evasao")));
        servicosPrestados.setIndisciplina(Long.parseLong(request.getParameter("indisciplina")));
        servicosPrestados.setNotificacao(Long.parseLong(request.getParameter("notificacao")));
        servicosPrestados.setRepresentacaompub(Long.parseLong(request.getParameter("representacaompub")));
        servicosPrestados.setRequisaocreche(Long.parseLong(request.getParameter("requisaocreche")));
        servicosPrestados.setRequisicaosaude(Long.parseLong(request.getParameter("requisicaosaude")));
        servicosPrestados.setRequisicaoservsocial(Long.parseLong(request.getParameter("requisicaoservsocial")));
        servicosPrestados.setRequisicaoeducacao(Long.parseLong(request.getParameter("requisicaoeducacao")));
        servicosPrestados.setRespostas(Long.parseLong(request.getParameter("respostas")));
        servicosPrestados.setSolicitacaopm(Long.parseLong(request.getParameter("solicitacaopm")));
        servicosPrestados.setSuspeitaabusosex(Long.parseLong(request.getParameter("suspeitaabusosex")));
        servicosPrestados.setSuspeitamaustratos(Long.parseLong(request.getParameter("suspeitamaustratos")));
        servicosPrestados.setSuspeitatrabinf(Long.parseLong(request.getParameter("suspeitatrabinf")));
        servicosPrestados.setVisitasdomi(Integer.parseInt(request.getParameter("visitasdomi")));
        servicosPrestados.setOutrosserv(Long.parseLong(request.getParameter("outrosserv")));
        servicosPrestados.setPlantao(Long.parseLong(request.getParameter("plantao")));
        servicosPrestados.setPalestra(Long.parseLong(request.getParameter("palestra")));
        servicosPrestados.setAcolhimento(Long.parseLong(request.getParameter("acolhimento")));
        servicosPrestados.setTelefonesrecebido(Long.parseLong(request.getParameter("telefonesrecebido")));
        servicosPrestados.setIdaubs(Long.parseLong(request.getParameter("idaubs")));
        servicosPrestados.setIdaescola(Long.parseLong(request.getParameter("idaescola")));
        servicosPrestados.setEncaminhamentooficios(Long.parseLong(request.getParameter("encaminhamentooficios")));

        ServicoPrestadoService servicosPrestadosSevice = new ServicoPrestadoService();
        servicosPrestadosSevice.create(servicosPrestados);
        return "secretariapromocao/denuncia/conselhotutelar/dasboardConselhoTutelar";
    }

    @RequestMapping("/listarServicos={first}")
    public String listarServicos(Model model, @PathVariable("first") int first) throws Exception {
        ServicoPrestadoService servicosPrestados = new ServicoPrestadoService();
        int count = servicosPrestados.readByAll().size();
        if (count % 5 != 0) {
            count = count / 5 + 1;
        } else {
            count = count / 5;
        }
        model.addAttribute("count", count);
        model.addAttribute("first",first);
        List<Servicosprestados> servicosList = servicosPrestados.readPaginator(first*5,5);
        model.addAttribute("servicosList", servicosList);

        return "secretariapromocao/denuncia/conselhotutelar/listarServicosConselhoTutelar";
    }
    
    @RequestMapping(value = "pesquisarCriterioMes", method = RequestMethod.GET)
    public String listarServicoMes(Model model, HttpServletRequest request){
        ServicoPrestadoService servicosPrestados = new ServicoPrestadoService();
        String parametro = request.getParameter("mesreferencia");
        List<Servicosprestados> servicosList = servicosPrestados.readByCriteria(parametro);
        model.addAttribute("servicosList", servicosList);

        return "secretariapromocao/denuncia/conselhotutelar/listarServicosConselhoTutelar";
    }
    @RequestMapping("/alterarServicos={id}")
    public String alterarServicosPrestados(Model model, @PathVariable("id") Long id) throws Exception {
        ServicoPrestadoService servicosPrestados = new ServicoPrestadoService();
        Servicosprestados servicos = servicosPrestados.readById(id);
        model.addAttribute("servicos", servicos);
        //GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        //grupoFamiliarService.update(grupoFamiliar);
        return "secretariapromocao/denuncia/conselhotutelar/formUpdateServicosPrestados";
    }

    @RequestMapping(value = "update={id}", method = RequestMethod.POST)
    public String atualizarServicos(@PathVariable("id") Long id, HttpServletRequest request, Model model) throws Exception {
        ServicoPrestadoService servicosPrestadosService = new ServicoPrestadoService();
        Servicosprestados servicosPrestados = servicosPrestadosService.readById(id);

        servicosPrestados.setMesreferencia(request.getParameter("mes"));
        servicosPrestados.setAtendimento(Long.parseLong(request.getParameter("atendimentos")));
        servicosPrestados.setAtoinfracional(Long.parseLong(request.getParameter("atoinfracional")));
        servicosPrestados.setDenuncia(Long.parseLong(request.getParameter("denuncia")));
        servicosPrestados.setEncaminhamentopjud(Long.parseLong(request.getParameter("encaminhamentopjud")));
        servicosPrestados.setEvasao(Long.parseLong(request.getParameter("evasao")));
        servicosPrestados.setIndisciplina(Long.parseLong(request.getParameter("indisciplina")));
        servicosPrestados.setNotificacao(Long.parseLong(request.getParameter("notificacao")));
        servicosPrestados.setRepresentacaompub(Long.parseLong(request.getParameter("representacaompub")));
        servicosPrestados.setRequisaocreche(Long.parseLong(request.getParameter("requisaocreche")));
        servicosPrestados.setRequisicaosaude(Long.parseLong(request.getParameter("requisicaosaude")));
        servicosPrestados.setRequisicaoservsocial(Long.parseLong(request.getParameter("requisicaoservsocial")));
        servicosPrestados.setRequisicaoeducacao(Long.parseLong(request.getParameter("requisicaoeducacao")));
        servicosPrestados.setRespostas(Long.parseLong(request.getParameter("respostas")));
        servicosPrestados.setSolicitacaopm(Long.parseLong(request.getParameter("solicitacaopm")));
        servicosPrestados.setSuspeitaabusosex(Long.parseLong(request.getParameter("suspeitaabusosex")));
        servicosPrestados.setSuspeitamaustratos(Long.parseLong(request.getParameter("suspeitamaustratos")));
        servicosPrestados.setSuspeitatrabinf(Long.parseLong(request.getParameter("suspeitatrabinf")));
        servicosPrestados.setVisitasdomi(Integer.parseInt(request.getParameter("visitasdomi")));
        servicosPrestados.setOutrosserv(Long.parseLong(request.getParameter("outrosserv")));
        servicosPrestados.setPlantao(Long.parseLong(request.getParameter("plantao")));
        servicosPrestados.setPalestra(Long.parseLong(request.getParameter("palestra")));
        servicosPrestados.setAcolhimento(Long.parseLong(request.getParameter("acolhimento")));
        servicosPrestados.setTelefonesrecebido(Long.parseLong(request.getParameter("telefonesrecebido")));
        servicosPrestados.setIdaubs(Long.parseLong(request.getParameter("idaubs")));
        servicosPrestados.setIdaescola(Long.parseLong(request.getParameter("idaescola")));
        servicosPrestados.setEncaminhamentooficios(Long.parseLong(request.getParameter("encaminhamentooficios")));

        servicosPrestadosService.update(servicosPrestados);
        
        listarServicos(model,0);
        
        return "secretariapromocao/denuncia/conselhotutelar/listarServicosConselhoTutelar";
    }

    @RequestMapping("/excluirServicos={id}")
    public String excluirServicos(Model model, @PathVariable("id") Long id) throws Exception {

        ServicoPrestadoService servicosPrestados = new ServicoPrestadoService();
        servicosPrestados.delete(id);
        
        listarServicos(model,0);
        
        return "secretariapromocao/denuncia/conselhotutelar/listarServicosConselhoTutelar";
    }
}
