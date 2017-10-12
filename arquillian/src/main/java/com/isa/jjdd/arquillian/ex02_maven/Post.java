package com.isa.jjdd.arquillian.ex02_maven;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

import java.util.Collections;

@Slf4j
public class Post {

    @Setter
    long lazyTime = 3;

    void snailPostOperation() throws Exception {
        for (int i = 0; i < lazyTime; i++) {
            log.debug("Snail postman is going{}", String.join("", Collections.nCopies(i, ".")));
            Thread.sleep(1000);
        }
    }
}
