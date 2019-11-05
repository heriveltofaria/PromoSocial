package br.com.promocaosocial.model.service;

import br.com.promocaosocial.model.Grupofamiliar;
import br.com.promocaosocial.model.connection.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

public class GrupoFamiliarService {

    public void create(Grupofamiliar grupoFamiliar) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.save(grupoFamiliar);
            Transaction tr = session.beginTransaction();
            tr.commit();
        }catch(Exception e){
            System.out.println("Deu ruim" + e);
        }finally{
            session.close();
        }
    }

    public void delete(Long id) throws Exception {
        Grupofamiliar grupoFamiliar = new Grupofamiliar();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.load(grupoFamiliar, id);
        session.delete(grupoFamiliar);
        Transaction tr = session.beginTransaction();

        tr.commit();
        session.close();
    }

    public List<Grupofamiliar> readByAll() throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Grupofamiliar> grupoFamiliarList = session.createQuery("from Grupofamiliar Order by nomeresponsavel").list();

        return grupoFamiliarList;
    }
    
    public List<Grupofamiliar> readPaginator(int first, int max) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Grupofamiliar> grupoFamiliarList = session.createQuery("from Grupofamiliar order by nomeresponsavel")
                .setMaxResults(max)
                .setFirstResult(first)
                .list();
        return grupoFamiliarList;
    }

    public void update(Grupofamiliar grupoFamiliar) throws Exception {

        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tr = session.beginTransaction();

        session.update(grupoFamiliar);
        tr.commit();
        session.close();
    }

    public Grupofamiliar readById(Long id) throws Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Grupofamiliar grupoFamiliar = (Grupofamiliar) session.get(Grupofamiliar.class, id);
        return grupoFamiliar;
    }

    public List<Grupofamiliar> readByCriteria(String nome) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Criteria crit = session.createCriteria(Grupofamiliar.class);
        crit.add(Restrictions.ilike("nomeresponsavel", nome, MatchMode.ANYWHERE));
        List<Grupofamiliar> grupoFamiliar = crit.list();
        return grupoFamiliar;

    }

    public List<Grupofamiliar> paginacao(int first, int maxResults) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query q = session.createQuery("from Grupofamiliar");
        q.setFirstResult(first);
        q.setMaxResults(maxResults);
        List<Grupofamiliar> grupoUsuario = q.list();
        return grupoUsuario;

    }

    public Long contador() {
        StringBuilder sbQuery = new StringBuilder();
        Session session = HibernateUtil.getSessionFactory().openSession();
        sbQuery.append("select count(*) from Grupofamiliar");
        //getSession, retorna a sessão do hibernate
        //Neste caso estou considerando que vc ja a possui
        Query query = session.createQuery(sbQuery.toString());
        Long count = (Long) query.uniqueResult();
        //O numero count, é o numero de registros que vc possui, para que vc possa fazer a paginação.
        return count;
    }
}
