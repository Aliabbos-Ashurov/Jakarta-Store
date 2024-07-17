package com.pdp.jakartastore.service.shop;

import com.pdp.jakartastore.entity.shop.Shop;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Aliabbos Ashurov
 * @since 10/July/2024  10:19
 **/
public class ShopServiceImpl implements ShopService {

    @Override
    public List<Shop> getWaitingShops() {
        return dao.getWaitingShops();
    }

    @Override
    public List<Shop> getShops() {
        List<Shop> shops = dao.getShops();
        List<Shop> active = shops.stream()
                .filter(shop -> shop.getStatus().equals(Shop.Status.ACTIVE))
                .collect(Collectors.toList());
        List<Shop> notActive = shops.stream()
                .filter(shop -> shop.getStatus().equals(Shop.Status.NOT_ACTIVE))
                .collect(Collectors.toList());
        notActive.addAll(active);
        return notActive;
    }

    @Override
    public List<Shop> getByFilter() {
        List<Shop> shops = findAll();
        List<Shop> active = shops.stream()
                .filter(shop -> shop.getStatus().equals(Shop.Status.ACTIVE))
                .collect(Collectors.toList());
        List<Shop> notActive = shops.stream()
                .filter(shop -> shop.getStatus().equals(Shop.Status.NOT_ACTIVE))
                .collect(Collectors.toList());
        notActive.addAll(active);
        return notActive;
    }

    @Override
    public List<Shop> getSellerShops(String sellerId) {
        List<Shop> shops = findAll();
        return shops.stream()
                .filter(shop -> shop.getOwner().getId().equals(sellerId) && !shop.getStatus().equals(Shop.Status.WAITING))
                .collect(Collectors.toList());
    }

    @Override
    public Shop save(Shop shop) {
        return dao.save(shop);
    }

    @Override
    public boolean update(Shop shop) {
        return dao.update(shop);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Shop findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Shop> findAll() {
        return dao.findAll();
    }
}
