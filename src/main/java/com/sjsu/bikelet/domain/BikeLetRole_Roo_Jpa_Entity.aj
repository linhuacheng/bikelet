// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.BikeLetRole;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect BikeLetRole_Roo_Jpa_Entity {
    
    declare @type: BikeLetRole: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long BikeLetRole.id;
    
    @Version
    @Column(name = "version")
    private Integer BikeLetRole.version;
    
    public Long BikeLetRole.getId() {
        return this.id;
    }
    
    public void BikeLetRole.setId(Long id) {
        this.id = id;
    }
    
    public Integer BikeLetRole.getVersion() {
        return this.version;
    }
    
    public void BikeLetRole.setVersion(Integer version) {
        this.version = version;
    }
    
}
