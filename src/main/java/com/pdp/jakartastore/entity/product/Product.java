package com.pdp.jakartastore.entity.product;

import com.pdp.jakartastore.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Min;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  15:18
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString
public class Product extends BaseEntity {

    @Column(nullable = false, length = 100)
    private String name;

    @Column(nullable = false)
    @Min(value = 100)
    private double price;

    @Builder(builderMethodName = "childBuilder")
    public Product(String name, double price) {
        this.name = name;
        this.price = price;
    }
}
