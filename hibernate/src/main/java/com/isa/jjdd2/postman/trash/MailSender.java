package com.isa.jjdd2.postman.trash;

import javax.ejb.EJB;
import javax.inject.Inject;

public class MailSender {

    @Inject
//    @EJB
    private MailAddressValidator validator;

    public void send(String receiverEmail, String senderEmail) {
        validator.isValidEMail(receiverEmail);
        validator.isValidEMail(senderEmail);

    }


}
