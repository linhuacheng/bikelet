// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.PaymentInfo;
import com.sjsu.bikelet.domain.PaymentInfoDataOnDemand;
import com.sjsu.bikelet.domain.PaymentInfoIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PaymentInfoIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PaymentInfoIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PaymentInfoIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PaymentInfoIntegrationTest: @Transactional;
    
    @Autowired
    PaymentInfoDataOnDemand PaymentInfoIntegrationTest.dod;
    
    @Test
    public void PaymentInfoIntegrationTest.testCountPaymentInfoes() {
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", dod.getRandomPaymentInfo());
        long count = PaymentInfo.countPaymentInfoes();
        Assert.assertTrue("Counter for 'PaymentInfo' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testFindPaymentInfo() {
        PaymentInfo obj = dod.getRandomPaymentInfo();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to provide an identifier", id);
        obj = PaymentInfo.findPaymentInfo(id);
        Assert.assertNotNull("Find method for 'PaymentInfo' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'PaymentInfo' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testFindAllPaymentInfoes() {
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", dod.getRandomPaymentInfo());
        long count = PaymentInfo.countPaymentInfoes();
        Assert.assertTrue("Too expensive to perform a find all test for 'PaymentInfo', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<PaymentInfo> result = PaymentInfo.findAllPaymentInfoes();
        Assert.assertNotNull("Find all method for 'PaymentInfo' illegally returned null", result);
        Assert.assertTrue("Find all method for 'PaymentInfo' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testFindPaymentInfoEntries() {
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", dod.getRandomPaymentInfo());
        long count = PaymentInfo.countPaymentInfoes();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<PaymentInfo> result = PaymentInfo.findPaymentInfoEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'PaymentInfo' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'PaymentInfo' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testFlush() {
        PaymentInfo obj = dod.getRandomPaymentInfo();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to provide an identifier", id);
        obj = PaymentInfo.findPaymentInfo(id);
        Assert.assertNotNull("Find method for 'PaymentInfo' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPaymentInfo(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'PaymentInfo' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testMergeUpdate() {
        PaymentInfo obj = dod.getRandomPaymentInfo();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to provide an identifier", id);
        obj = PaymentInfo.findPaymentInfo(id);
        boolean modified =  dod.modifyPaymentInfo(obj);
        Integer currentVersion = obj.getVersion();
        PaymentInfo merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'PaymentInfo' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", dod.getRandomPaymentInfo());
        PaymentInfo obj = dod.getNewTransientPaymentInfo(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'PaymentInfo' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'PaymentInfo' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PaymentInfoIntegrationTest.testRemove() {
        PaymentInfo obj = dod.getRandomPaymentInfo();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'PaymentInfo' failed to provide an identifier", id);
        obj = PaymentInfo.findPaymentInfo(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'PaymentInfo' with identifier '" + id + "'", PaymentInfo.findPaymentInfo(id));
    }
    
}
