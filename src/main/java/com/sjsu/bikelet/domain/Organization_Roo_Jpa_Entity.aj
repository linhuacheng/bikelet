// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Organization;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Organization_Roo_Jpa_Entity {
    
    declare @type: Organization: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Organization.id;
    
    @Version
    @Column(name = "version")
    private Integer Organization.version;
    
    public Long Organization.getId() {
        return this.id;
    }
    
    public void Organization.setId(Long id) {
        this.id = id;
    }
    
    public Integer Organization.getVersion() {
        return this.version;
    }
    
    public void Organization.setVersion(Integer version) {
        this.version = version;
    }
    
}
