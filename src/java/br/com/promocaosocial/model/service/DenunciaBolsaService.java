package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Denunciabolsa;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class DenunciaBolsaService {

    public void create(Denunciabolsa denunciaBolsa) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.save(denunciaBolsa);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Denunciabolsa denunciaBolsa = new Denunciabolsa();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(denunciaBolsa, id);
        session.delete(denunciaBolsa);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Denunciabolsa> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Denunciabolsa> denunciaBolsaList = session.createQuery("from Denunciabolsa").list();
        return denunciaBolsaList;
    }

    public List<Denunciabolsa> readPaginator(int first, int max) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Denunciabolsa> denunciaBolsaList = session.createQuery("from Denunciabolsa")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return denunciaBolsaList;
    }

    public void update(Denunciabolsa denunciaBolsa) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(denunciaBolsa);
        tr.commit();
        session.close();
    }

    public Denunciabolsa readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Denunciabolsa denunciaBolsa = (Denunciabolsa) session.get(Denunciabolsa.class, id);
        return denunciaBolsa;
    }

    public List<Denunciabolsa> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Denunciabolsa.class);
        crit.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE));
        List<Denunciabolsa> denunciaBolsaList = crit.list();
        return denunciaBolsaList;

    }
}
