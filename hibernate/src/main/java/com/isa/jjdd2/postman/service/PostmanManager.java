package com.isa.jjdd2.postman.service;

import com.isa.jjdd2.postman.model.Address;
import com.isa.jjdd2.postman.model.Envelope;
import com.isa.jjdd2.postman.model.Letter;
import com.isa.jjdd2.postman.model.Postman;
import lombok.extern.slf4j.Slf4j;

import javax.ejb.Stateless;
import javax.inject.Inject;
import java.util.Optional;
import java.util.Set;

@Slf4j
@Stateless
public class PostmanManager {

    @Inject
    Postman postman;

    @Inject
    PostOffice postOffice;

    @Inject
    AddressParser addressParser;

    public Set<Letter> preparePostBag() {
        Set<Letter> postBag = postOffice.preparePostBag();
        postman.setPostBag(postBag);
        return postBag;
    }

    public Optional<Letter> addLetterIfPossible(String sender, String receiver, String size) {
        try {
            Envelope envelopeSize = Envelope.valueOf(size);
            Address senderAddress = addressParser.parseAddressIfPossible(sender);
            Address receiverAddress = addressParser.parseAddressIfPossible(receiver);
            return Optional.of(Letter.builder()
                    .sender(senderAddress)
                    .receiver(receiverAddress)
                    .size(envelopeSize).build());
        } catch (Throwable e) {
            log.error("Letter preparing error: " + e.getMessage(), e);
            return Optional.empty();
        }
    }
}
