package com.pdp.jakartastore.service;

import com.pdp.jakartastore.entity.BaseEntity;

import java.io.Serializable;
import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  09:36
 **/
public interface BaseService<T extends BaseEntity, ID extends Serializable> {

    T save(T entity);

    boolean update(T entity);

    boolean delete(ID id);

    T findById(ID id);

    List<T> findAll();
}
