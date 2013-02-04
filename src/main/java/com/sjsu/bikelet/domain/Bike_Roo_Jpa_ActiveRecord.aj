// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.sjsu.bikelet.domain;

import com.sjsu.bikelet.domain.Bike;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Bike_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Bike.entityManager;
    
    public static final EntityManager Bike.entityManager() {
        EntityManager em = new Bike().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Bike.countBikes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Bike o", Long.class).getSingleResult();
    }
    
    public static List<Bike> Bike.findAllBikes() {
        return entityManager().createQuery("SELECT o FROM Bike o", Bike.class).getResultList();
    }
    
    public static Bike Bike.findBike(Long id) {
        if (id == null) return null;
        return entityManager().find(Bike.class, id);
    }
    
    public static List<Bike> Bike.findBikeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Bike o", Bike.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Bike.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Bike.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Bike attached = Bike.findBike(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Bike.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Bike.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Bike Bike.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Bike merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
