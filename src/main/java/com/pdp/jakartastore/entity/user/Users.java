package com.pdp.jakartastore.entity.user;

import com.pdp.jakartastore.entity.BaseEntity;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import lombok.experimental.SuperBuilder;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  16:13
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
@NamedQuery(name = "User.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username")
@NamedQuery(name = "Users.findByEmail", query = "SELECT u FROM Users u WHERE u.email = :email")
public class Users extends BaseEntity {

    @NotBlank
    @Column(nullable = false)
    private String fullname;

    @NotBlank
    @Column(unique = true, nullable = false)
    private String username;

    @NotBlank
    @Column(nullable = false)
    private String password;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(unique = true, name = "phone_number")
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private Role role = Role.USER;

    @Enumerated(EnumType.STRING)
    @Builder.Default
    private Status status = Status.ACTIVE;


    public enum Status {
        NOT_ACTIVE, ACTIVE, DELETED
    }

    public enum Role {
        ADMIN, USER, SELLER
    }
}
