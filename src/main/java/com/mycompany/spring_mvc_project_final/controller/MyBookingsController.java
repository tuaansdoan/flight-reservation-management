/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceTypeEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.service.BankAccountService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.EmailService;
import com.mycompany.spring_mvc_project_final.service.ServiceBookingService;
import com.mycompany.spring_mvc_project_final.service.ServiceTypeService;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author ASUS
 */
@Controller
public class MyBookingsController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private ServiceBookingService serviceBookingService;

    @Autowired
    private ServiceTypeService serviceTypeService;

    @Autowired
    private BankAccountService bankAccountService;

    @Autowired
    private EmailService emailService;

    SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm");
    SimpleDateFormat formatDate = new SimpleDateFormat("EEE, MMM dd, yyyy");
    DecimalFormat formatNum = new DecimalFormat("###,###,###");

    @RequestMapping(value = {"/my-bookings"}, method = RequestMethod.GET)
    public String myBookingsPage(Model model, HttpSession session
    ) {

        return "my-bookings";
    }

    @RequestMapping(value = {"/my-bookings"}, method = RequestMethod.POST)
    public String myBookingsPage(Model model, HttpSession session,
            @RequestParam("reference") String pnr,
            @RequestParam("lastname") String lastname
    ) {

        BookingEntity booking = bookingService.checkPNRAndLastname(pnr, lastname);

        List<ServiceBookingEntity> serviceBookings = new ArrayList<>();

        for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
            for (PassengerEntity pax : bkdt.getPassengers()) {
                List<ServiceBookingEntity> serBking = serviceBookingService.getServiceBookingByPaxId(pax.getId());
                serviceBookings.addAll(serBking);
                pax.setServiceBookings(serBking);

            }
        }

        model.addAttribute("booking", booking);
        model.addAttribute("serviceBookings", serviceBookings);

        session.setAttribute("booking", booking);
        session.setAttribute("serviceBookings", serviceBookings);
        session.setAttribute("baggageService", serviceTypeService.getAllBaggage());

        return "my-bookings";
    }

    @RequestMapping(value = "/check-myBookings", method = RequestMethod.POST)
    @ResponseBody
    public String checkMyBookings(@RequestParam("reference") String pnr,
            @RequestParam("lastname") String lastname
    ) {
        String ajaxResponse;

        BookingEntity booking = bookingService.checkPNRAndLastname(pnr, lastname);

        if (booking == null) {
            ajaxResponse = "fail";
        } else {
            ajaxResponse = "done";
        }

        return ajaxResponse;
    }

    @RequestMapping(value = "/cancel-booking", method = RequestMethod.POST)
    @ResponseBody
    public String cancelMyBookings(HttpSession session
    ) {
        String ajaxResponse;

        BookingEntity booking = (BookingEntity) session.getAttribute("booking");

        if (booking.getStatus().toString().equalsIgnoreCase("ACTIVE")) {
            long remainAmount = booking.getPayment().getAccountBanking().getBalance() + booking.getPayment().getAmount();
            booking.getPayment().getAccountBanking().setBalance(remainAmount);
            booking.getPayment().setAmount(0);
        }
        booking.setStatus(BookingStatus.CANCELLED);
        booking.setBalanceDue(0);

        for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
            bkdt.setStatus(BookingStatus.CANCELLED);
            for (PassengerEntity pax : bkdt.getPassengers()) {
                pax.setSeat("");
            }
        }

        bookingService.saveBooking(booking);

        session.setAttribute("booking", booking);

        ajaxResponse = "done";

        return ajaxResponse;
    }

    @RequestMapping(value = "/cancel-detail", method = RequestMethod.POST)
    @ResponseBody
    public String cancelBookingDetail(HttpSession session,
            @RequestParam("bookingDetailId") long bookingDetailId
    ) {
        String ajaxResponse;

        BookingEntity booking = (BookingEntity) session.getAttribute("booking");

        int numOfPax = booking.getBookingDetails().get(0).getPassengers().size();

        if (booking.getStatus().toString().equalsIgnoreCase("ONHOLD")) {

            for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
                if (bkdt.getId() == bookingDetailId) {
                    bkdt.setStatus(BookingStatus.CANCELLED);
                    for (PassengerEntity pax : bkdt.getPassengers()) {
                        pax.setSeat("");
                    }
                    long balanceDueRemain = booking.getBalanceDue() - bkdt.getFlightFare().getNetPrice() * numOfPax;
                    booking.setBalanceDue(balanceDueRemain);

                }

            }

        }

        if (booking.getStatus().toString().equalsIgnoreCase("ACTIVE")) {
            for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
                if (bkdt.getId() == bookingDetailId) {
                    bkdt.setStatus(BookingStatus.CANCELLED);
                    for (PassengerEntity pax : bkdt.getPassengers()) {
                        pax.setSeat("");
                    }
                    long remainAmount = booking.getPayment().getAccountBanking().getBalance() + bkdt.getFlightFare().getNetPrice() * numOfPax;
                    booking.getPayment().getAccountBanking().setBalance(remainAmount);

                    booking.getPayment().setAmount(booking.getPayment().getAmount() - bkdt.getFlightFare().getNetPrice() * numOfPax);
                }

            }

        }

        //set cancelled booking if all booking details cancelled
        int count = 0;
        for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
            if (bkdt.getStatus().toString().equalsIgnoreCase("CANCELLED")) {
                count++;
            }
        }

        if (count == booking.getBookingDetails().size()) {
            booking.setStatus(BookingStatus.CANCELLED);
        }

        bookingService.saveBooking(booking);

        session.setAttribute("booking", booking);

        ajaxResponse = "done";

        return ajaxResponse;
    }

    @RequestMapping(value = "/pay-due", method = RequestMethod.POST)
    @ResponseBody
    public String payBalanceDue(
            @RequestParam(name = "fullname", required = false) String fullname,
            @RequestParam(name = "month", required = false) int month,
            @RequestParam(name = "year", required = false) int year,
            @RequestParam(name = "cardNumber", required = false) String cardNumber,
            @RequestParam(name = "cvv", required = false) int cvv,
            @RequestParam("totalDue") long totalDue,
            HttpSession session) throws Exception {
        String ajaxResponse = "";

        BookingEntity booking = (BookingEntity) session.getAttribute("booking");

        Calendar expiredDate = Calendar.getInstance();
        expiredDate.set(year, month, 31);

        cardNumber = cardNumber.replaceAll("\\s", "");

        AccountBankingEntity accountBanking = bankAccountService.validateBankAccount(fullname, totalDue, expiredDate, cardNumber, cvv);

        if (accountBanking == null) {
            ajaxResponse = "<div class='row justify-content-center invalidcard'> <h4 class='text-danger'> *Invalid card, please try again! </h4></div>";

        } else {
            //set paymentEntity            
            long totalPayment = 0;

            if (booking.getStatus().toString().equalsIgnoreCase("ACTIVE")) {

                if (accountBanking.getId() != booking.getPayment().getAccountBanking().getId()) {
                    ajaxResponse = "<div class='row justify-content-center invalidcard'> <h4 class='text-danger'> *Enter previous card, please try again! </h4></div>";
                    return ajaxResponse;
                } else {
                    totalPayment = booking.getPayment().getAmount() + totalDue;
                    booking.getPayment().setAmount(totalPayment);
                }
            }

            if (booking.getStatus().toString().equalsIgnoreCase("ONHOLD")) {
                totalPayment = totalDue;

                PaymentEntity payment = new PaymentEntity();

                payment.setAmount(totalPayment);
                payment.setPaymentDate(new Date());
                payment.setBooking(booking);
                payment.setAccountBanking(accountBanking);
                booking.setPayment(payment);

            }
            booking.setBalanceDue(0);

            //subtract balance in bank account
            long remainAmount = accountBanking.getBalance() - totalDue;
            accountBanking.setBalance(remainAmount);
            bankAccountService.updateBalanceBankAcc(accountBanking);
            booking.getPayment().setAccountBanking(accountBanking);

            booking.setStatus(BookingStatus.ACTIVE);

            bookingService.saveBooking(booking);
            session.setAttribute("booking", booking);

            String textContent = "Booking reference: " + booking.getPNR()
                    + "\nStatus: " + booking.getStatus()
                    + "\nFull name: " + booking.getFirstName() + " " + booking.getLastName()
                    + "\nTotal payment: " + formatNum.format(totalDue) + " VND"
                    + "\nThank you and have a good day!";

            emailService.sendSimpleMessage(booking.getEmail(), "Ariel Airways - Booking Payment", textContent);

            ajaxResponse = "<div class='text-center'>"
                    + "<h4 class='text-primary bksc'> Pay Successfully! <h4>"
                    + "<h5> Thank you and enjoy your flights!</h5>"
                    + "<h5> Ariel Airways - Explore The World With Ease! </h5>"
                    + "</div>";
        }
        return ajaxResponse;
    }

    @RequestMapping(value = {"/update-services"}, method = RequestMethod.POST)
    public String updateServices(Model model, HttpSession session,
            @ModelAttribute("bookingPax") BookingEntity bookingPax
    ) {

        BookingEntity booking = (BookingEntity) session.getAttribute("booking");

        int numOfBookingDetail = booking.getBookingDetails().size();
        int numOfPax = booking.getBookingDetails().get(0).getPassengers().size();

        for (int j = 0; j < numOfBookingDetail; j++) {

            for (int i = 0; i < numOfPax; i++) {

                ServiceTypeEntity serviceType = serviceTypeService.getServiceTypeById(bookingPax.getBookingDetails().get(j).getPassengers().get(i).getServiceBookings().get(0).getServiceType().getId());

                List<ServiceBookingEntity> serviceBookings = new ArrayList<>();

                if (serviceType != null) {
                    ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                    serviceBooking.setQuantity(1);
                    serviceBooking.setServiceType(serviceType);
                    serviceBooking.setPassenger(booking.getBookingDetails().get(j).getPassengers().get(i));
                    serviceBookings.add(serviceBooking);
                }

                booking.getBookingDetails().get(j).getPassengers().get(i).setServiceBookings(serviceBookings);
                booking.getBookingDetails().get(j).getPassengers().get(i).setSeat(bookingPax.getBookingDetails().get(j).getPassengers().get(i).getSeat());

            }
        }
        bookingService.saveBooking(booking);
        session.setAttribute("booking", booking);
        return "my-bookings";
    }
}
