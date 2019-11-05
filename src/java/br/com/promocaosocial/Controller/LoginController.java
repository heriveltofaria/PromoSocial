package br.com.promocaosocial.Controller;

import br.com.promocaosocial.model.Administrador;
import br.com.promocaosocial.model.Oficina;
import br.com.promocaosocial.model.Usuario;
import br.com.promocaosocial.model.service.AdministradorService;
import br.com.promocaosocial.model.service.OficinaService;
import br.com.promocaosocial.model.service.UsuarioService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/index")
    public String getIndex(HttpSession session, Model model) throws Exception {
        Usuario usuario = null;
        session.setAttribute("usuarioLogado", usuario);
        AdministradorService administradorService = new AdministradorService();
        List<Administrador> administradorList = administradorService.readByAll();
        model.addAttribute("administradorList", administradorList);
        return "index";
    }

    @RequestMapping("/sobre")
    public String getSobre() {
        return "sobre";
    }

    @RequestMapping("/loginAutenticacao")
    public String getLogin(HttpServletRequest request, HttpSession session, Model model) throws Exception {
        Usuario usu = new Usuario();
        String parametro = null;
        usu.setLogin(request.getParameter("login"));
        usu.setSenha(request.getParameter("password"));
        UsuarioService us = new UsuarioService();
        List<Usuario> usuarioList = us.readByAll();
        for (Usuario usuario : usuarioList) {
            if (usuario.getLogin().equals(usu.getLogin()) && usuario.getSenha().equals(usu.getSenha())) {
                if ("Psicóloga".equals(usuario.getTipousuario())) {
                    session.setAttribute("usuarioLogado", usuario);
                    parametro = "secretariapromocao/grupofamiliar/dashboardCras";
                } else if ("Assistente Social".equals(usuario.getTipousuario())) {
                    session.setAttribute("usuarioLogado", usuario);
                    parametro = "secretariapromocao/grupofamiliar/dashboardCras";
                } else if ("Administrador".equals(usuario.getTipousuario())) {
                    session.setAttribute("usuarioLogado", usuario);
                    parametro = "administrador/dasboardAdministrador";
                } else if ("Conselheiro Tutelar".equals(usuario.getTipousuario())) {
                    session.setAttribute("usuarioLogado", usuario);
                    parametro = "secretariapromocao/denuncia/conselhotutelar/dasboardConselhoTutelar";
                } else if ("Assistente Bolsa Família".equals(usuario.getTipousuario())) {
                    session.setAttribute("usuarioLogado", usuario);
                    parametro = "secretariapromocao/denuncia/bolsafamilia/dashboardBolsaFamilia";
                } else if ("Secretária da Promoção".equals(usuario.getTipousuario())) {
                    session.setAttribute("usuarioLogado", usuario);
                    parametro = "secretariapromocao/dashboardSecretariaAssistenciaSocial";
                }
            }
        }
        return parametro;
    }

    @RequestMapping("/voltarDashboard={tipoUsuario}")
    public String getDashboard(@PathVariable String tipoUsuario) {
        String parametro = null;
        if (null != tipoUsuario) {
            switch (tipoUsuario) {
                case "Psicóloga":
                    parametro = "secretariapromocao/grupofamiliar/dashboardCras";
                    break;
                case "Assistente Social":
                    parametro = "secretariapromocao/grupofamiliar/dashboardCras";
                    break;
                case "Administrador":
                    parametro = "administrador/dasboardAdministrador";
                    break;
                case "Conselheiro Tutelar":
                    parametro = "secretariapromocao/denuncia/conselhotutelar/dasboardConselhoTutelar";
                    break;
                case "Assistente Bolsa Família":
                    parametro = "secretariapromocao/grupofamiliar/bolsafamilia/dashboardBolsaFamilia";
                    break;
                case "Secretária da Promoção":
                    parametro = "secretariapromocao/dashboardSecretariaAssistenciaSocial";
                    break;
                default:
                    parametro = "index";
                    break;
            }
        }
        return parametro;
    }

    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:index";
    }
}
