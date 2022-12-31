/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author ASUS
 */
@Entity
@Table(name = "route")
public class RouteEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "dept_id")
    private AirportEntity departure;

    @ManyToOne
    @JoinColumn(name = "dest_id")
    private AirportEntity destination;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public AirportEntity getDeparture() {
        return departure;
    }

    public void setDeparture(AirportEntity departure) {
        this.departure = departure;
    }

    public AirportEntity getDestination() {
        return destination;
    }

    public void setDestination(AirportEntity destination) {
        this.destination = destination;
    }
    
    
}
