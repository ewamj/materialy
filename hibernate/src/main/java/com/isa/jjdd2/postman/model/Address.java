package com.isa.jjdd2.postman.model;

import lombok.Builder;
import lombok.Data;
import lombok.experimental.Tolerate;

import javax.persistence.*;

@Data
@Builder
@Entity
public class Address {

    @Tolerate
    public Address() {
    }

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    Long id;

    String person;

    String city;

    String street;

    @Column(name = "house_number")
    String houseNumber;

    @Column(name = "flat_number")
    String flatNumber;

}
