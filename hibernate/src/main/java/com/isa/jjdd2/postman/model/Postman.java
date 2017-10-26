package com.isa.jjdd2.postman.model;

import com.isa.jjdd2.postman.service.PostOffice;
import lombok.Getter;
import lombok.Setter;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Getter
@Setter
public class Postman {

    Set<Letter> postBag = new HashSet<>();

    Optional<Letter> lastLetter = Optional.empty();

}
