/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.service;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.repository.BankAccountRepository;
import java.util.Calendar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ASUS
 */
@Service
public class BankAccountService {

    @Autowired
    private BankAccountRepository bankAccountRepository;

    public AccountBankingEntity validateBankAccount(String fullName, long balance, Calendar expiredDate, String cardNumber, int CVVcode) {
        return bankAccountRepository.findBankAccount(fullName, balance, expiredDate, cardNumber, CVVcode);
    }
    
    public void updateBalanceBankAcc(AccountBankingEntity accountBanking){
        bankAccountRepository.save(accountBanking);
    }
}
