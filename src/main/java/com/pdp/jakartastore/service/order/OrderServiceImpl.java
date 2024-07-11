package com.pdp.jakartastore.service.order;

import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.entity.order.Orders;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:29
 **/
public class OrderServiceImpl implements OrderService {

    @Override
    public Orders getOrCreate(Orders order, Cart cart) {
        List<Orders> orders = findAll();

        Optional<Orders> existingOrder = orders.stream()
                .filter(o -> o.getProduct().getId().equals(order.getProduct().getId())
                        && o.getCart().getId().equals(cart.getId())
                        && !cart.isPaid())
                .findFirst();

        if (existingOrder.isPresent()) {
            Orders foundOrder = existingOrder.get();
            foundOrder.setQuantity(foundOrder.getQuantity() + order.getQuantity());
            return foundOrder;
        } else {
            save(order);
            return order;
        }
    }

    @Override
    public List<Orders> getOrdersByCartId(String cartId) {
        List<Orders> orders = findAll();
        return orders.stream()
                .filter(ord -> ord.getCart().getId().equals(cartId))
                .collect(Collectors.toList());
    }

    @Override
    public Orders save(Orders entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Orders entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Orders findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Orders> findAll() {
        return dao.findAll();
    }
}
