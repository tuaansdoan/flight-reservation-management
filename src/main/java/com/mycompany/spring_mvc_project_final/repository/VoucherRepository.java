/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ServiceTypeEntity;
import com.mycompany.spring_mvc_project_final.entities.VoucherEntity;
import java.util.Date;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface VoucherRepository extends JpaRepository<VoucherEntity, Integer> {

    @Query("SELECT distinct v FROM VoucherEntity v WHERE v.vchCode = ?1 AND v.expiredDate >= ?2 AND v.quantity > 0")
    VoucherEntity findVoucherByPromoCode(String promoCode, Date currentDate);

}
