package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Servicosprestados;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;


public class ServicoPrestadoService {
      public void create(Servicosprestados servicosPrestados) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();

        session.save(servicosPrestados);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Servicosprestados servicosPrestados = new Servicosprestados();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(servicosPrestados, id);
        session.delete(servicosPrestados);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Servicosprestados> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Servicosprestados> servicosPrestadosList = session.createQuery("from Servicosprestados order by id").list();
        return servicosPrestadosList;
    }
    
     public List<Servicosprestados> readPaginator(int first, int max) {
         Session session = HibernateUtil.getSessionFactory().openSession();
         List<Servicosprestados> servicosPrestadosList = session.createQuery("from Servicosprestados order by id")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return servicosPrestadosList;
    }

    public void update(Servicosprestados servicosPrestados) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(servicosPrestados);
        tr.commit();
        session.close();
    }

    public Servicosprestados readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Servicosprestados servicosPrestados = (Servicosprestados) session.get(Servicosprestados.class, id);
        return servicosPrestados;
    }

    public List<Servicosprestados> readByCriteria(String mesreferencia) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Servicosprestados.class);
        crit.add(Restrictions.ilike("mesreferencia", mesreferencia, MatchMode.ANYWHERE));
        List<Servicosprestados> servicosPrestadosList = crit.list();
        return servicosPrestadosList;

    }
}
