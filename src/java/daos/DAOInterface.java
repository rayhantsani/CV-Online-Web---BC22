/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 * This Interface for DAO's class
 *
 * @author Rayhan
 * @param <E> is selected model
 */
public interface DAOInterface<E> {

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
    public List<E> function(E model, int option, String category, String search);

    /**
     * This function is for get maximum ID from selected model
     *
     * @param model is depends on selected model
     * @return object i from selected model
     */
    public E getMaxId(E model);

}
