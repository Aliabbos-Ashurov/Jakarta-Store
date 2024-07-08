package com.pdp.jakartastore.dao;

import com.pdp.jakartastore.entity.user.User;
import jakarta.persistence.EntityExistsException;
import jakarta.persistence.NoResultException;

import java.util.Optional;

/**
 * @author Aliabbos Ashurov
 * @since 07/July/2024  16:32
 **/
public class UserDAO extends BaseDAO<User, String> {

    public static void main(String[] args) {

    }

    public User addUser(User user) {
        try {
            begin();
            Optional<User> existingUser = findByUsername(user.getUsername());
            if (existingUser.isEmpty()) {
                entityManager.persist(user);
                commit();
            } else {
                rollBack();
                throw new EntityExistsException("USER with username " + user.getUsername() + " already exists.");
            }
        } catch (Exception e) {
            rollBack();
            System.err.println(e.getMessage());
        }
        return user;
    }

    public Optional<User> findByEmail(String email) {
        try {
            begin();
            User user = entityManager.createNamedQuery("User.findByEmail", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
            commit();
            return Optional.ofNullable(user);
        } catch (NoResultException e) {
            commit();
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
            commit();
            return Optional.empty();
        } catch (Exception e) {
            rollBack();
            return Optional.empty();
        }
    }
}
