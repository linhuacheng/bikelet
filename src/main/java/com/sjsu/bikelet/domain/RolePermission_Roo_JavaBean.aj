// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.BikeLetRole;
import com.sjsu.bikelet.domain.Permission;
import com.sjsu.bikelet.domain.RolePermission;

privileged aspect RolePermission_Roo_JavaBean {
    
    public Permission RolePermission.getPermissionId() {
        return this.permissionId;
    }
    
    public void RolePermission.setPermissionId(Permission permissionId) {
        this.permissionId = permissionId;
    }
    
    public BikeLetRole RolePermission.getRoleId() {
        return this.roleId;
    }
    
    public void RolePermission.setRoleId(BikeLetRole roleId) {
        this.roleId = roleId;
    }
    
}