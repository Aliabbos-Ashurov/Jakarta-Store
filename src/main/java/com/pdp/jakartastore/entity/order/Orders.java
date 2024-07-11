package com.pdp.jakartastore.entity.order;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.cart.Cart;
import com.pdp.jakartastore.entity.product.Product;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.util.List;

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
public class Orders extends BaseEntity {

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Cart cart;

    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Product product;

    @Column(nullable = false)
    private Integer quantity;
}
