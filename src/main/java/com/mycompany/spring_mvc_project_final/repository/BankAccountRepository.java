/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import java.util.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ASUS
 */
@Repository
public interface BankAccountRepository extends JpaRepository<AccountBankingEntity, Long> {

    @Query("SELECT DISTINCT a FROM AccountBankingEntity a WHERE a.fullName = ?1 AND a.balance >= ?2 AND a.expiredDate >= ?3 AND a.cardNumber = ?4 AND a.CVVcode = ?5")
    AccountBankingEntity findBankAccount(String fullName, long balance, Calendar expiredDate, String cardNumber, int CVVcode);
}
