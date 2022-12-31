/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.FlightFareEntity;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface FlightFareRepository extends JpaRepository<FlightFareEntity, Long> {

    @Query("select distinct f from FlightFareEntity f WHERE f.flight.id = ?1 AND f.availability >= ?2 AND f.fareType.classType = 'ECONOMY' GROUP BY f.fareType.classType")
    List<FlightFareEntity> listFltFareByEconomy(int flightId, int numOfPax);

    @Query("select distinct f from FlightFareEntity f WHERE f.flight.id = ?1 AND f.availability >= ?2 AND f.fareType.classType = 'BUSINESS' GROUP BY f.fareType.classType")
    List<FlightFareEntity> listFltFareByBusiness(int flightId, int numOfPax);

}
