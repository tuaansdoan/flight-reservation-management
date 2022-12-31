/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightFareEntity;
import com.mycompany.spring_mvc_project_final.repository.FlightFareRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class FlightFareService {

    @Autowired
    private FlightFareRepository flightFareRepository;

    public List<FlightFareEntity> getFlightFareByEconomy(int flightId, int numOfPax) {
        return flightFareRepository.listFltFareByEconomy(flightId, numOfPax);
    }

    public List<FlightFareEntity> getFlightFareByBusiness(int flightId, int numOfPax) {
        return flightFareRepository.listFltFareByBusiness(flightId, numOfPax);
    }

    public FlightFareEntity getFltFareById(long fltFareId) {
        Optional<FlightFareEntity> optFltFare = flightFareRepository.findById(fltFareId);
        return optFltFare.get();
    }
    
     public void updateFlightFareAvaiability(FlightFareEntity flightFareEntity){
         flightFareRepository.save(flightFareEntity);
     }
    
}
