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
@Table(name = "Aircraft")
public class AircraftEntity implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length = 10)
    private String name;
    
    private int totalSeat;
    
    private int roww;
    
    private int coln;

    public long getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTotalSeat() {
        return totalSeat;
    }

    public void setTotalSeat(int totalSeat) {
        this.totalSeat = totalSeat;
    }

    public int getRoww() {
        return roww;
    }

    public void setRoww(int roww) {
        this.roww = roww;
    }

    public int getColn() {
        return coln;
    }

    public void setColn(int coln) {
        this.coln = coln;
    }

   
    
    
    
    
}
