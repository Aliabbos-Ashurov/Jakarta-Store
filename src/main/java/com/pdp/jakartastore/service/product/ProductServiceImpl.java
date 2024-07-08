package com.pdp.jakartastore.service.product;

import com.pdp.jakartastore.entity.product.Product;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:24
 **/
public class ProductServiceImpl implements ProductService {
    @Override
    public Product save(Product entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Product entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Product findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Product> findAll() {
        return dao.findAll();
    }
}
