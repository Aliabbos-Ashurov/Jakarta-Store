package com.pdp.jakartastore.utils;


import org.mindrot.jbcrypt.BCrypt;

/**
 * This utility class provides methods for password encoding and verification.
 * It leverages the BCrypt strong hashing function to secure passwords.
 * BCrypt provides its own salt generation hence ensuring secure password storage.
 *
 * @author Aliabbos Ashurov
 * @since 07/July/2024  16:04
 **/
public class PasswordEncoderUtils {

    /**
     * Encodes a plain-text password using the BCrypt hashing function.
     *
     * @param rawPassword The plain-text password to encode.
     * @return A hashed representation of the password for secure storage.
     */
    public static String encode(String rawPassword) {
        return BCrypt.hashpw(rawPassword, BCrypt.gensalt());
    }

    /**
     * Checks a plain-text password against the provided hashed password to determine if they match.
     *
     * @param rawPassword     The plain-text password to verify.
     * @param encodedPassword The hashed password to compare against.
     * @return True if the passwords match, false otherwise.
     */
    public static boolean checkPassword(String rawPassword, String encodedPassword) {
        return BCrypt.checkpw(rawPassword, encodedPassword);
    }
}
