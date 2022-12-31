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
@Table(name = "flight_fare")
public class FlightFareEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private long netPrice;

    private int availability;

    @ManyToOne
    @JoinColumn(name = "fare_type_id")
    private FareTypeEntity fareType;

    @ManyToOne
    @JoinColumn(name = "flight_id")
    private FlightEntity flight;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getNetPrice() {
        return netPrice;
    }

    public void setNetPrice(long netPrice) {
        this.netPrice = netPrice;
    }

    public int getAvailability() {
        return availability;
    }

    public void setAvailability(int availability) {
        this.availability = availability;
    }

    public FareTypeEntity getFareType() {
        return fareType;
    }

    public void setFareType(FareTypeEntity fareType) {
        this.fareType = fareType;
    }

    public FlightEntity getFlight() {
        return flight;
    }

    public void setFlight(FlightEntity flight) {
        this.flight = flight;
    }

    @Override
    public String toString() {
        return "FlightFareEntity{" + "id=" + id + ", netPrice=" + netPrice + ", availability=" + availability + ", fareType=" + fareType + ", flight=" + flight + '}';
    }

    
}
