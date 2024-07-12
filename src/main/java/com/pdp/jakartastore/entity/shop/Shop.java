package com.pdp.jakartastore.entity.shop;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.user.Users;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
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
}
