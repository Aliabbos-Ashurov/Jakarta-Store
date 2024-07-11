package com.pdp.jakartastore.dao.user;

import com.pdp.jakartastore.dao.BaseDAO;
import com.pdp.jakartastore.entity.user.Users;
import jakarta.persistence.EntityExistsException;
import jakarta.persistence.NoResultException;

import java.util.Optional;

/**
 * @author Aliabbos Ashurov
 * @since 07/July/2024  16:32
 **/
public class UserDAO extends BaseDAO<Users, String> {

    public Users check(String username, String password) {
        try {
            begin();
            Users users = entityManager.createQuery("SELECT u FROM Users u WHERE u.username = :username AND u.password = :password", Users.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .getSingleResult();
            commit();
            return users;
        } catch (Exception e) {
            rollBack();
        }
        return null;
    }

    public Users addUser(Users users) {
        try {
            begin();
            Optional<Users> existingUser = findByUsername(users.getUsername());
            if (existingUser.isEmpty()) {
                entityManager.persist(users);
                commit();
            } else {
                rollBack();
                throw new EntityExistsException("USER with username " + users.getUsername() + " already exists.");
            }
        } catch (Exception e) {
            rollBack();
            System.err.println(e.getMessage());
        }
        return users;
    }

    public Optional<Users> findByEmail(String email) {
        try {
            begin();
            Users users = entityManager.createNamedQuery("User.findByEmail", Users.class)
                    .setParameter("email", email)
                    .getSingleResult();
            commit();
            return Optional.ofNullable(users);
        } catch (NoResultException e) {
            commit();
            return Optional.empty();
        } catch (Exception e) {
            rollBack();
            return Optional.empty();
        }
    }

    public Optional<Users> findByUsername(String username) {
        try {
            begin();
            Users users = entityManager.createNamedQuery("User.findByUsername", Users.class)
                    .setParameter("username", username)
                    .getSingleResult();
            commit();
            return Optional.ofNullable(users);
        } catch (NoResultException e) {
            commit();
            return Optional.empty();
        } catch (Exception e) {
            rollBack();
            return Optional.empty();
        }
    }
}
