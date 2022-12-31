/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import com.mycompany.spring_mvc_project_final.repository.FlightRepository;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class FlightService {
    
    @Autowired
    private FlightRepository flightRepository;
    
    public List<FlightEntity> getFlightByDateAndRoute(Date fltDate, int routeId){
        return flightRepository.searchByFlightDateAndRoute_Id(fltDate, routeId);      
    }
    
    public List<FlightEntity> getFlightByDateRouteAvail(Date fltDate, int routeId, int numOfPax){
        return flightRepository.searchByDateRouteAvail(fltDate, routeId, numOfPax);      
    }

    public FlightEntity getFltById(int flightId){
        return flightRepository.findById(flightId);
    }
   
}
