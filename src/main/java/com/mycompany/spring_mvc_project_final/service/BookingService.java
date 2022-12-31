/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    public void saveBooking(BookingEntity booking) {
        bookingRepository.save(booking);
    }

    public boolean checkExistedPNR(String pnr) {
        return bookingRepository.findByPNR(pnr) != null;
    }
    
    public BookingEntity checkPNRAndLastname(String pnr, String lastname){
        return bookingRepository.findByPNRAndLastName(pnr, lastname);
    }
}
