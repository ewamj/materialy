package com.isa.jjdd.arquillian.ex03_arquillian;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;

import javax.inject.Inject;

import static org.junit.Assert.assertNotNull;

@RunWith(Arquillian.class)
public class PostCarIT {

    @Deployment
    public static JavaArchive createDeployment() {
        JavaArchive jar =  null; //ShrinkWrap.create()
        return jar;
    }

    @Inject
    PostCar postCar;

    @Test
    public void shouldInjectPostCar() {
        // given

        // when

        // then
        assertNotNull(postCar);
    }
}
