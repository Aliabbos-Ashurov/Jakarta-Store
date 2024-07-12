package com.pdp.jakartastore.dao.product;

import com.pdp.jakartastore.dao.BaseDAO;
import com.pdp.jakartastore.entity.product.Product;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:02
 **/
public class ProductDAO extends BaseDAO<Product, String> {
    public List<Product> findAllByNamedQuery() {
        begin();
        List<Product> resultList = entityManager.createNamedQuery("Product.all", Product.class).getResultList();
        commit();
        return resultList;
    }
}
