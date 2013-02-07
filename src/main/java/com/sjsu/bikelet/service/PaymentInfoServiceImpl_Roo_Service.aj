// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.service;

import com.sjsu.bikelet.domain.PaymentInfo;
import com.sjsu.bikelet.service.PaymentInfoServiceImpl;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PaymentInfoServiceImpl_Roo_Service {
    
    declare @type: PaymentInfoServiceImpl: @Service;
    
    declare @type: PaymentInfoServiceImpl: @Transactional;
    
    public long PaymentInfoServiceImpl.countAllPaymentInfoes() {
        return PaymentInfo.countPaymentInfoes();
    }
    
    public void PaymentInfoServiceImpl.deletePaymentInfo(PaymentInfo paymentInfo) {
        paymentInfo.remove();
    }
    
    public PaymentInfo PaymentInfoServiceImpl.findPaymentInfo(Long id) {
        return PaymentInfo.findPaymentInfo(id);
    }
    
    public List<PaymentInfo> PaymentInfoServiceImpl.findAllPaymentInfoes() {
        return PaymentInfo.findAllPaymentInfoes();
    }
    
    public List<PaymentInfo> PaymentInfoServiceImpl.findPaymentInfoEntries(int firstResult, int maxResults) {
        return PaymentInfo.findPaymentInfoEntries(firstResult, maxResults);
    }
    
    public void PaymentInfoServiceImpl.savePaymentInfo(PaymentInfo paymentInfo) {
        paymentInfo.persist();
    }
    
    public PaymentInfo PaymentInfoServiceImpl.updatePaymentInfo(PaymentInfo paymentInfo) {
        return paymentInfo.merge();
    }
    
}