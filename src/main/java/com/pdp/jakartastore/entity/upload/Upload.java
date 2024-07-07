package com.pdp.jakartastore.entity.upload;

import com.pdp.jakartastore.entity.BaseEntity;
import com.pdp.jakartastore.entity.user.User;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.OneToOne;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.time.LocalDateTime;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  16:09
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
@SuperBuilder(toBuilder = true)
public class Upload extends BaseEntity {

    @Column(nullable = false)
    private String generatedName;

    @Column(nullable = false)
    private String fileName;

    @Column(nullable = false)
    private String fileType;

    @Column(nullable = false)
    private long size;

    @Column(nullable = false)
    private String extension;
}
