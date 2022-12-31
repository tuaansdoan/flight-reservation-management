/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import java.util.Date;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface FlightRepository extends JpaRepository<FlightEntity, Integer> {

    List<FlightEntity> searchByFlightDateAndRoute_Id(Date fltDate, int routeId);

    @Query("SELECT distinct f FROM FlightEntity f JOIN FETCH f.flightFares k WHERE f.flightDate = ?1 AND f.route.id =?2 AND k.availability >= ?3")
    List<FlightEntity> searchByDateRouteAvail(Date fltDate, int routeId, int availability);

    @Query("SELECT distinct f FROM FlightEntity f WHERE f.id = ?1")
    FlightEntity findById(int flightId);

}
