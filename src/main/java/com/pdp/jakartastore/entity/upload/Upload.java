package com.pdp.jakartastore.entity.upload;

import com.pdp.jakartastore.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.*;
import lombok.experimental.SuperBuilder;

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

    @Column(nullable = false, name = "generated_name")
    private String generatedName;

    @Column(nullable = false, name = "file_name")
    private String fileName;

    @Column(nullable = false, name = "file_type")
    private String fileType;

    private long size;

    @Column(nullable = false)
    private String extension;
}
