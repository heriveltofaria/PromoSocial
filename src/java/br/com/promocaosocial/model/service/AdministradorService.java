package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Administrador;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class AdministradorService {
    public void create(Administrador administrador) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.save(administrador);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Administrador adminnistrador = new Administrador();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(adminnistrador, id);
        session.delete(adminnistrador);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Administrador> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Administrador> administradorList = session.createQuery("from Administrador").list();
        return administradorList;
    }

    public void update(Administrador administrador) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(administrador);
        tr.commit();
        session.close();
    }

    public Administrador readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Administrador adminnnistrador = (Administrador) session.get(Administrador.class, id);
        return adminnnistrador;
    }

    public List<Administrador> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Administrador.class);
        crit.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE));
        List<Administrador> administradorList = crit.list();
        return administradorList;

    }
}
