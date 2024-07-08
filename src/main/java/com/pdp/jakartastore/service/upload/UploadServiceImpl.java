package com.pdp.jakartastore.service.upload;

import com.pdp.jakartastore.entity.upload.Upload;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  10:00
 **/
public class UploadServiceImpl implements UploadService {
    @Override
    public Upload save(Upload entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Upload entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Upload findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Upload> findAll() {
        return dao.findAll();
    }
}
