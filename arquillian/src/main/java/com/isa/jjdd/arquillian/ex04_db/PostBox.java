package com.isa.jjdd.arquillian.ex04_db;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Getter
@Setter
public class PostBox {

    @Id
    Long id;

    String boxAddress;

    String boxNumber;

    @Convert(converter = CryptoConverter.class)
    String boxCode;

}
