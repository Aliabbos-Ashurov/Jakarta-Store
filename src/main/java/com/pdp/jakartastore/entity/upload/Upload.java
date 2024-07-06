package com.pdp.jakartastore.entity.upload;

import com.pdp.jakartastore.entity.BaseEntity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import lombok.*;
import org.hibernate.validator.constraints.pl.NIP;

import java.time.LocalDateTime;

/**
 * @author Aliabbos Ashurov
 * @since 06/July/2024  16:09
 **/
@Entity
@Getter
@Setter
@NoArgsConstructor
public class Upload extends BaseEntity {

    @Column(nullable = false)
    private String generatedName;

    @Column(nullable = false)
    private String fileName;

    @Column(nullable = false)
    private String fileType;

    private long size;
    @Column(nullable = false)
    private String extension;

    @Builder(builderMethodName = "childBuilder")
    public Upload(String generatedName, String fileName, String fileType, long size, String extension) {
        this.generatedName = generatedName;
        this.fileName = fileName;
        this.fileType = fileType;
        this.size = size;
        this.extension = extension;
    }
}
