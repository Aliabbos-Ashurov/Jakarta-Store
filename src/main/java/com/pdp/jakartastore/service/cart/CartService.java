package com.pdp.jakartastore.service.cart;

import com.pdp.jakartastore.dao.CartDAO;
import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.service.BaseService;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:29
 **/
public interface CartService extends BaseService<Cart, String> {
    CartDAO dao = new CartDAO();
}
