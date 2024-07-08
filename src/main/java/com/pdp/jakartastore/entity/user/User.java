package com.pdp.jakartastore.entity.user;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.upload.Upload;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
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
@NamedQuery(name = "User.findByUsername", query = "SELECT u FROM User u WHERE u.username = :username")
@NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u WHERE u.email = :email")
public class User extends BaseEntity {

    @NotBlank
    @Column(unique = true, nullable = false)
    private String username;

    @NotBlank
    @Column(nullable = false)
    private String password;

    @Email(regexp = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message = ":::The pattern did not match the email:::")
    @Column(nullable = false, unique = true)
    private String email;

    @Column(unique = true,name = "phone_number")
    private String phoneNumber;

    @Enumerated(EnumType.STRING)
    private Status status = Status.ACTIVE;

    @Column(name = "profil_image")
    @OneToOne
    private Upload profileImage;

    private enum Status {
        NOT_ACTIVE, ACTIVE, DELETED
    }
}
