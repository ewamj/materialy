package com.isa.jjdd.arquillian.ex01_junit;

import org.junit.Test;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;


public class PostmanTest {

    Postman sut = new Postman();

    @Test
    public void shouldHaveNoLetterWhenEmptyPostBag() throws Exception {
        // given
        sut.postBag.clear();

        // when
        Optional<Letter> result = sut.findNextLetter(Optional.empty());

        // then
        assertThat(result).isEmpty();

    }

    @Test
    public void shouldTakeTheLetterWhenPostOfficeGaveOnlyOne() throws Exception {
        // given

        // when

        // then

    }

    @Test
    public void shouldTakeLettersFromPostOfficeOnceADay() throws Exception {
        // given

        // when

        // then

    }
}