package com.isa.jjdd.arquillian.ex01_junit;

import lombok.Getter;
import lombok.Setter;

import java.util.Collections;
import java.util.Optional;
import java.util.Set;

@Getter
@Setter
public class Postman {

    Set<Letter> postBag = Collections.emptySet();

    PostOffice postOffice;

    void beginNewDay() {
        postBag = postOffice.preparePostBag();
    }

    Optional<Letter> findNextLetter(Optional<Letter> lastLetter) {
        return Optional.empty();
    }
}
