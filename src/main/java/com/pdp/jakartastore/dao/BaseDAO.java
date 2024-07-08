package com.pdp.jakartastore.dao;

import com.pdp.jakartastore.entity.BaseEntity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import lombok.NonNull;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * Base DAO class for CRUD operations
 *
 * @author Aliabbos Ashurov
 * @since 07/July/2024  16:20
 **/
public abstract class BaseDAO<T extends BaseEntity, ID extends Serializable> {

    private static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("jakarta_store");
    protected static final EntityManager entityManager = entityManagerFactory.createEntityManager();

    private final Class<T> persistenceClass;

    @SuppressWarnings("unchecked")
    protected BaseDAO() {
        this.persistenceClass = (Class<T>) (((ParameterizedType) getClass().getGenericSuperclass())
                .getActualTypeArguments()[0]);
    }

    public T save(@NonNull T entity) {
        begin();
        entityManager.persist(entity);
        commit();
        return entity;
    }

    public boolean update(@NonNull T entity) {
        begin();
        entityManager.merge(entity);
        commit();
        return true;
    }

    public boolean delete(@NonNull ID id) {
        begin();
        entityManager.remove(entityManager.find(persistenceClass, id));
        commit();
        return true;
    }

    public T findById(@NonNull ID id) {
        return entityManager.find(persistenceClass, id);
    }

    @SuppressWarnings("unchecked")
    public List<T> findAll() {
        begin();
        List<T> resultList = (List<T>) entityManager.createQuery("from " + persistenceClass.getSimpleName()).getResultList();
        commit();
        return resultList;
    }


    protected void begin() {
        entityManager.getTransaction().begin();
    }

    protected void commit() {
        entityManager.getTransaction().commit();
    }

    protected void rollBack() {
        entityManager.getTransaction().rollback();
    }
}
