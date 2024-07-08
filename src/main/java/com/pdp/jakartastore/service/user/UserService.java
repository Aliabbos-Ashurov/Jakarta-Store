package com.pdp.jakartastore.service.user;

import com.pdp.jakartastore.dao.UserDAO;
import com.pdp.jakartastore.entity.user.User;
import com.pdp.jakartastore.service.BaseService;

/**
 * @author Aliabbos Ashurov
 * @since 08/July/2024  09:43
 **/
public interface UserService extends BaseService<User, String> {

    UserDAO dao = new UserDAO();

    User findByUsername(String username);

    User findByEmail(String email);

    User addUser(User user);
}
