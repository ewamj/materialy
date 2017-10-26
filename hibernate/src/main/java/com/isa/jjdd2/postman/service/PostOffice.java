package com.isa.jjdd2.postman.service;

import com.isa.jjdd2.postman.model.Address;
import com.isa.jjdd2.postman.model.Envelope;
import com.isa.jjdd2.postman.model.Letter;
import lombok.extern.slf4j.Slf4j;
import org.fluttercode.datafactory.impl.DataFactory;

import javax.ejb.Stateless;
import java.util.Random;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Stateless
@Slf4j
public class PostOffice {

    public static final int POST_BAG_SIZE = 20;

    DataFactory dataFactory = new DataFactory();

    public Set<Letter> preparePostBag() {
        int lettersCount = new Random()
                .ints(POST_BAG_SIZE / 2, POST_BAG_SIZE + 1)
                .iterator().nextInt();
        log.debug("Preparing {} letters.", lettersCount);
        return Stream.generate(
                () -> Letter.builder()
                        .sender(generateAddress())
                        .receiver(generateAddress())
                        .size(generateEnvelop()).build()
        ).limit(lettersCount).collect(Collectors.toSet());
    }

    private Envelope generateEnvelop() {
        Envelope[] envelopes = Envelope.values();
        return envelopes[new Random().nextInt(envelopes.length)];
    }

    private Address generateAddress() {
        return Address.builder()
                .person(dataFactory.getName())
                .city(dataFactory.getCity())
                .street(dataFactory.getStreetName())
                .flatNumber(dataFactory.getNumberText(2))
                .houseNumber(dataFactory.getNumberText(2))
                .build();
    }
}
