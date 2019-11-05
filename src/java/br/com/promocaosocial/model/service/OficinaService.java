package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Oficina;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class OficinaService {
      public void create(Oficina oficina) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.save(oficina);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Oficina oficina = new Oficina();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(oficina, id);
        session.delete(oficina);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Oficina> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Oficina> oficinaList = session.createQuery("from Oficina order by nome").list();
        return oficinaList;
    }
    public List<Oficina> readPaginator(int first, int max) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        List<Oficina> oficinasList = session.createQuery("from Oficina order by nome")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return oficinasList;
    }

    public void update(Oficina oficina) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(oficina);
        tr.commit();
        session.close();
    }

    public Oficina readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Oficina oficina = (Oficina) session.get(Oficina.class, id);
        return oficina;
    }

    public List<Oficina> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Oficina.class);
        crit.add(Restrictions.ilike("nome", nome, MatchMode.EXACT));
        List<Oficina> oficinaList = crit.list();
        return oficinaList;

    }

    
}
