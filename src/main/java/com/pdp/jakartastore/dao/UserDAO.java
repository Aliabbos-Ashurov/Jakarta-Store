package com.pdp.jakartastore.dao;

import com.pdp.jakartastore.entity.user.User;
import jakarta.persistence.NoResultException;

import java.util.Optional;

/**
 * @author Aliabbos Ashurov
 * @since 07/July/2024  16:32
 **/
public class UserDAO extends BaseDAO<User, String> {

    public Optional<User> findByEmail(String email) {
        try {
            begin();
            User user = entityManager.createNamedQuery("User.findByEmail", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return Optional.ofNullable(user);
        } catch (NoResultException e) {
            return Optional.empty();
        } catch (Exception e) {
            rollBack();
            return Optional.empty();
        }
    }

    public Optional<User> findByUsername(String username) {
        try {
            begin();
            User user = entityManager.createNamedQuery("User.findByUsername", User.class)
                    .setParameter("username", username)
                    .getSingleResult();
            commit();
            return Optional.ofNullable(user);
        } catch (NoResultException e) {
            return Optional.empty();
        } catch (Exception e) {
            rollBack();
            return Optional.empty();
        }
    }
}
