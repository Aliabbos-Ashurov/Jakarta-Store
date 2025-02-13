package com.pdp.jakartastore.service.user;

import com.pdp.jakartastore.dao.user.UserDAO;
import com.pdp.jakartastore.entity.user.Users;
import com.pdp.jakartastore.service.BaseService;

import java.util.List;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  09:43
 **/
public interface UserService extends BaseService<Users, String> {

    UserDAO dao = new UserDAO();

    Users findByUsername(String username);

    Users findByEmail(String email);

    void addUser(Users users);

    Users check(String username, String password);

    List<Users> getByFilters();

}
