/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Oficina;
import br.com.promocaosocial.model.service.OficinaService;
import java.awt.Desktop;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OficinasController {

    @RequestMapping("/cadastroOficina")
    public String getFormOficina() {
        return "secretariapromocao/grupofamiliar/oficina/formCadastrarOficina";
    }
    

    @RequestMapping(value = "CadastrarOficina", method = RequestMethod.POST)
    public String cadastrarOficina(HttpServletRequest request) throws Exception {
        Oficina oficina = new Oficina();
        oficina.setNome(request.getParameter("idNomeOficina"));
        oficina.setDescricao(request.getParameter("idDescricao"));
        oficina.setVaga(Long.parseLong(request.getParameter("idVagas")));
        oficina.setCadastroreserva(Long.parseLong(request.getParameter("idVagasReserva")));
        OficinaService oficinaService = new OficinaService();
        oficinaService.create(oficina);
        return "secretariapromocao/grupofamiliar/dashboardCras";
    }

    @RequestMapping("/listarOficinas={first}")
    public String listarOficinasCadastradas(Model model, @PathVariable("first") int first) throws Exception {
        OficinaService oficinasService = new OficinaService();
        int count = oficinasService.readByAll().size();
        if (count % 5 != 0) {
            count = count / 5 + 1;
        } else {
            count = count / 5;
        }
        model.addAttribute("count", count);
        model.addAttribute("first",first);
        List<Oficina> oficinasCadastradasList = oficinasService.readPaginator(first*5,5);
        model.addAttribute("oficinasCadastradasList", oficinasCadastradasList);
        return "secretariapromocao/grupofamiliar/oficina/listarOficinas";
    }
    @RequestMapping("/updateOficina={id}")
    public String alterarOficinas(Model model, @PathVariable("id") Long id) throws Exception {
        OficinaService oficinaService = new OficinaService();
        Oficina oficinas = oficinaService.readById(id);
        model.addAttribute("oficinasCadastradasList", oficinas);
        return "secretariapromocao/grupofamiliar/oficina/formUpdateOficina";
    }

    @RequestMapping(value = "update/oficina={id}", method = RequestMethod.POST)
    public String atualizarOficinas(@PathVariable("id") Long id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        OficinaService oficinaService = new OficinaService();
        Oficina oficina = oficinaService.readById(id);

        oficina.setCadastroreserva(Long.parseLong(request.getParameter("reserva")));
        oficina.setDescricao(request.getParameter("descricao"));
        oficina.setNome(request.getParameter("nome"));
        oficina.setVaga(Long.parseLong(request.getParameter("vagas")));
        
        oficinaService.update(oficina);
        
        
        return response.encodeRedirectURL("secretariapromocao/grupofamiliar/dashboardCras");
    }

    @RequestMapping("/excluirOficinas={id}")
    public String excluirOficinas(Model model, @PathVariable("id") Long id) throws Exception {

        OficinaService oficinasService = new OficinaService();
        oficinasService.delete(id);
        List<Oficina> oficinasCadastradasList = oficinasService.readByAll();
        model.addAttribute("oficinasCadastradasList", oficinasCadastradasList);
        return "secretariapromocao/grupofamiliar/dashboardCras";
    }
    @RequestMapping("/sobreOficina={first}")
    public String sobreOficina(Model model, @PathVariable("first") int first) throws Exception {
        listarOficinasCadastradas(model,first);
        return "secretariapromocao/grupofamiliar/oficina/sobreOficina";
    }
}
