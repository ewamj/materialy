package com.isa.jjdd2.postman.model;

import lombok.*;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Letter {
    Address sender;

    Address receiver;

    Envelope size;
}
