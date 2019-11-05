/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Usuario;
import br.com.promocaosocial.model.service.UsuarioService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UsuarioController {
    
    @RequestMapping("/formCadastrarUsuario/id={Tipousuario}")
    public String getForm(@PathVariable("Tipousuario") String Tipousuario) throws Exception {
        UsuarioService us = new UsuarioService();
        Usuario usu = us.readById(3l);
        String parametro = "index";
        if ("Administrador".equals(Tipousuario)) {
            if ("Administrador".equals(usu.getTipousuario())) {
                parametro = "administrador/formCadastrarUsuarios";
            }
        }
        return parametro;
    }

    @RequestMapping(value = "formCadastrarUsuario/cadastrarUsuario", method = RequestMethod.POST)
    public String cadastrarUsuario(HttpServletRequest request) throws Exception {

        Usuario usuario = new Usuario();
        usuario.setNome(request.getParameter("usuario"));
        usuario.setLogin(request.getParameter("login"));
        usuario.setSenha(request.getParameter("senha"));
        usuario.setTipousuario(request.getParameter("tipoUsuario"));
        UsuarioService usuarioService = new UsuarioService();
        usuarioService.create(usuario);
        return "administrador/formCadastrarUsuarios";
    }

    @RequestMapping(value = "listarUsuario={first}", method = RequestMethod.GET)
    public String listarUsuariosCadastradas(Model model, @PathVariable("first") int first) throws Exception {
        UsuarioService usuarioService = new UsuarioService();
        int count = usuarioService.readByAll().size();
        if (count % 5 != 0) {
            count = count / 5 + 1;
        } else {
            count = count / 5;
        }
        model.addAttribute("count", count);
        model.addAttribute("first",first);
        List<Usuario> usuariosCadastradoList = usuarioService.readPaginator(first*5,5);
        model.addAttribute("usuariosCadastradoList", usuariosCadastradoList);
        
        
        return "administrador/listarUsuarios";
    }
    @RequestMapping("excluirUsuario/id={id}")
    public String excluirUsuarioCadastrado(Model model, @PathVariable("id") Long id) throws Exception{
        UsuarioService usuarioService = new UsuarioService();
        usuarioService.delete(id);
        List<Usuario> usuariosCadastradoList = usuarioService.readByAll();
        model.addAttribute("usuariosCadastradoList", usuariosCadastradoList);
        return "administrador/listarUsuarios";
    }

}
