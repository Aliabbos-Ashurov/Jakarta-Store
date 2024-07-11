package com.pdp.jakartastore.service.upload;

import com.pdp.jakartastore.dao.upload.UploadDAO;
import com.pdp.jakartastore.entity.upload.Upload;
import com.pdp.jakartastore.service.BaseService;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:00
 **/
public interface UploadService extends BaseService<Upload, String> {
    UploadDAO dao = new UploadDAO();
}
