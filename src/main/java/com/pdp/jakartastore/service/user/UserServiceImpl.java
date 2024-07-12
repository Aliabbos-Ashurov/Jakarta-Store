package com.pdp.jakartastore.service.user;

import com.pdp.jakartastore.entity.user.Users;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  09:44
 **/
public class UserServiceImpl implements UserService {

    @Override
    public List<Users> getByFilters() {
        List<Users> all = findAll();
        List<Users> active = all.stream()
                .filter(u -> u.getStatus().equals(Users.Status.ACTIVE))
                .collect(Collectors.toList());
        List<Users> notActive = all.stream()
                .filter(u -> u.getStatus().equals(Users.Status.NOT_ACTIVE))
                .collect(Collectors.toList());
        notActive.addAll(active);
        return notActive;
    }

    @Override
    public Users findByUsername(String username) {
        return dao.findByUsername(username).orElse(null);
    }

    @Override
    public Users findByEmail(String email) {
        return dao.findByEmail(email).orElse(null);
    }

    @Override
    public Users check(String username, String password) {
        return dao.check(username, password);
    }

    @Override
    public void addUser(Users users) {
        dao.addUser(users);
    }

    @Override
    public Users save(Users entity) {
        return dao.save(entity);
    }

    @Override
    public boolean update(Users entity) {
        return dao.update(entity);
    }

    @Override
    public boolean delete(String id) {
        return dao.delete(id);
    }

    @Override
    public Users findById(String id) {
        return dao.findById(id);
    }

    @Override
    public List<Users> findAll() {
        return dao.findAll();
    }
}
