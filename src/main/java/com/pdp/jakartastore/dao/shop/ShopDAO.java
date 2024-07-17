package com.pdp.jakartastore.dao.shop;

import com.pdp.jakartastore.dao.BaseDAO;
import com.pdp.jakartastore.entity.shop.Shop;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 10/July/2024  10:18
 **/
public class ShopDAO extends BaseDAO<Shop, String> {
    public List<Shop> getWaitingShops() {
        begin();
        List<Shop> resultList = entityManager.createQuery("SELECT s FROM Shop s WHERE s.status = 'WAITING'", Shop.class).getResultList();
        commit();
        return resultList;
    }

    @SuppressWarnings("unchecked")
    public List<Shop> getShops() {
        begin();
        List<Shop> resultList = entityManager.createNativeQuery(
                "SELECT * FROM Shop WHERE status = 'ACTIVE' OR status = 'NOT_ACTIVE'", Shop.class
        ).getResultList();
        commit();
        return resultList;
    }
}
