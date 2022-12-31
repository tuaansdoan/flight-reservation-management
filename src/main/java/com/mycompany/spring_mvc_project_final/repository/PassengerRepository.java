/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface PassengerRepository extends JpaRepository<PassengerEntity, Long> {
    
    @Query("SELECT DISTINCT p FROM PassengerEntity p WHERE p.flight.id = ?1 AND p.seat <> ' ' ")
    List<PassengerEntity> findPaxByFltId(int fltId);
    
    
}
