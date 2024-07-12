package com.pdp.jakartastore.entity.product;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.shop.Shop;
import com.pdp.jakartastore.entity.upload.Upload;
import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import lombok.*;
import lombok.experimental.SuperBuilder;


/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  15:18
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
@SuperBuilder(toBuilder = true)
public class Product extends BaseEntity {

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false)
    @Min(value = 100)
    private double price;

    @Column(nullable = false, columnDefinition = "text")
    private String description;

    @Column(nullable = false)
    private String category;

    @Builder.Default
    @Column(name = "on_discount")
    private boolean onDiscount = false;

    @OneToOne//(cascade = CascadeType.ALL)
    private Shop shop;

    @OneToOne(cascade = CascadeType.ALL)
    private Upload image;
}
