package com.isa.jjdd2.postman.trash;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

@RunWith(MockitoJUnitRunner.class)
public class MailSenderTest {

    @Mock
    MailAddressValidator validator;

    @InjectMocks
    MailSender sut;

    @Test
    public void fakeTestMethod() throws Exception {
        // given

        // when

        // then

    }
}