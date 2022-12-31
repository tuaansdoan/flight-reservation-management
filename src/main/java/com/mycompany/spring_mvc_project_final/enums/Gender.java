/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Enum.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.enums;

/**
 *
 * @author ASUS
 */
public enum Gender {
    MALE("Male"), 
    FEMALE("Female");
    
    private String value;

    private Gender(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
