// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Tenant;
import com.sjsu.bikelet.domain.TenantDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect TenantDataOnDemand_Roo_DataOnDemand {
    
    declare @type: TenantDataOnDemand: @Component;
    
    private Random TenantDataOnDemand.rnd = new SecureRandom();
    
    private List<Tenant> TenantDataOnDemand.data;
    
    public Tenant TenantDataOnDemand.getNewTransientTenant(int index) {
        Tenant obj = new Tenant();
        setContactId(obj, index);
        setTenantName(obj, index);
        return obj;
    }
    
    public void TenantDataOnDemand.setContactId(Tenant obj, int index) {
        Integer contactId = new Integer(index);
        obj.setContactId(contactId);
    }
    
    public void TenantDataOnDemand.setTenantName(Tenant obj, int index) {
        String tenantName = "tenantName_" + index;
        if (tenantName.length() > 30) {
            tenantName = tenantName.substring(0, 30);
        }
        obj.setTenantName(tenantName);
    }
    
    public Tenant TenantDataOnDemand.getSpecificTenant(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Tenant obj = data.get(index);
        Long id = obj.getId();
        return Tenant.findTenant(id);
    }
    
    public Tenant TenantDataOnDemand.getRandomTenant() {
        init();
        Tenant obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Tenant.findTenant(id);
    }
    
    public boolean TenantDataOnDemand.modifyTenant(Tenant obj) {
        return false;
    }
    
    public void TenantDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Tenant.findTenantEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Tenant' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Tenant>();
        for (int i = 0; i < 10; i++) {
            Tenant obj = getNewTransientTenant(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
