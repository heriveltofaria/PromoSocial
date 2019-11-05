package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Denunciaconselho;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class DenunciaConselhoService {

    public void create(Denunciaconselho denunciaConselho) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.save(denunciaConselho);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Denunciaconselho denunciaConselho = new Denunciaconselho();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(denunciaConselho, id);
        session.delete(denunciaConselho);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Denunciaconselho> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Denunciaconselho> denunciaConselhoList = session.createQuery("from Denunciaconselho").list();
        return denunciaConselhoList;
    }

    public List<Denunciaconselho> readPaginator(int first, int max) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Denunciaconselho> denunciaConselhoList = session.createQuery("from Denunciaconselho")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return denunciaConselhoList;
    }

    public void update(Denunciaconselho denunciaConselho) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(denunciaConselho);
        tr.commit();
        session.close();
    }

    public Denunciaconselho readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Denunciaconselho denunciaConselho = (Denunciaconselho) session.get(Denunciaconselho.class, id);
        return denunciaConselho;
    }

    public List<Denunciaconselho> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Denunciaconselho.class);
        crit.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE));
        List<Denunciaconselho> denunciaConselhoList = crit.list();
        return denunciaConselhoList;

    }
}
