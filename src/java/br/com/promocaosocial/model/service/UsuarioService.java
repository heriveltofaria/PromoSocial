package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Usuario;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class UsuarioService {
      public void create(Usuario usuario) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.save(usuario);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Usuario usuario = new Usuario();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(usuario, id);
        session.delete(usuario);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Usuario> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Usuario> usuarioList = session.createQuery("from Usuario order by id").list();
        return usuarioList;
    }
    public List<Usuario> readPaginator(int first, int max) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Usuario> usuList = session.createQuery("from Usuario order by id")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return usuList;
    }

    public void update(Usuario usuario) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(usuario);
        tr.commit();
        session.close();
    }

    public Usuario readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Usuario usuario = (Usuario) session.get(Usuario.class, id);
        return usuario;
    }

    public List<Usuario> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Usuario.class);
        crit.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE));
        List<Usuario> usuarioList = crit.list();
        return usuarioList;

    }
    public Usuario readByLogin(String tipoUsuario) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Usuario usuario = (Usuario) session.get(Usuario.class,tipoUsuario);
        return usuario;

    }

    
}
