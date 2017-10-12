package com.isa.jjdd.arquillian.ex01_junit;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
public class PostmanTest {

    @Mock
    PostOffice postOffice;

    @InjectMocks
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
//        Set<Letter> fakePostBag = new HashSet<>();
//        fakePostBag.add(new Letter());
        Letter testLetter = new Letter();
        Set<Letter> fakePostBag = Stream.of(testLetter)
                .collect(Collectors.toSet());
        when(postOffice.preparePostBag()).thenReturn(fakePostBag);

        sut.beginNewDay();;

        assertThat(sut.getPostBag()).hasSize(1);
        assertThat(sut.getPostBag()).containsExactly(testLetter);


        // when
        Optional<Letter> result = sut.findNextLetter(Optional.empty());

        // then
        assertThat(result).isNotEmpty();
        assertThat(result.get()).isEqualTo(testLetter);

    }

    @Test
    public void shouldTakeLettersFromPostOfficeOnceADay() throws Exception {
        // given

        // when

        // then

    }
}