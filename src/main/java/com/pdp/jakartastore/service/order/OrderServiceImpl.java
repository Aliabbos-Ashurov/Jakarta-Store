package com.pdp.jakartastore.service.order;

import com.pdp.jakartastore.entity.order.Order;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:29
 **/
public class OrderServiceImpl implements OrderService {
    @Override
    public Order save(Order entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Order entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Order findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Order> findAll() {
        return dao.findAll();
    }
}
