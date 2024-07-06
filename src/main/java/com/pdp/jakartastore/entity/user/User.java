package com.pdp.jakartastore.entity.user;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.upload.Upload;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

import java.time.LocalDateTime;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  16:13
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
public class User extends BaseEntity {

    @Column(unique = true, nullable = false)
    private String username;

    @NotBlank
    private String password;

    @Email(regexp = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$", message = ":::The pattern did not match the email:::")
    @Column(nullable = false, unique = true)
    private String email;

    @Column(unique = true)
    private String phoneNumber;

    @OneToOne
    private Upload upload;

    @Builder(builderMethodName = "childBuilder")
    public User(String username, String password, String email, String phoneNumber) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }
}
