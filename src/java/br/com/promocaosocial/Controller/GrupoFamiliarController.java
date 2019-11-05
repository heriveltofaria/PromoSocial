/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Grupofamiliar;
import br.com.promocaosocial.model.Usuario;
import br.com.promocaosocial.model.service.GrupoFamiliarService;
import br.com.promocaosocial.model.service.UsuarioService;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GrupoFamiliarController {

    @RequestMapping("/voltar")
    public String getDasboard() {
        return "secretariapromocao/grupofamiliar/dashboardCras";
    }

    @RequestMapping("/formCadastroGrupoFamiliar")
    public String getFormGrupoFamiliar() {
        return "secretariapromocao/grupofamiliar/formCadastrarGrupoFamiliar";
    }

    @RequestMapping("/cancelarGrupoFamiliar")
    public String cancelarCadastro() {
        return "secretariapromocao/grupofamiliar/dashboardCras";
    }

    @RequestMapping("/editarPerfil={id}")
    public String editarPerfil(Model model, @PathVariable Long id) throws Exception {
        UsuarioService usuarioService = new UsuarioService();
        Usuario usuario = usuarioService.readById(id);
        model.addAttribute("usuario", usuario);
        return "secretariapromocao/grupofamiliar/editarperfil";
    }

    @RequestMapping(value = "salvarGrupoFamiliar", method = RequestMethod.POST)
    public String getFormCadastro(HttpServletRequest request) throws Exception {
        String dat = request.getParameter("data");
        String[] div = dat.split("-");

        int ano = Integer.parseInt(div[0]);
        int mes = Integer.parseInt(div[1]);
        int dia = Integer.parseInt(div[2]);

        Date data = new Date(ano - 1900, mes - 1, dia);

        Grupofamiliar grupoFamiliar = new Grupofamiliar();
        grupoFamiliar.setNomeresponsavel(request.getParameter("nome"));
        grupoFamiliar.setBairro(request.getParameter("bairro"));
        grupoFamiliar.setTelefone(request.getParameter("telefone"));
        grupoFamiliar.setData(data);
        grupoFamiliar.setNis(Long.parseLong(request.getParameter("nis")));
        grupoFamiliar.setPaif(request.getParameter("paif"));
        grupoFamiliar.setStatus(request.getParameter("status"));
        grupoFamiliar.setSexo(request.getParameter("sexo"));

        GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        grupoFamiliarService.create(grupoFamiliar);

        return "secretariapromocao/grupofamiliar/formCadastrarGrupoFamiliar";
    }

    @RequestMapping("/listarGrupos={first}")
    public String listarUsuario(Model model, @PathVariable("first") int first) throws Exception {
        GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        int count = grupoFamiliarService.readByAll().size();
        if (count % 5 != 0) {
            count = count / 5 + 1;
        } else {
            count = count / 5;
        }
        model.addAttribute("count", count);
        model.addAttribute("first",first);
        List<Grupofamiliar> grupoFamiliarList = grupoFamiliarService.readPaginator(first*5,5);
        model.addAttribute("grupoFamiliarList", grupoFamiliarList);
        return "secretariapromocao/grupofamiliar/listarGrupoFamiliar";
    }

    @RequestMapping(value = "pesquisarCriterio", method = RequestMethod.GET)
    public String listarUsuarioCriterio(Model model, HttpServletRequest request) {
        GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        String parametro = request.getParameter("nomeResponsavel");
        List<Grupofamiliar> grupoFamiliarList = grupoFamiliarService.readByCriteria(parametro);
        model.addAttribute("grupoFamiliarList", grupoFamiliarList);
        return "secretariapromocao/grupofamiliar/listarGrupoFamiliar";
    }

    @RequestMapping("/excluirGrupo={id}")
    public String excluirUsuario(Model model, @PathVariable("id") Long id) throws Exception {
        GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        grupoFamiliarService.delete(id);
        return listarUsuario(model,0);
    }

    @RequestMapping("/alterarGrupo={id}")
    public String alterarGrupoFamiliar(Model model, @PathVariable("id") Long id) throws Exception {
        GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        Grupofamiliar grupoFamiliar = grupoFamiliarService.readById(id);
        model.addAttribute("grupoFamiliar", grupoFamiliar);
        return "secretariapromocao/grupofamiliar/formUpdateGrupoFamiliar";
    }

    @RequestMapping("/alterar={id}")
    public String atualizarGrupoFamiliar(Model model, @PathVariable("id") Long id, HttpServletRequest request) throws Exception {
        GrupoFamiliarService grupoFamiliarService = new GrupoFamiliarService();
        Grupofamiliar grupoFamiliar = grupoFamiliarService.readById(id);
        grupoFamiliar.setNomeresponsavel(request.getParameter("nome"));
        grupoFamiliar.setBairro(request.getParameter("bairro"));
        grupoFamiliar.setTelefone(request.getParameter("telefone"));
        grupoFamiliar.setStatus(request.getParameter("status"));
        grupoFamiliarService.update(grupoFamiliar);
        return listarUsuario(model,0);
    }
}
