package com.pdp.jakartastore.service.email;

import com.pdp.java.mail.model.Email;
import com.pdp.java.mail.service.message.MessageHandler;
import lombok.extern.java.Log;

/**
 * @author Aliabbos Ashurov
 * @since 13/July/2024  14:41
 **/
@Log
public class EmailServiceImpl implements EmailService {
    private final Email EMAIL = new Email("aliabbosashurov.forwork@gmail.com", "yebe ujyg rnlr tckk");

    @Override
    public boolean send(String to, String subject, String messageType) {
        MessageHandler messageHandler = new MessageHandler.Builder()
                .FROM(EMAIL)
                .RECEIVER(to)
                .subject(subject)
                .text("SORRY")
                .html(messageType)
                .build();
        messageHandler.send();
        log.info(":::::::: EMAIL SUCCESFULLY SENT TO " + to + " ::::::::");
        return true;
    }
}
