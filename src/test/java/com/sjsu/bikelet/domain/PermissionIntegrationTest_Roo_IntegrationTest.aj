// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Permission;
import com.sjsu.bikelet.domain.PermissionDataOnDemand;
import com.sjsu.bikelet.domain.PermissionIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PermissionIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PermissionIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PermissionIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: PermissionIntegrationTest: @Transactional;
    
    @Autowired
    PermissionDataOnDemand PermissionIntegrationTest.dod;
    
    @Test
    public void PermissionIntegrationTest.testCountPermissions() {
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        long count = Permission.countPermissions();
        Assert.assertTrue("Counter for 'Permission' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PermissionIntegrationTest.testFindPermission() {
        Permission obj = dod.getRandomPermission();
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        obj = Permission.findPermission(id);
        Assert.assertNotNull("Find method for 'Permission' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Permission' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PermissionIntegrationTest.testFindAllPermissions() {
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        long count = Permission.countPermissions();
        Assert.assertTrue("Too expensive to perform a find all test for 'Permission', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Permission> result = Permission.findAllPermissions();
        Assert.assertNotNull("Find all method for 'Permission' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Permission' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PermissionIntegrationTest.testFindPermissionEntries() {
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        long count = Permission.countPermissions();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Permission> result = Permission.findPermissionEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Permission' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Permission' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PermissionIntegrationTest.testFlush() {
        Permission obj = dod.getRandomPermission();
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        obj = Permission.findPermission(id);
        Assert.assertNotNull("Find method for 'Permission' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPermission(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Permission' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PermissionIntegrationTest.testMergeUpdate() {
        Permission obj = dod.getRandomPermission();
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        obj = Permission.findPermission(id);
        boolean modified =  dod.modifyPermission(obj);
        Integer currentVersion = obj.getVersion();
        Permission merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Permission' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PermissionIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", dod.getRandomPermission());
        Permission obj = dod.getNewTransientPermission(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Permission' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Permission' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Permission' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PermissionIntegrationTest.testRemove() {
        Permission obj = dod.getRandomPermission();
        Assert.assertNotNull("Data on demand for 'Permission' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Permission' failed to provide an identifier", id);
        obj = Permission.findPermission(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Permission' with identifier '" + id + "'", Permission.findPermission(id));
    }
    
}
