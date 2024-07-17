package com.pdp.jakartastore.entity.shop;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.user.Users;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.OneToOne;
import lombok.*;
import lombok.experimental.SuperBuilder;

/**
 * @author Aliabbos Ashurov
 * @since 09/July/2024  11:45
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder(toBuilder = true)
public class Shop extends BaseEntity {

    private String name;
    private String address;
    private String phone;

    @OneToOne//(cascade = CascadeType.ALL)
    private Users owner;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private Status status = Status.ACTIVE;


    public enum Status {
        NOT_ACTIVE, ACTIVE, DELETED,WAITING
    }
}
