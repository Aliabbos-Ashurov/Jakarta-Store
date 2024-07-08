package com.pdp.jakartastore.service.order;

import com.pdp.jakartastore.dao.OrderDAO;
import com.pdp.jakartastore.entity.order.Order;
import com.pdp.jakartastore.service.BaseService;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:28
 **/
public interface OrderService extends BaseService<Order, String> {
    OrderDAO dao = new OrderDAO();
}
