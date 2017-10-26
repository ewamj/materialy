package com.isa.jjdd2.postman.service;

import com.isa.jjdd2.postman.model.Address;

public class AddressParser {

    public Address parseAddressIfPossible(String addressData) throws Exception {
        String[] addressElements = addressData.split(",");
        String person = addressElements[0].trim() + " " + addressElements[1].trim();
        String city = addressElements[2].trim();
        String street = addressElements[3].trim();
        String houseNr = addressElements[4].trim();
        String flatNr = addressElements[5].trim();
        return Address.builder()
                .person(person)
                .city(city)
                .street(street)
                .houseNumber(houseNr)
                .flatNumber(flatNr)
                .build();
    }

}
