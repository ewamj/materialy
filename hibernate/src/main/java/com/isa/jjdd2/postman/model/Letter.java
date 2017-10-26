package com.isa.jjdd2.postman.model;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Letter {

    Address sender;

    Address receiver;

    Envelope size;
}
