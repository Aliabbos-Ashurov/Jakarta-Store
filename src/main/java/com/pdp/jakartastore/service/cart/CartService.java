package com.pdp.jakartastore.service.cart;

import com.pdp.jakartastore.dao.cart.CartDAO;
import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.service.BaseService;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:29
 **/
public interface CartService extends BaseService<Cart, String> {
    CartDAO dao = new CartDAO();

    List<Cart> findByUserId(String userId);
    Cart getOrCreate(String userId);
}
