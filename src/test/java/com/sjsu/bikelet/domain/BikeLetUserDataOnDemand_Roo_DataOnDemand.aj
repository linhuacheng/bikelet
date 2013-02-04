// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.BikeLetUser;
import com.sjsu.bikelet.domain.BikeLetUserDataOnDemand;
import com.sjsu.bikelet.domain.TenantDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect BikeLetUserDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BikeLetUserDataOnDemand: @Component;
    
    private Random BikeLetUserDataOnDemand.rnd = new SecureRandom();
    
    private List<BikeLetUser> BikeLetUserDataOnDemand.data;
    
    @Autowired
    TenantDataOnDemand BikeLetUserDataOnDemand.tenantDataOnDemand;
    
    public BikeLetUser BikeLetUserDataOnDemand.getNewTransientBikeLetUser(int index) {
        BikeLetUser obj = new BikeLetUser();
        setEmail(obj, index);
        setFirstName(obj, index);
        setLastName(obj, index);
        setPassword(obj, index);
        return obj;
    }
    
    public void BikeLetUserDataOnDemand.setEmail(BikeLetUser obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 40) {
            email = email.substring(0, 40);
        }
        obj.setEmail(email);
    }
    
    public void BikeLetUserDataOnDemand.setFirstName(BikeLetUser obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 30) {
            firstName = firstName.substring(0, 30);
        }
        obj.setFirstName(firstName);
    }
    
    public void BikeLetUserDataOnDemand.setLastName(BikeLetUser obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 30) {
            lastName = lastName.substring(0, 30);
        }
        obj.setLastName(lastName);
    }
    
    public void BikeLetUserDataOnDemand.setPassword(BikeLetUser obj, int index) {
        String password = "password_" + index;
        if (password.length() > 15) {
            password = password.substring(0, 15);
        }
        obj.setPassword(password);
    }
    
    public BikeLetUser BikeLetUserDataOnDemand.getSpecificBikeLetUser(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        BikeLetUser obj = data.get(index);
        Long id = obj.getId();
        return BikeLetUser.findBikeLetUser(id);
    }
    
    public BikeLetUser BikeLetUserDataOnDemand.getRandomBikeLetUser() {
        init();
        BikeLetUser obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return BikeLetUser.findBikeLetUser(id);
    }
    
    public boolean BikeLetUserDataOnDemand.modifyBikeLetUser(BikeLetUser obj) {
        return false;
    }
    
    public void BikeLetUserDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = BikeLetUser.findBikeLetUserEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'BikeLetUser' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<BikeLetUser>();
        for (int i = 0; i < 10; i++) {
            BikeLetUser obj = getNewTransientBikeLetUser(i);
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
