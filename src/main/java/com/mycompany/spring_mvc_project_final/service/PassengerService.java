/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.repository.PassengerRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class PassengerService {

    @Autowired
    private PassengerRepository passengerRepositoty;
    
    public List<PassengerEntity> getAllPaxByFltId(int fltId){
        return passengerRepositoty.findPaxByFltId(fltId);
    }
}
