package com.pdp.jakartastore.service.cart;

import com.pdp.jakartastore.entity.cart.Cart;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:30
 **/
public class CartServiceImpl implements CartService {
    @Override
    public Cart save(Cart entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Cart entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Cart findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Cart> findAll() {
        return dao.findAll();
    }
}
