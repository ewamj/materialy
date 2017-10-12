package com.isa.jjdd.arquillian.ex04_db;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.persistence.ShouldMatchDataSet;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.spec.JavaArchive;
import org.junit.Test;
import org.junit.runner.RunWith;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@RunWith(Arquillian.class)
public class PostBoxIT {

    @Deployment
    public static JavaArchive createDeployment() {
        JavaArchive jar =  ShrinkWrap.create(JavaArchive.class)
                .addClasses(PostBox.class, CryptoConverter.class, PostBoxIT.class)
                .addAsManifestResource("META-INF/persistence.xml", "persistence.xml")
                .addAsManifestResource("META-INF/orm.xml", "orm.xml")
                .addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml");
        return jar;
    }

    @PersistenceContext
    private EntityManager em;

    @Test
    @ShouldMatchDataSet(value = "data/testBox.yml", excludeColumns = "id")
    public void shouldEncryptBoxCodeInDatabase() throws Exception {
        // given
        PostBox box = new PostBox();
        box.setBoxAddress("test box address");
        box.setBoxNumber("test box number");
        box.setBoxCode("123456789");

        // when
        this.em.persist(box);

        // then

    }
}