// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Program;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Program_Roo_Jpa_Entity {
    
    declare @type: Program: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Program.id;
    
    @Version
    @Column(name = "version")
    private Integer Program.version;
    
    public Long Program.getId() {
        return this.id;
    }
    
    public void Program.setId(Long id) {
        this.id = id;
    }
    
    public Integer Program.getVersion() {
        return this.version;
    }
    
    public void Program.setVersion(Integer version) {
        this.version = version;
    }
    
}
