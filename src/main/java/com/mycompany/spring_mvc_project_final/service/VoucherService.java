/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.VoucherEntity;
import com.mycompany.spring_mvc_project_final.repository.VoucherRepository;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class VoucherService {

    @Autowired
    private VoucherRepository voucherRepository;

    public VoucherEntity checkPromoByCode(String vchCode, Date currentDate) {
        return voucherRepository.findVoucherByPromoCode(vchCode, currentDate);
    }

    public void updateVoucherQuantity(VoucherEntity voucherEntity) {
        voucherRepository.save(voucherEntity);
    }
}
