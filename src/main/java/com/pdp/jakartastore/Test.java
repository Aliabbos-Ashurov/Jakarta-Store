package com.pdp.jakartastore;

import com.pdp.jakartastore.entity.product.Product;
import com.pdp.jakartastore.entity.upload.Upload;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.UUID;


/**
 * @author Aliabbos Ashurov
 * @since 09/July/2024  09:24
 **/
public class Test {
    public static void main(String[] args) {
        EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("jakarta_store");
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        Upload upload = Upload.builder()
                .fileName("watch")
                .fileType("png")
                .extension("../../resources/img/")
                .generatedName(UUID.randomUUID().toString())
                .build();
        entityManager.persist(upload);
        entityManager.persist(Product.builder()
                .name("Apple Watch Series 8")
                .price(899)
                .category("TECHNOLOGY")
                .description("Apple Watch 9 поставляются в привычной минималистичной упаковке из твердого белого картона. Внутри находится:\n" +
                        "Apple Watch Series 9\n" +
                        "Магнитное зарядное устройство с поддержкой 18 Вт\n" +
                        "Силиконовый ремешок")
                .image(upload)
                .build());
        entityManager.getTransaction().commit();
    }
}
