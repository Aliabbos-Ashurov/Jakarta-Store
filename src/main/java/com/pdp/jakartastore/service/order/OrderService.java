package com.pdp.jakartastore.service.order;

import com.pdp.jakartastore.dao.order.OrderDAO;
import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.entity.order.Orders;
import com.pdp.jakartastore.service.BaseService;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:28
 **/
public interface OrderService extends BaseService<Orders, String> {
    OrderDAO dao = new OrderDAO();

    List<Orders> getOrdersByCartId(String cartId);

    Orders getOrCreate(Orders order, Cart cart);
}
