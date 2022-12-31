/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.RouteEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface RouteRepository extends JpaRepository<RouteEntity, Integer> {
    
    @Query("select distinct r from RouteEntity r group by r.departure")
    List<RouteEntity> findDeparture();
    
//    @Query("select distinct r from RouteEntity r where r.departure.id = ?1")
    List<RouteEntity> findByDeparture_Id(int id);
    
    RouteEntity findByDeparture_IdAndDestination_Id(int dept, int dest);
}
