// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.SubscriptionPolicy;
import com.sjsu.bikelet.domain.SubscriptionRate;
import java.util.Date;

privileged aspect SubscriptionRate_Roo_JavaBean {
    
    public Double SubscriptionRate.getMembershipPerMonth() {
        return this.membershipPerMonth;
    }
    
    public void SubscriptionRate.setMembershipPerMonth(Double membershipPerMonth) {
        this.membershipPerMonth = membershipPerMonth;
    }
    
    public Double SubscriptionRate.getOrganizationShare() {
        return this.organizationShare;
    }
    
    public void SubscriptionRate.setOrganizationShare(Double organizationShare) {
        this.organizationShare = organizationShare;
    }
    
    public Double SubscriptionRate.getUserShare() {
        return this.userShare;
    }
    
    public void SubscriptionRate.setUserShare(Double userShare) {
        this.userShare = userShare;
    }
    
    public Integer SubscriptionRate.getFreeMinsPerDay() {
        return this.freeMinsPerDay;
    }
    
    public void SubscriptionRate.setFreeMinsPerDay(Integer freeMinsPerDay) {
        this.freeMinsPerDay = freeMinsPerDay;
    }
    
    public Double SubscriptionRate.getExcessChargePerMin() {
        return this.excessChargePerMin;
    }
    
    public void SubscriptionRate.setExcessChargePerMin(Double excessChargePerMin) {
        this.excessChargePerMin = excessChargePerMin;
    }
    
    public Date SubscriptionRate.getPolicyStartDate() {
        return this.policyStartDate;
    }
    
    public void SubscriptionRate.setPolicyStartDate(Date policyStartDate) {
        this.policyStartDate = policyStartDate;
    }
    
    public Date SubscriptionRate.getPolicyEndDate() {
        return this.policyEndDate;
    }
    
    public void SubscriptionRate.setPolicyEndDate(Date policyEndDate) {
        this.policyEndDate = policyEndDate;
    }
    
    public SubscriptionPolicy SubscriptionRate.getPolicyId() {
        return this.policyId;
    }
    
    public void SubscriptionRate.setPolicyId(SubscriptionPolicy policyId) {
        this.policyId = policyId;
    }
    
}
