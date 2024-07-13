package com.pdp.jakartastore.service.product;

import com.pdp.jakartastore.entity.product.Product;
import com.pdp.jakartastore.service.upload.UploadService;
import com.pdp.jakartastore.service.upload.UploadServiceImpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:24
 **/
public class ProductServiceImpl implements ProductService {
    private final UploadService uploadService = new UploadServiceImpl();

    @Override
    public List<Product> findAllByNamedQuery() {
        return dao.findAllByNamedQuery();
    }

    @Override
    public List<Product> getProductsByPriceRange(int low, int max) {
        return dao.getProductsByPriceRange(low, max);
    }

    @Override
    public List<Product> getProductsByPriceRangeAndCategory(int low, int max, String category) {
        return dao.getProductsByPriceRangeAndCategory(low, max, category);
    }

    @Override
    public List<String> getCategories() {
        return dao.getCategories();
    }

    @Override
    public boolean deleteForce(String productId) {
        List<Product> all = findAll();
        Optional<Product> optional = all.stream()
                .filter(product -> product.getId().equals(productId))
                .findFirst();
        if (optional.isPresent()) {
            Product product = optional.get();
            if (delete(product.getId())) {
                return uploadService.delete(product.getImage().getId());
            }
        }
        return false;
    }

    @Override
    public List<Product> findByShopId(String shopId) {
        List<Product> products = findAll();
        return products.stream()
                .filter(product -> product.getShop().getId().equals(shopId))
                .collect(Collectors.toList());
    }

    @Override
    public Product save(Product entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Product entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Product findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Product> findAll() {
        return dao.findAll();
    }
}
