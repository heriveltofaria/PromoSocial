/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Administrador;
import br.com.promocaosocial.model.service.AdministradorService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author body8
 */
@Controller
public class EdicaoSite {

    @RequestMapping("/editarSite")
    public String getDasboardEditar(Model model) throws Exception {
        AdministradorService administradorService = new AdministradorService();
        List<Administrador> administradorList = administradorService.readByAll();
        model.addAttribute("administradorList", administradorList);
        return "site/editarSite";
    }

    @RequestMapping(value = "salvarEdicao", method = RequestMethod.POST)
    public String salvarEdicao(Model model, HttpServletRequest request) throws Exception {
        AdministradorService admService = new AdministradorService();
        Administrador administrador = admService.readById(1l);
        administrador.setSlide1a(request.getParameter("slide1a"));
        administrador.setSlide1b(request.getParameter("slide1b")); 
        administrador.setSlide2a(request.getParameter("slide2a"));
        administrador.setSlide2b(request.getParameter("slide2b"));     
        admService.update(administrador);
        return "index";
    }

}
