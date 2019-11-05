package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Pessoasoficinas;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class PessoasOficinaService {

    public void create(Pessoasoficinas pessoasOficinas) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.save(pessoasOficinas);
        Transaction tr = session.beginTransaction();
        tr.commit();
        session.close();
    }

    public void delete(Long id) throws Exception {
        Pessoasoficinas pessoasOficinas = new Pessoasoficinas();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(pessoasOficinas, id);
        session.delete(pessoasOficinas);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Pessoasoficinas> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Pessoasoficinas> pessoasOficinasList = session.createQuery("from Pessoasoficinas order by oficinaescolhida").list();
        return pessoasOficinasList;
    }

    public List<Pessoasoficinas> readPaginator(int first, int max) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Pessoasoficinas> pessoasOficinasList = session.createQuery("from Pessoasoficinas order by oficinaescolhida")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return pessoasOficinasList;
    }

    public void update(Pessoasoficinas pessoasOficinas) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(pessoasOficinas);
        tr.commit();
        session.close();
    }

    public Pessoasoficinas readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Pessoasoficinas pessoasOficinas = (Pessoasoficinas) session.get(Pessoasoficinas.class, id);
        return pessoasOficinas;
    }

    public List<Pessoasoficinas> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Pessoasoficinas.class);
        crit.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE));
        List<Pessoasoficinas> pessoasOficinasList = crit.list();
        return pessoasOficinasList;

    }

    public List<Pessoasoficinas> readByOficina(String oficinaescolhida) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Pessoasoficinas.class);
        crit.add(Restrictions.ilike("oficinaescolhida", oficinaescolhida, MatchMode.ANYWHERE));
        List<Pessoasoficinas> pessoasOficinasList = crit.list();
        return pessoasOficinasList;

    }

}
