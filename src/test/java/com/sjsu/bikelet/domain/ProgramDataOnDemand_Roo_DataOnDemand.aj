// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Program;
import com.sjsu.bikelet.domain.ProgramDataOnDemand;
import com.sjsu.bikelet.domain.TenantDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect ProgramDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ProgramDataOnDemand: @Component;
    
    private Random ProgramDataOnDemand.rnd = new SecureRandom();
    
    private List<Program> ProgramDataOnDemand.data;
    
    @Autowired
    TenantDataOnDemand ProgramDataOnDemand.tenantDataOnDemand;
    
    public Program ProgramDataOnDemand.getNewTransientProgram(int index) {
        Program obj = new Program();
        setContactId(obj, index);
        setDescription(obj, index);
        setMax_threshold(obj, index);
        setMin_threshold(obj, index);
        setOrgName(obj, index);
        setProgramName(obj, index);
        return obj;
    }
    
    public void ProgramDataOnDemand.setContactId(Program obj, int index) {
        Integer contactId = new Integer(index);
        obj.setContactId(contactId);
    }
    
    public void ProgramDataOnDemand.setDescription(Program obj, int index) {
        String description = "description_" + index;
        if (description.length() > 255) {
            description = description.substring(0, 255);
        }
        obj.setDescription(description);
    }
    
    public void ProgramDataOnDemand.setMax_threshold(Program obj, int index) {
        Integer max_threshold = new Integer(index);
        obj.setMax_threshold(max_threshold);
    }
    
    public void ProgramDataOnDemand.setMin_threshold(Program obj, int index) {
        Integer min_threshold = new Integer(index);
        obj.setMin_threshold(min_threshold);
    }
    
    public void ProgramDataOnDemand.setOrgName(Program obj, int index) {
        String orgName = "orgName_" + index;
        if (orgName.length() > 30) {
            orgName = orgName.substring(0, 30);
        }
        obj.setOrgName(orgName);
    }
    
    public void ProgramDataOnDemand.setProgramName(Program obj, int index) {
        String programName = "programName_" + index;
        if (programName.length() > 60) {
            programName = programName.substring(0, 60);
        }
        obj.setProgramName(programName);
    }
    
    public Program ProgramDataOnDemand.getSpecificProgram(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Program obj = data.get(index);
        Long id = obj.getId();
        return Program.findProgram(id);
    }
    
    public Program ProgramDataOnDemand.getRandomProgram() {
        init();
        Program obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Program.findProgram(id);
    }
    
    public boolean ProgramDataOnDemand.modifyProgram(Program obj) {
        return false;
    }
    
    public void ProgramDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Program.findProgramEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Program' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Program>();
        for (int i = 0; i < 10; i++) {
            Program obj = getNewTransientProgram(i);
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
