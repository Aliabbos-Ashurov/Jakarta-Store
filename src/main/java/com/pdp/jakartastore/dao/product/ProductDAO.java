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

    @SuppressWarnings("unchecked")
    public List<String> getCategories() {
        begin();
        List<String> resultList = entityManager.createNativeQuery("SELECT DISTINCT p.category FROM product p", String.class).getResultList();
        commit();
        return resultList;
    }

    public List<Product> getProductsByPriceRange(int low, int max) {
        begin();
        List<Product> resultList = entityManager.createQuery("SELECT p FROM Product p WHERE p.price BETWEEN :low AND :max", Product.class)
                .setParameter("low", low)
                .setParameter("max", max)
                .getResultList();
        commit();
        return resultList;
    }

    public List<Product> getProductsByPriceRangeAndCategory(int low, int max, String category) {
        begin();
        List<Product> resultList = entityManager.createQuery(
                        "SELECT p FROM Product p WHERE p.price BETWEEN :low AND :max AND p.category = :category", Product.class)
                .setParameter("low", low)
                .setParameter("max", max)
                .setParameter("category", category)
                .getResultList();
        commit();
        return resultList;
    }
}
