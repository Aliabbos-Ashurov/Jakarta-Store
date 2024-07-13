package com.pdp.jakartastore.service.shop;

import com.pdp.jakartastore.dao.shop.ShopDAO;
import com.pdp.jakartastore.entity.shop.Shop;
import com.pdp.jakartastore.service.BaseService;
import jakarta.validation.constraints.NotBlank;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 10/July/2024  10:19
 **/
public interface ShopService extends BaseService<Shop, String> {
    ShopDAO dao = new ShopDAO();

    List<Shop> getSellerShops(@NotBlank String sellerId);

    List<Shop> getByFilter();
}
