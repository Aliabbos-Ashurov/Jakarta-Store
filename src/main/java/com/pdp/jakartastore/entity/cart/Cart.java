package com.pdp.jakartastore.entity.cart;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.user.Users;
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

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Users users;

    @Builder.Default
    @Column(name = "is_paid")
    private boolean isPaid = false;
}
