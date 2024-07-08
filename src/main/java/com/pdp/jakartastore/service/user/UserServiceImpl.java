package com.pdp.jakartastore.service.user;

import com.pdp.jakartastore.entity.user.User;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  09:44
 **/
public class UserServiceImpl implements UserService {
    @Override
    public User findByUsername(String username) {
        return dao.findByUsername(username).orElse(null);
    }

    @Override
    public User findByEmail(String email) {
        return dao.findByEmail(email).orElse(null);
    }

    @Override
    public User addUser(User user) {
        return dao.addUser(user);
    }

    @Override
    public User save(User entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(User entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public User findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }
}
