/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RouteEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceTypeEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface ServiceTypeRepository extends JpaRepository<ServiceTypeEntity, Integer> {
    
    List<ServiceTypeEntity> findByDescriptionContaining(String description);
    
    ServiceTypeEntity findByNameContaining(String name);
    
    ServiceTypeEntity findById(long id);
}
