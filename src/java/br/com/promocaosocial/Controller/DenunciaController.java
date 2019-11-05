/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Denunciabolsa;
import br.com.promocaosocial.model.Denunciaconselho;
import br.com.promocaosocial.model.service.DenunciaBolsaService;
import br.com.promocaosocial.model.service.DenunciaConselhoService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DenunciaController {

    @RequestMapping("/denuncia")
    public String formDenuncia() {
        return "/formDenuncia";
    }

    @RequestMapping(value = "CadastrarDenuncia", method = RequestMethod.POST)
    public String cadastrarDenuncia(HttpServletRequest request) throws Exception {
        String parametro = request.getParameter("tipoDenuncia");
        if (parametro.equals("BolsaFamilia")) {
            Denunciabolsa denunciaBolsa = new Denunciabolsa();
            denunciaBolsa.setNome(request.getParameter("nome"));
            denunciaBolsa.setEmail(request.getParameter("email"));
            denunciaBolsa.setTelefone(request.getParameter("telefone"));
            denunciaBolsa.setDescricao(request.getParameter("descricao").trim().replace("", " "));
            denunciaBolsa.setTipo("Bolsa Família");
            denunciaBolsa.setAnalise("em analise...");
            if (denunciaBolsa.getDescricao() != " ") {
                DenunciaBolsaService denunciaService = new DenunciaBolsaService();
                denunciaService.create(denunciaBolsa);
            }

        } else if (parametro.equals("ConselhoTutelar")) {
            Denunciaconselho denunciaConselho = new Denunciaconselho();
            denunciaConselho.setNome(request.getParameter("nome"));
            denunciaConselho.setEmail(request.getParameter("email"));
            denunciaConselho.setTelefone(request.getParameter("telefone"));
            denunciaConselho.setDescricao(request.getParameter("descricao"));
            denunciaConselho.setTipo("Conselho Tutelar");
            denunciaConselho.setAnalise("em analise...");
            DenunciaConselhoService denunciaService = new DenunciaConselhoService();
            denunciaService.create(denunciaConselho);
        }
        return "/formDenuncia";
    }

    @RequestMapping("/listDenuncias/usuario={tipoUsuario}/{first}")
    public String listarDenuncias(Model model, @PathVariable String tipoUsuario, @PathVariable("first") int first) throws Exception {
        if ("Conselheiro Tutelar".equals(tipoUsuario) || "Secretária da Promoção".equals(tipoUsuario)) {
            DenunciaConselhoService denunciaConselhoService = new DenunciaConselhoService();
            int count = denunciaConselhoService.readByAll().size();
            if (count % 5 != 0) {
                count = count / 5 + 1;
            } else {
                count = count / 5;
            }
            model.addAttribute("count", count);
            model.addAttribute("first", first);
            List<Denunciaconselho> denuncia = denunciaConselhoService.readPaginator(first * 5, 5);
            model.addAttribute("denuncia", denuncia);
        } else if ("Assistente Bolsa Família".equals(tipoUsuario) || "Secretária da Promoção".equals(tipoUsuario)) {
            DenunciaBolsaService denunciaBolsaService = new DenunciaBolsaService();
            int count = denunciaBolsaService.readByAll().size();
            if (count % 5 != 0) {
                count = count / 5 + 1;
            } else {
                count = count / 5;
            }
            model.addAttribute("count", count);
            model.addAttribute("first", first);
            List<Denunciabolsa> denuncia = denunciaBolsaService.readPaginator(first * 5, 5);
            model.addAttribute("denuncia", denuncia);
        }

        return "secretariapromocao/denuncia/listarDenuncias";
    }

    @RequestMapping("/alterarDenunciaConselho={id}")
    public String alterarDenuncia(Model model, @PathVariable Long id) throws Exception {
        DenunciaConselhoService denunciaConselhoService = new DenunciaConselhoService();
        Denunciaconselho denuncia = denunciaConselhoService.readById(id);
        model.addAttribute("denuncia", denuncia);

        return "secretariapromocao/denuncia/formUpdateDenuncia";
    }

    @RequestMapping(value = "AtualizarDenunciaConselho={id}", method = RequestMethod.POST)
    public String alterarDenunciaConselho(@PathVariable("id") Long id, HttpServletRequest request, Model model) throws Exception {

        Denunciaconselho denunciaConselho = new Denunciaconselho();
        denunciaConselho.setId(id);
        denunciaConselho.setNome(request.getParameter("nome"));
        denunciaConselho.setEmail(request.getParameter("email"));
        denunciaConselho.setTelefone(request.getParameter("telefone"));
        if (!(request.getParameter("descricao").isEmpty())) {
            denunciaConselho.setDescricao(request.getParameter("descricao"));
        }
        denunciaConselho.setAnalise(request.getParameter("analise"));

        DenunciaConselhoService denunciaService = new DenunciaConselhoService();
        denunciaService.update(denunciaConselho);

        listarDenuncias(model, "Conselheiro Tutelar",0);

        return "secretariapromocao/denuncia/listarDenuncias";
    }
    @RequestMapping(value = "/excluirDenuncia={id}")
    public String excluirDenuncia(@PathVariable("id") Long id) throws Exception{
         DenunciaConselhoService denunciaService = new DenunciaConselhoService();
         denunciaService.delete(id);
        return "secretariapromocao/denuncia/listarDenuncias";
    }
}
