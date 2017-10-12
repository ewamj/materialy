package com.isa.jjdd.arquillian.ex01_junit;

import lombok.EqualsAndHashCode;
import lombok.Getter;

@Getter
@EqualsAndHashCode
public class Letter {
    Address sender;

    Address receiver;

    Envelope size;
}
