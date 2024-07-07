package com.pdp.jakartastore.entity.cart;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.user.User;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

/**
 * @author Aliabbos Ashurov
 * @since 07/July/2024  15:09
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder(toBuilder = true)
public class Cart extends BaseEntity {

    @ManyToOne
    @Column(nullable = false)
    private User user;

    private boolean isPaid = false;
}
