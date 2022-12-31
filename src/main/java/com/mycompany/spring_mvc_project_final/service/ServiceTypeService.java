/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceTypeEntity;
import com.mycompany.spring_mvc_project_final.repository.ServiceTypeRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class ServiceTypeService {

    @Autowired
    private ServiceTypeRepository serviceTypeRepository;

    public List<ServiceTypeEntity> getAllBaggage() {
        return serviceTypeRepository.findByDescriptionContaining("BAGGAGE");
    }

    public ServiceTypeEntity getUpFrontSeat() {
        return serviceTypeRepository.findByNameContaining("UPFX");

    }

    public ServiceTypeEntity getStandardSeat() {
        return serviceTypeRepository.findByNameContaining("STDX");

    }
    
    public ServiceTypeEntity getServiceTypeById(long id){
         return serviceTypeRepository.findById(id);
    }

}
