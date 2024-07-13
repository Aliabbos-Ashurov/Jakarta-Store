package com.pdp.jakartastore.service.email;

/**
 * @author Aliabbos Ashurov
 * @since 13/July/2024  14:41
 **/
public interface EmailService {
    boolean send(String to, String subject, String messageType);
}
