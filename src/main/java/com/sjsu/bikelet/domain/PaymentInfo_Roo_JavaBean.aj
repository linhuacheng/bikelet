// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.BikeLetUser;
import com.sjsu.bikelet.domain.PaymentInfo;

privileged aspect PaymentInfo_Roo_JavaBean {
    
    public Integer PaymentInfo.getPaymentId() {
        return this.paymentId;
    }
    
    public void PaymentInfo.setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }
    
    public String PaymentInfo.getCardNumber() {
        return this.cardNumber;
    }
    
    public void PaymentInfo.setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
    
    public String PaymentInfo.getCardUserName() {
        return this.cardUserName;
    }
    
    public void PaymentInfo.setCardUserName(String cardUserName) {
        this.cardUserName = cardUserName;
    }
    
    public BikeLetUser PaymentInfo.getUserId() {
        return this.userId;
    }
    
    public void PaymentInfo.setUserId(BikeLetUser userId) {
        this.userId = userId;
    }
    
}
