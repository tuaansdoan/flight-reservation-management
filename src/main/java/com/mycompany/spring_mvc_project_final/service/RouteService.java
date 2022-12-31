/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.RouteEntity;
import com.mycompany.spring_mvc_project_final.repository.RouteRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class RouteService {

    @Autowired
    private RouteRepository routeRepository;

    public List<RouteEntity> listDeparture() {
        return routeRepository.findDeparture();
    }

    public List<RouteEntity> listDestination(int deptId) {
        return routeRepository.findByDeparture_Id(deptId);
    }
    
    public int getId(int dept, int dest){
        return routeRepository.findByDeparture_IdAndDestination_Id(dept, dest).getId();
    }
    
    public RouteEntity getRoute(int dept, int dest){
        return routeRepository.findByDeparture_IdAndDestination_Id(dept, dest);
    }
}
