// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.BillTransaction;
import com.sjsu.bikelet.domain.BillTransactionDataOnDemand;
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
import org.springframework.stereotype.Component;

privileged aspect BillTransactionDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BillTransactionDataOnDemand: @Component;
    
    private Random BillTransactionDataOnDemand.rnd = new SecureRandom();
    
    private List<BillTransaction> BillTransactionDataOnDemand.data;
    
    public BillTransaction BillTransactionDataOnDemand.getNewTransientBillTransaction(int index) {
        BillTransaction obj = new BillTransaction();
        setDescription(obj, index);
        setEndDate(obj, index);
        setStartDate(obj, index);
        setTotalCost(obj, index);
        setTransactionType(obj, index);
        return obj;
    }
    
    public void BillTransactionDataOnDemand.setDescription(BillTransaction obj, int index) {
        String description = "description_" + index;
        if (description.length() > 100) {
            description = description.substring(0, 100);
        }
        obj.setDescription(description);
    }
    
    public void BillTransactionDataOnDemand.setEndDate(BillTransaction obj, int index) {
        Date endDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setEndDate(endDate);
    }
    
    public void BillTransactionDataOnDemand.setStartDate(BillTransaction obj, int index) {
        Date startDate = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setStartDate(startDate);
    }
    
    public void BillTransactionDataOnDemand.setTotalCost(BillTransaction obj, int index) {
        Double totalCost = new Integer(index).doubleValue();
        obj.setTotalCost(totalCost);
    }
    
    public void BillTransactionDataOnDemand.setTransactionType(BillTransaction obj, int index) {
        String transactionType = "transactionType_" + index;
        if (transactionType.length() > 100) {
            transactionType = transactionType.substring(0, 100);
        }
        obj.setTransactionType(transactionType);
    }
    
    public BillTransaction BillTransactionDataOnDemand.getSpecificBillTransaction(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        BillTransaction obj = data.get(index);
        Long id = obj.getId();
        return BillTransaction.findBillTransaction(id);
    }
    
    public BillTransaction BillTransactionDataOnDemand.getRandomBillTransaction() {
        init();
        BillTransaction obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return BillTransaction.findBillTransaction(id);
    }
    
    public boolean BillTransactionDataOnDemand.modifyBillTransaction(BillTransaction obj) {
        return false;
    }
    
    public void BillTransactionDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = BillTransaction.findBillTransactionEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'BillTransaction' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<BillTransaction>();
        for (int i = 0; i < 10; i++) {
            BillTransaction obj = getNewTransientBillTransaction(i);
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
