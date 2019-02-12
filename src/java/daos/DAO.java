/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 * This class is General class DAO
 *
 * @author Rayhan
 * @param <E> is general object for selected Model
 */
public class DAO<E> implements DAOInterface<E> {

    private Session session;
    private Transaction transaction;

    public DAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    private SessionFactory sessionFactory;

    /**
     * Overriding method function from DAO Interface with function to save or
     * update, delete, getAll, getById and Search
     *
     * @param model, entity/model variable input
     * @param option, save or update if = 1, delete if = 2, getAll if = 3,
     * getById if = 4, search if = 5
     * @param category search category for search purpose
     * @param search input string for getById purpose
     * @return list with entity variable with content varying with option
     */
    @Override
    public List<E> function(E model, int option, String category, String search) {
        List<E> data = new ArrayList<E>();
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            if (option == 1) {
                session.saveOrUpdate(model);
            } else if (option == 2) {
                session.delete(model);
            } else if (option == 3) {
                data = session.
                        createQuery("from " + model.getClass()
                                .getName() + " order by id ").list();
            } else if (option == 4) {
                data = session.createCriteria(model.getClass())
                        .add(Restrictions.eq("id", search)).addOrder(Order.asc("id")).list();

            } else if (option == 5) {
                data = session.createCriteria(model.getClass())
                        .add(Restrictions.ilike(category, search, MatchMode.ANYWHERE))
                        .addOrder(Order.asc("id")).list();
            }

            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return data;
    }

    /**
     * This function is for get maximum ID from selected model
     *
     * @param model is depends on selected model
     * @return object i from selected model
     */
    @Override
    public E getMaxId(E model) {
        E i = null;
        try {
            session = sessionFactory.openSession();
            transaction = session.beginTransaction();
            i = (E) session.createQuery("from " + model.getClass().getName() + " "
                    + "where id = (select max(id) from  " + model.getClass().
                            getName() + " ) ").list().get(0);
        } catch (Exception e) {
            e.printStackTrace();
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return i;
    }
}
