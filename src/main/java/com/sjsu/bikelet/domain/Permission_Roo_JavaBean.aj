// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Permission;

privileged aspect Permission_Roo_JavaBean {
    
    public String Permission.getPermissionName() {
        return this.permissionName;
    }
    
    public void Permission.setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }
    
    public String Permission.getDescription() {
        return this.description;
    }
    
    public void Permission.setDescription(String description) {
        this.description = description;
    }
    
}
