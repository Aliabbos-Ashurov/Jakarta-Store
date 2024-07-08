package com.pdp.jakartastore.entity.order;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.entity.product.Product;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.*;
import lombok.experimental.SuperBuilder;

/**
 * @author Aliabbos Ashurov
 * @since 07/July/2024  15:06
 **/
@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
public class Order extends BaseEntity {

    @ManyToOne
    private Cart cart;

    @ManyToOne
    private Product product;

    @Builder.Default
    @Column(nullable = false)
    private Integer quantity = 1;
}
