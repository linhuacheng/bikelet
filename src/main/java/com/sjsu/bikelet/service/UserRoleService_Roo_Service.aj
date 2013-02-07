// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.service;

import com.sjsu.bikelet.domain.UserRole;
import com.sjsu.bikelet.service.UserRoleService;
import java.util.List;

privileged aspect UserRoleService_Roo_Service {
    
    public abstract long UserRoleService.countAllUserRoles();    
    public abstract void UserRoleService.deleteUserRole(UserRole userRole);    
    public abstract UserRole UserRoleService.findUserRole(Long id);    
    public abstract List<UserRole> UserRoleService.findAllUserRoles();    
    public abstract List<UserRole> UserRoleService.findUserRoleEntries(int firstResult, int maxResults);    
    public abstract void UserRoleService.saveUserRole(UserRole userRole);    
    public abstract UserRole UserRoleService.updateUserRole(UserRole userRole);    
}