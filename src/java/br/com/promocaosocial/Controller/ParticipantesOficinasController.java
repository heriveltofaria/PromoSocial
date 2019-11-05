/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Oficina;
import br.com.promocaosocial.model.Pessoasoficinas;
import br.com.promocaosocial.model.service.OficinaService;
import br.com.promocaosocial.model.service.PessoasOficinaService;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParticipantesOficinasController {

    @RequestMapping("/oficinas")
    public String getOficina(Model model) throws Exception {
        OficinaService oficinasService = new OficinaService();

        List<Oficina> oficinasCadastradasList = oficinasService.readByAll();
        model.addAttribute("oficinasCadastradasList", oficinasCadastradasList);
        return "oficinas";
    }

    @RequestMapping("/formParticipantesOficina")
    public String getFormParticipantesOficina(Model model) throws Exception {
        OficinaService oficinasService = new OficinaService();
        List<Oficina> oficinasCadastradasList = oficinasService.readByAll();
        model.addAttribute("oficinasCadastradasList", oficinasCadastradasList);
        return "formCadastrarParticipantesOficina";
    }

    @RequestMapping(value = "CadastrarParticipante", method = RequestMethod.POST)
    protected String getFormPartcipantesOficina(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        Pessoasoficinas pessoasOficinas = new Pessoasoficinas();
        pessoasOficinas.setNome(request.getParameter("idParticipante"));
        pessoasOficinas.setBairro(request.getParameter("idBairro"));
        pessoasOficinas.setTelefone(request.getParameter("idTelefone"));
        pessoasOficinas.setCidade(request.getParameter("idCidade"));
        pessoasOficinas.setComplemento(request.getParameter("idComplemento"));
        pessoasOficinas.setCpf(request.getParameter("idCpf"));
        pessoasOficinas.setLogradouro(request.getParameter("idLogradouro"));
        pessoasOficinas.setNumero(request.getParameter("idNumero"));
        pessoasOficinas.setOficinaescolhida(request.getParameter("idOficina"));

        OficinaService oficinaService = new OficinaService();
        List<Oficina> oficinaList = oficinaService.readByCriteria(request.getParameter("idOficina"));
        for (Iterator<Oficina> iterator = oficinaList.iterator(); iterator.hasNext();) {
            Oficina next = iterator.next();
            if (next.getVaga() != 0) {
                pessoasOficinas.setStatus("Cadastrado");
                long vaga = next.getVaga() - 1l;
                next.setVaga(vaga);
                oficinaService.update(next);
            } else {
                pessoasOficinas.setStatus("Cadastrado em Reserva");
                long vagaExedente = next.getCadastroreserva() - 1l;
                next.setCadastroreserva(vagaExedente);
                oficinaService.update(next);
            }
        }
        PessoasOficinaService pessoasOficinaService = new PessoasOficinaService();
        pessoasOficinaService.create(pessoasOficinas);
        return "/index";
    }

    @RequestMapping("/cancelarParticipante")
    public String cancelarCadastro() {
        return "/index";
    }

    @RequestMapping("/listarParticipante={first}")
    public String listarOficinas(Model model, @PathVariable("first") int first) throws Exception {
        PessoasOficinaService pessoasOficinasService = new PessoasOficinaService();
        int count = pessoasOficinasService.readByAll().size();
        if (count % 5 != 0) {
            count = count / 5 + 1;
        } else {
            count = count / 5;
        }
        model.addAttribute("count", count);
        model.addAttribute("first",first);
        List<Pessoasoficinas> participantesList = pessoasOficinasService.readPaginator(first*5,5);
        model.addAttribute("participantesList", participantesList);
        
        return "secretariapromocao/grupofamiliar/oficina/participanteoficina/listarParticipantesOficinas";
    }

    @RequestMapping(value = "listarCriterioOficina", method = RequestMethod.GET)
    public String pesquisar(Model model, HttpServletRequest request) throws Exception {
        String oficinaescolhida = request.getParameter("nomeOficina");
        PessoasOficinaService pessoasOficinasService = new PessoasOficinaService();
        List<Pessoasoficinas> participantesList = pessoasOficinasService.readByOficina(oficinaescolhida);
        model.addAttribute("participantesList", participantesList);
        return "secretariapromocao/grupofamiliar/oficina/participanteoficina/listarParticipantesOficinas";
    }

    @RequestMapping(value = "listarCriterioNomeParicipante", method = RequestMethod.GET)
    public String listarUsuarioCriterio(Model model, HttpServletRequest request) {

        PessoasOficinaService pessoasOficinasService = new PessoasOficinaService();
        String parametro = request.getParameter("nomeParticipante");
        List<Pessoasoficinas> participantesList = pessoasOficinasService.readByCriteria(parametro);
        model.addAttribute("participantesList", participantesList);

        return "secretariapromocao/grupofamiliar/oficina/participanteoficina/listarParticipantesOficinas";
    }

    @RequestMapping("/alterarParticipante={id}")
    public String alterarGrupoFamiliar(Model model, @PathVariable("id") Long id) throws Exception {

        OficinaService oficinasService = new OficinaService();
        List<Oficina> oficinasCadastradasList = oficinasService.readByAll();
        model.addAttribute("oficinasCadastradasList", oficinasCadastradasList);

        PessoasOficinaService pessoasOficinasService = new PessoasOficinaService();
        Pessoasoficinas pessoasOficinas = pessoasOficinasService.readById(id);
        model.addAttribute("pessoasOficinas", pessoasOficinas);

        return "secretariapromocao/grupofamiliar/oficina/participanteoficina/formUpdateParticipanteOficina";
    }

    @RequestMapping(value = "AtualizarParticipante={id}", method = RequestMethod.POST)
    public String atualizarGrupoFamiliar(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {

        PessoasOficinaService pessoasOficinasService = new PessoasOficinaService();
        Pessoasoficinas pessoasOficinas = pessoasOficinasService.readById(id);

        pessoasOficinas.setNome(request.getParameter("idParticipante"));
        pessoasOficinas.setBairro(request.getParameter("idBairro"));
        pessoasOficinas.setTelefone(request.getParameter("idTelefone"));
        pessoasOficinas.setCpf(request.getParameter("idCpf"));
        pessoasOficinas.setCidade(request.getParameter("idCidade"));
        pessoasOficinas.setComplemento(request.getParameter("idComplemento"));
        pessoasOficinas.setStatus(request.getParameter("idStatus"));
        pessoasOficinas.setLogradouro(request.getParameter("idLogradouro"));
        pessoasOficinas.setNumero(request.getParameter("idNumero"));
        pessoasOficinas.setOficinaescolhida(request.getParameter("idOficina"));

        PessoasOficinaService pessoasOficinaService = new PessoasOficinaService();
        pessoasOficinaService.update(pessoasOficinas);

        return "secretariapromocao/grupofamiliar/dashboardCras";
    }

    @RequestMapping("/excluirParticipante={id}")
    public String excluirUsuario(Model model, @PathVariable("id") Long id) throws Exception {

        PessoasOficinaService pessoaOficinaService = new PessoasOficinaService();
        Pessoasoficinas pessoasOficina = pessoaOficinaService.readById(id);

        OficinaService oficinaService = new OficinaService();
        List<Oficina> oficinaList = oficinaService.readByCriteria(pessoasOficina.getOficinaescolhida());

        for (Iterator<Oficina> iterator = oficinaList.iterator(); iterator.hasNext();) {
            Oficina next = iterator.next();
            if (next.getNome().equals(pessoasOficina.getOficinaescolhida()) && pessoasOficina.getStatus().equals("Cadastrado")) {
                long vaga = next.getVaga() + 1l;
                next.setVaga(vaga);
                oficinaService.update(next);
            } else {
                long vagaExedente = next.getCadastroreserva() + 1l;
                next.setCadastroreserva(vagaExedente);
                oficinaService.update(next);
            }
        }

        PessoasOficinaService pessoasOficinaService = new PessoasOficinaService();
        pessoasOficinaService.delete(id);
        //  List<Pessoasoficinas> pessoasOficinasList = pessoasOficinaService.readByAll();
        // model.addAttribute("pessoasOficinasList", pessoasOficinasList);

        return "secretariapromocao/grupofamiliar/dashboardCras";
    }
}
