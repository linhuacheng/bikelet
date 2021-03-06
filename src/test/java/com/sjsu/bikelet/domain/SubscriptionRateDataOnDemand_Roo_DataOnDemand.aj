// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.SubscriptionPolicyDataOnDemand;
import com.sjsu.bikelet.domain.SubscriptionRate;
import com.sjsu.bikelet.domain.SubscriptionRateDataOnDemand;
import com.sjsu.bikelet.service.SubscriptionRateService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect SubscriptionRateDataOnDemand_Roo_DataOnDemand {
    
    declare @type: SubscriptionRateDataOnDemand: @Component;
    
    private Random SubscriptionRateDataOnDemand.rnd = new SecureRandom();
    
    private List<SubscriptionRate> SubscriptionRateDataOnDemand.data;
    
    @Autowired
    SubscriptionPolicyDataOnDemand SubscriptionRateDataOnDemand.subscriptionPolicyDataOnDemand;
    
    @Autowired
    SubscriptionRateService SubscriptionRateDataOnDemand.subscriptionRateService;
    
    public SubscriptionRate SubscriptionRateDataOnDemand.getNewTransientSubscriptionRate(int index) {
        SubscriptionRate obj = new SubscriptionRate();
        setExcessChargePerMin(obj, index);
        setFreeMinsPerDay(obj, index);
        setMembershipPerMonth(obj, index);
        setOrganizationShare(obj, index);
        setPolicyEndDate(obj, index);
        setPolicyStartDate(obj, index);
        setUserShare(obj, index);
        return obj;
    }
    
    public void SubscriptionRateDataOnDemand.setExcessChargePerMin(SubscriptionRate obj, int index) {
        Double excessChargePerMin = new Integer(index).doubleValue();
        obj.setExcessChargePerMin(excessChargePerMin);
    }
    
    public void SubscriptionRateDataOnDemand.setFreeMinsPerDay(SubscriptionRate obj, int index) {
        Integer freeMinsPerDay = new Integer(index);
        obj.setFreeMinsPerDay(freeMinsPerDay);
    }
    
    public void SubscriptionRateDataOnDemand.setMembershipPerMonth(SubscriptionRate obj, int index) {
        Double membershipPerMonth = new Integer(index).doubleValue();
        obj.setMembershipPerMonth(membershipPerMonth);
    }
    
    public void SubscriptionRateDataOnDemand.setOrganizationShare(SubscriptionRate obj, int index) {
        Double organizationShare = new Integer(index).doubleValue();
        obj.setOrganizationShare(organizationShare);
    }
    
    public void SubscriptionRateDataOnDemand.setPolicyEndDate(SubscriptionRate obj, int index) {
        Date policyEndDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setPolicyEndDate(policyEndDate);
    }
    
    public void SubscriptionRateDataOnDemand.setPolicyStartDate(SubscriptionRate obj, int index) {
        Date policyStartDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setPolicyStartDate(policyStartDate);
    }
    
    public void SubscriptionRateDataOnDemand.setUserShare(SubscriptionRate obj, int index) {
        Double userShare = new Integer(index).doubleValue();
        obj.setUserShare(userShare);
    }
    
    public SubscriptionRate SubscriptionRateDataOnDemand.getSpecificSubscriptionRate(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        SubscriptionRate obj = data.get(index);
        Long id = obj.getId();
        return subscriptionRateService.findSubscriptionRate(id);
    }
    
    public SubscriptionRate SubscriptionRateDataOnDemand.getRandomSubscriptionRate() {
        init();
        SubscriptionRate obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return subscriptionRateService.findSubscriptionRate(id);
    }
    
    public boolean SubscriptionRateDataOnDemand.modifySubscriptionRate(SubscriptionRate obj) {
        return false;
    }
    
    public void SubscriptionRateDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = subscriptionRateService.findSubscriptionRateEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'SubscriptionRate' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<SubscriptionRate>();
        for (int i = 0; i < 10; i++) {
            SubscriptionRate obj = getNewTransientSubscriptionRate(i);
            try {
                subscriptionRateService.saveSubscriptionRate(obj);
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
