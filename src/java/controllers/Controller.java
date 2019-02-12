/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAO;
import daos.DAOInterface;
import java.util.List;
import org.hibernate.SessionFactory;

/**
 * This class is Generic controller
 *
 * @author Rayhan
 * @param <E> is selected model
 */
public class Controller<E> implements ControllerInterface<E> {

    private DAOInterface<E> dao;

    public Controller(SessionFactory sessionFactory) {
        this.dao = new DAO(sessionFactory);
    }

    /**
     * This Function is for update or insert
     *
     * @param model is object from E selected model
     * @return status (boolean), if update or insert success then true
     */
    @Override
    public boolean saveOrEdit(E model) {
        boolean status = false;
        try {
            dao.function(model, 1,"", "");
            status = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return status;
    }

    /**
     * This Function is for delete
     *
     * @param model is object from E selected model
     * @return status (boolean), if delete success then true
     */
    @Override
    public boolean delete(E model) {
        boolean status = false;
        try {
            dao.function(model, 2,"", "");
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    /**
     * This Function is for Get All Data
     *
     * @param model is object from E selected model
     * @return function to get all data from DAO
     */
    @Override
    public List<E> getAll(E model) {
        return dao.function(model, 3,"", "");
    }

    /**
     * This Function is for find Data by ID
     *
     * @param model is object from E selected model
     * @param id is keyword
     * @return function to get Data by ID from DAO
     */
    @Override
    public E findById(E model, String id) {
        return (E) dao.function(model, 4,"", id).get(0);
    }

    /**
     * This Function is for find Max ID from Data
     *
     * @param model is object from E selected model
     * @return function to get max ID data from DAO
     */
    @Override
    public E getMaxId(E model) {
        return (E) dao.getMaxId(model);
    }

    /**
     * This Function is for Get Data by Keyword
     *
     * @param model is object from E selected model
     * @param category is column name
     * @param id is keyword
     * @return function to get all data by keyword from DAO
     */
    @Override
    public List<E> search(E model, String category, String id){
        return (List<E>) dao.function(model, 5, category, id);
    }

}
