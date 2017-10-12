package com.isa.jjdd.arquillian.ex02_maven;

import org.junit.Test;

public class PostIT {

    Post sut = new Post();

    @Test
    public void shouldMakeAnyLongtimeOperation() throws Exception {
        // given
        sut.setLazyTime(0);

        // when
        sut.snailPostOperation();

        // then

    }
}
