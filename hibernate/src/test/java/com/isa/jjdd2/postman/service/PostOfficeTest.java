package com.isa.jjdd2.postman.service;

import com.isa.jjdd2.postman.model.Letter;
import org.fluttercode.datafactory.impl.DataFactory;
import org.junit.Test;

import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;

public class PostOfficeTest {

    PostOffice sut = new PostOffice();

    @Test
    public void shouldGenerateLettersBetweenLimitAndHalf() throws Exception {
        // given
        sut.dataFactory = new DataFactory();

        // when
        Set<Letter> letters = sut.preparePostBag();

        // then
        System.out.println("letters = " + letters);
        assertThat(letters).isNotEmpty();
        assertThat(letters.size()).isBetween(PostOffice.POST_BAG_SIZE/2,PostOffice.POST_BAG_SIZE);
    }
}