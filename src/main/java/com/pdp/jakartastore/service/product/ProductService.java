package com.pdp.jakartastore.service.product;

import com.pdp.jakartastore.dao.product.ProductDAO;
import com.pdp.jakartastore.entity.product.Product;
import com.pdp.jakartastore.service.BaseService;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:24
 **/
public interface ProductService extends BaseService<Product, String> {
    ProductDAO dao = new ProductDAO();

    boolean deleteForce(String productId);

    List<Product> findByShopId(String shopId);
}
