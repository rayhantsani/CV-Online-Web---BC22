/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;

/**
 * This Interface for Controller's Class
 *
 * @author Rayhan
 * @param <E> is selected model
 */
public interface ControllerInterface<E> {

    /**
     * This Function is for update or insert
     *
     * @param model is object from E selected model
     * @return status (boolean), if update or insert success then true
     */
    public boolean saveOrEdit(E model);

    /**
     * This Function is for delete
     *
     * @param model is object from E selected model
     * @return status (boolean), if delete success then true
     */
    public boolean delete(E model);

    /**
     * This Function is for Get All Data
     *
     * @param model is object from E selected model
     * @return function to get all data from DAO
     */
    public List<E> getAll(E model);

    /**
     * This Function is for find Data by ID
     *
     * @param model is object from E selected model
     * @param id is keyword
     * @return function to get Data by ID from DAO
     */
    public E findById(E model, String id);

    /* This Function is for Get Data by Keyword
     *
     * @param model is object from E selected model
     * @param category is column name
     * @param id is keyword
     * @return function to get all data by keyword from DAO
     */
    public List<E> search(E model, String category, String id);

    /**
     * This Function is for find Max ID from Data
     *
     * @param model is object from E selected model
     * @return function to get max ID data from DAO
     */
    public E getMaxId(E model);
}
