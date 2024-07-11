package com.pdp.jakartastore.service.cart;

import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.service.user.UserService;
import com.pdp.jakartastore.service.user.UserServiceImpl;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:30
 **/
public class CartServiceImpl implements CartService {
    private final UserService userService = new UserServiceImpl();

    @Override
    public Cart getOrCreate(String userId) {
        List<Cart> cartList = findAll();
        return cartList.stream()
                .filter(cart -> cart.getUsers().getId().equals(userId) && !cart.isPaid())
                .findFirst().orElse(
                        Cart.builder()
                                .users(userService.findById(userId))
                                .build()
                );
    }

    @Override
    public List<Cart> findByUserId(String userId) {
        List<Cart> all = dao.findAll();
        return all.stream()
                .filter(cart -> cart.getUsers().getId().equals(userId))
                .collect(Collectors.toList());
    }

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
