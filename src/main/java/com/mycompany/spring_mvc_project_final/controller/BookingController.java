/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountBankingEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingDetailEntity;
import com.mycompany.spring_mvc_project_final.entities.BookingEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightEntity;
import com.mycompany.spring_mvc_project_final.entities.FlightFareEntity;
import com.mycompany.spring_mvc_project_final.entities.PassengerEntity;
import com.mycompany.spring_mvc_project_final.entities.PaymentEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceBookingEntity;
import com.mycompany.spring_mvc_project_final.entities.ServiceTypeEntity;
import com.mycompany.spring_mvc_project_final.entities.VoucherEntity;
import com.mycompany.spring_mvc_project_final.enums.BookingStatus;
import com.mycompany.spring_mvc_project_final.enums.Gender;
import com.mycompany.spring_mvc_project_final.service.BankAccountService;
import com.mycompany.spring_mvc_project_final.service.BookingDetailService;
import com.mycompany.spring_mvc_project_final.service.BookingService;
import com.mycompany.spring_mvc_project_final.service.EmailService;
import com.mycompany.spring_mvc_project_final.service.FlightFareService;
import com.mycompany.spring_mvc_project_final.service.FlightService;
import com.mycompany.spring_mvc_project_final.service.PassengerService;
import com.mycompany.spring_mvc_project_final.service.RouteService;
import com.mycompany.spring_mvc_project_final.service.ServiceTypeService;
import com.mycompany.spring_mvc_project_final.service.VoucherService;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpSession;
import net.bytebuddy.utility.RandomString;
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
public class BookingController {

    @Autowired
    private RouteService routeService;

    @Autowired
    private FlightService flightService;

    @Autowired
    private FlightFareService flightFareService;

    @Autowired
    private ServiceTypeService serviceTypeService;

    @Autowired
    private PassengerService passengerService;

    @Autowired
    private VoucherService voucherService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private BookingDetailService bookingDetailService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private BankAccountService bankAccountService;

    SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm");
    SimpleDateFormat formatDate = new SimpleDateFormat("EEE, MMM dd, yyyy");
    DecimalFormat formatNum = new DecimalFormat("###,###,###");

    @RequestMapping(value = {"/search-flight"}, method = RequestMethod.POST)
    public String searchPage(Model model,
            @RequestParam("departure") int departure,
            @RequestParam("destination") int destination,
            @RequestParam("departureDate") Date departureDate,
            @RequestParam(name = "returnDate", required = false) Date returnDate,
            @RequestParam("numOfPax") int numOfPax,
            HttpSession session
    ) {

        //SESSION
        session.setAttribute("numOfPax", numOfPax);
        session.setAttribute("departure", departure);
        session.setAttribute("destination", destination);

        //departure flight
        List<FlightEntity> flights = flightService.getFlightByDateAndRoute(departureDate, routeService.getId(departure, destination));

        if (flights.isEmpty()) {
            model.addAttribute("msg", "*No available flights on the departure day!");
            return "index";
        } else {

            model.addAttribute("flights", flights);

            List<FlightFareEntity> economyFltFares = new ArrayList<>();
            List<FlightFareEntity> businessFltFares = new ArrayList<>();

            for (FlightEntity fe : flights) {
                economyFltFares.addAll(flightFareService.getFlightFareByEconomy(fe.getId(), numOfPax));
                businessFltFares.addAll(flightFareService.getFlightFareByBusiness(fe.getId(), numOfPax));
            }

            model.addAttribute("economyFltFares", economyFltFares);
            model.addAttribute("businessFltFares", businessFltFares);
        }

        //return flight
        if (returnDate != null) {
            List<FlightEntity> returnflights = flightService.getFlightByDateAndRoute(returnDate, routeService.getId(destination, departure));

            if (returnflights.isEmpty()) {
                model.addAttribute("msg", "*No available flights on the return day!");
                return "index";
            } else {
                model.addAttribute("returnflights", returnflights);

                List<FlightFareEntity> ecoReturnFltFares = new ArrayList<>();
                List<FlightFareEntity> busiReturnFltFares = new ArrayList<>();

                for (FlightEntity fe : returnflights) {
                    ecoReturnFltFares.addAll(flightFareService.getFlightFareByEconomy(fe.getId(), numOfPax));
                    busiReturnFltFares.addAll(flightFareService.getFlightFareByBusiness(fe.getId(), numOfPax));
                }

                model.addAttribute("ecoReturnFltFares", ecoReturnFltFares);
                model.addAttribute("busiReturnFltFares", busiReturnFltFares);

            }
        }

        model.addAttribute("route", routeService.getRoute(departure, destination));

        return "booking";
    }

    @RequestMapping(value = "/change-date", method = RequestMethod.POST)
    @ResponseBody
    public String changeDate(
            @RequestParam("date") Date departureDate,
            @RequestParam("departure") int departure,
            @RequestParam("destination") int destination,
            @RequestParam("roundTrip") String roundTrip,
            HttpSession session) {

        int numOfPax = (int) session.getAttribute("numOfPax");

        List<FlightEntity> flights = flightService.getFlightByDateAndRoute(departureDate, routeService.getId(departure, destination));
        List<FlightFareEntity> economyFltFares = new ArrayList<>();
        List<FlightFareEntity> businessFltFares = new ArrayList<>();

        for (FlightEntity fe : flights) {
            economyFltFares.addAll(flightFareService.getFlightFareByEconomy(fe.getId(), numOfPax));
            businessFltFares.addAll(flightFareService.getFlightFareByBusiness(fe.getId(), numOfPax));
        }

        String statusId = "";
        if (roundTrip.equalsIgnoreCase("departure")) {
            statusId = "dept-date";
        }
        if (roundTrip.equalsIgnoreCase("return")) {
            statusId = "return-date";
        }

        String ajaxResponse = "";

        ajaxResponse += "<tr> <th class=\"col-4\" id=" + statusId + "> <span class=\"text-success\">" + roundTrip.toUpperCase() + " </span>" + formatDate.format(departureDate) + "</th>"
                + "<th class='col-4 text-center'> ECONOMY </th>"
                + "<th class='col-4 text-center'> BUSINESS </th> </tr>";

        for (int i = 0; i < flights.size(); i++) {

            ajaxResponse += "<tr>"
                    + "<td > <div class='row align-items-center '> "
                    + " <div class='col-md-4 '> " + "<span class='fs-5' id='dept-time-" + flights.get(i).getId() + "'>" + formatTime.format(flights.get(i).getDepartureTime()) + "</span> <br>"
                    + flights.get(i).getRoute().getDeparture().getName() + "</div>"
                    + "<div class='col-md-4 text-center'> <i class='ion-arrow-right-a'></i>"
                    + "<h6 id='fltNum" + flights.get(i).getId() + "'>" + flights.get(i).getFlightNumber() + "</h6> </div>"
                    + "<div class='col-md-4'> <span class='fs-5' id='arrv-time-" + flights.get(i).getId() + "'>" + formatTime.format(flights.get(i).getArrivalTime()) + "</span><br>"
                    + flights.get(i).getRoute().getDestination().getName() + "</div></div></td>";

            ajaxResponse += "<td class='align-middle economy'>";
            for (FlightFareEntity e : economyFltFares) {
                if (e.getFlight().getId() == flights.get(i).getId()) {
                    ajaxResponse += "<label for='fare-" + roundTrip + "'>" + formatNum.format(e.getNetPrice()) + "</label> "
                            + "<input type='radio'  name='fare-" + roundTrip + "'  value='" + e.getNetPrice() + "' onclick=\"selectFlight(" + flights.get(i).getId() + ",value,'ECONOMY'," + e.getId() + ",'" + roundTrip + "')\">";
                }
            }
            ajaxResponse += "</td>";

            ajaxResponse += "<td class='align-middle business'>";
            for (FlightFareEntity b : businessFltFares) {
                if (b.getFlight().getId() == flights.get(i).getId()) {
                    ajaxResponse += "<label for='fare-" + roundTrip + "'>" + formatNum.format(b.getNetPrice()) + "</label> "
                            + "<input type='radio' name='fare-" + roundTrip + "' value='" + b.getNetPrice() + "' onclick=\"selectFlight(" + flights.get(i).getId() + ",value,'BUSINESS'," + b.getId() + ",'" + roundTrip + "')\">";
                }
            }
            ajaxResponse += "</td> </tr>";
        }
        return ajaxResponse;
    }

    @RequestMapping(value = {"/passenger-detail"}, method = RequestMethod.POST)
    public String passengerPage(Model model, HttpSession session,
            @RequestParam("fltFareId-departure") long fltFareIdDept,
            @RequestParam(name = "fltFareId-return", required = false, defaultValue = "0") long fltFareIdReturn,
            @RequestParam("grand-total") long grandTotal
    ) {

        FlightFareEntity fltFareDept = flightFareService.getFltFareById(fltFareIdDept);
        if (fltFareIdReturn > 0) {
            FlightFareEntity fltFareRetn = flightFareService.getFltFareById(fltFareIdReturn);
            session.setAttribute("fltFareRetn", fltFareRetn); //SESSION
        }

        session.setAttribute("fltFareDept", fltFareDept); //SESSION
        session.setAttribute("gender", Gender.values());
        session.setAttribute("grandTotal", grandTotal);

        return "passenger-detail";
    }

    @RequestMapping(value = {"/extra-service"}, method = RequestMethod.POST)
    public String servicePage(Model model, HttpSession session,
            @ModelAttribute("bookingDetail") BookingDetailEntity bookingDetail
    ) {
        FlightFareEntity fltFareDept = (FlightFareEntity) session.getAttribute("fltFareDept");

        List<BookingDetailEntity> bookingDetails = new ArrayList<>();

        BookingDetailEntity bookingDetailDept = new BookingDetailEntity();
        List<PassengerEntity> deptPassengers = new ArrayList<>();

        for (PassengerEntity pax : bookingDetail.getPassengers()) {
            PassengerEntity deptPassenger = new PassengerEntity();
            deptPassenger.setFirstName(pax.getFirstName());
            deptPassenger.setLastName(pax.getLastName());
            deptPassenger.setBirthDate(pax.getBirthDate());
            deptPassenger.setGender(pax.getGender());
            deptPassengers.add(deptPassenger);
        }

        bookingDetailDept.setPassengers(deptPassengers);
        bookingDetailDept.setFlightFare(fltFareDept);
        bookingDetailDept.setBooking(bookingDetail.getBooking());
        bookingDetails.add(bookingDetailDept);

        //return
        FlightFareEntity fltFareRetn = (FlightFareEntity) session.getAttribute("fltFareRetn");
        if (fltFareRetn != null) {
            BookingDetailEntity bookingDetailRetn = new BookingDetailEntity();
            List<PassengerEntity> returnPassengers = new ArrayList<>();

            for (PassengerEntity pax : bookingDetail.getPassengers()) {
                PassengerEntity retnPassenger = new PassengerEntity();
                retnPassenger.setFirstName(pax.getFirstName());
                retnPassenger.setLastName(pax.getLastName());
                retnPassenger.setBirthDate(pax.getBirthDate());
                retnPassenger.setGender(pax.getGender());
                returnPassengers.add(retnPassenger);
            }
            bookingDetailRetn.setFlightFare(fltFareRetn);
            bookingDetailRetn.setBooking(bookingDetail.getBooking());
            bookingDetailRetn.setPassengers(returnPassengers);
            bookingDetails.add(bookingDetailRetn);
        }

        for (BookingDetailEntity bkdt : bookingDetails) {
            for (PassengerEntity p : bkdt.getPassengers()) {
                p.setFlight(bkdt.getFlightFare().getFlight());
                p.setBookingDetail(bkdt);
            }
        }

        session.setAttribute("bookingDetails", bookingDetails); //SESSION
        session.setAttribute("baggageService", serviceTypeService.getAllBaggage());

        return "service";
    }

    @RequestMapping(value = "/seat-map", method = RequestMethod.POST)
    @ResponseBody
    public String displaySeat(HttpSession session,
            @RequestParam("flightId") int flightId) {

        FlightEntity flight = flightService.getFltById(flightId);

        List<PassengerEntity> passengers = passengerService.getAllPaxByFltId(flightId);

        String ajaxResponse = "";
        char w = 65; //set character A
        int row = flight.getAircraft().getRoww();
        int col = flight.getAircraft().getColn();
        long price;
        String borderStt;

        ajaxResponse += "<tr>";
        for (int h = 0; h <= col; h++) {

            if (h == (col / 2)) {
                ajaxResponse += "<th></th>";
            } else {
                ajaxResponse += "<th class='text-center'>" + w + "</th>";
                w++;
            }
        }
        ajaxResponse += "</tr>";

        for (int r = 1; r <= row; r++) {

            if (r >= 1 && r <= 5) {
                price = serviceTypeService.getUpFrontSeat().getPrice();
                borderStt = "warning";
            } else {
                price = serviceTypeService.getStandardSeat().getPrice();
                borderStt = "info";
            }

            ajaxResponse += "<tr>";
            char c = 65;//set character A

            for (int i = 0; i <= col; i++) {

                if (i == (col / 2)) {
                    ajaxResponse += "<td style='width: 20px;height: 20px; text-align: center'>" + r + "</td>";
                } else {

                    boolean assigned = false;//count assigned seat

                    //check pax assigned seat already
                    for (PassengerEntity p : passengers) {
                        if (p.getSeat().charAt(p.getSeat().length() - 1) == (char) c && Integer.parseInt(p.getSeat().substring(0, p.getSeat().length() - 1)) == r) {

                            ajaxResponse += "<td style='text-align: center'> <button disabled type='button' class='border border-" + borderStt + " bg-info m-1' id='seat-" + r + (char) c + "-" + flightId + "' style='width: 20px; height: 20px' onclick='pickUpSeat(\"" + r + (char) c + "\"," + flightId + ")' ></button> </td>";
                            c++;
                            assigned = true;
                            break;
//                           
                        }
                    }

                    if (assigned == false) {
                        ajaxResponse += "<td style='text-align: center'> <button  data-toggle=\"tooltip\" data-placement=\"top\" title=\"" + "Seat price: " + price + " VND \" type='button' class='border border-" + borderStt + " bg-white m-1' id='seat-" + r + (char) c + "-" + flightId + "' style='width: 20px; height: 20px' onclick='pickUpSeat(\"" + r + (char) c + "\"," + price + "," + flightId + ")' ></button> </td>";
                        c++;
                    }
                }
            }

            ajaxResponse += "</tr>";

            if (r == 10 || r == 20 || r == 5) {
                ajaxResponse += "<tr> <td style='width: 30px;height: 30px;'> </td> </tr>";
            }
        }
        return ajaxResponse;
    }

    @RequestMapping(value = {"/payment-detail"}, method = RequestMethod.POST)
    public String paymentPage(Model model, HttpSession session,
            @RequestParam("grand-total") long grandTotal,
            @ModelAttribute("bookingpax") BookingEntity bookingPax
    ) {
        int numOfPax = (int) session.getAttribute("numOfPax");
        FlightFareEntity fltFareRetn = (FlightFareEntity) session.getAttribute("fltFareRetn");

        List<BookingDetailEntity> bookingDetails = (List<BookingDetailEntity>) session.getAttribute("bookingDetails");

        int numOfBookingDetail = 1;
        if (fltFareRetn != null) {
            numOfBookingDetail = 2;
        }
        for (int j = 0; j < numOfBookingDetail; j++) {

            for (int i = 0; i < numOfPax; i++) {

                ServiceTypeEntity serviceType = serviceTypeService.getServiceTypeById(bookingPax.getBookingDetails().get(j).getPassengers().get(i).getServiceBookings().get(0).getServiceType().getId());

                List<ServiceBookingEntity> serviceBookings = new ArrayList<>();

                if (serviceType != null) {
                    ServiceBookingEntity serviceBooking = new ServiceBookingEntity();
                    serviceBooking.setQuantity(1);
                    serviceBooking.setServiceType(serviceType);
                    serviceBooking.setPassenger(bookingDetails.get(j).getPassengers().get(i));
                    serviceBookings.add(serviceBooking);
                }

                bookingDetails.get(j).getPassengers().get(i).setServiceBookings(serviceBookings);
                bookingDetails.get(j).getPassengers().get(i).setSeat(bookingPax.getBookingDetails().get(j).getPassengers().get(i).getSeat());

            }
        }

        //set total seat amount
        List<Long> seatPrice = new ArrayList<>();
        long totalSeatPrice = 0;
        for (BookingDetailEntity bkdt : bookingDetails) {
            for (PassengerEntity pax : bkdt.getPassengers()) {
                if (!pax.getSeat().isEmpty() && Integer.parseInt(pax.getSeat().substring(0, pax.getSeat().length() - 1)) > 5) {
                    seatPrice.add(30000l);
                    totalSeatPrice += 30000;
                } else if (!pax.getSeat().isEmpty()) {
                    seatPrice.add(90000l);
                    totalSeatPrice += 90000;
                }
            }
        }

        long totalBagPrice = 0;
        for (BookingDetailEntity bkdt : bookingDetails) {
            for (PassengerEntity pax : bkdt.getPassengers()) {
                for (ServiceBookingEntity svbk : pax.getServiceBookings()) {
                    if (svbk != null) {
                        totalBagPrice += svbk.getServiceType().getPrice();
                    }
                }
            }
        }

        session.setAttribute("grandTotal", grandTotal);
        session.setAttribute("totalBagPrice", totalBagPrice);
        session.setAttribute("totalSeatPrice", totalSeatPrice);
        session.setAttribute("seatPrice", seatPrice);
        session.setAttribute("bookingDetails", bookingDetails);

        return "payment";
    }

    @RequestMapping(value = "/promotion-check", method = RequestMethod.POST)
    @ResponseBody
    public String checkPromotionCode(@RequestParam("promoCode") String promoCode) {
        String ajaxResponse = "";
        VoucherEntity voucher = voucherService.checkPromoByCode(promoCode, new Date());

        if (voucher != null) {
            ajaxResponse += "<h6 class='text-primary'> Discount <span> " + formatNum.format(voucher.getVchValue()) + "</span> VND </h6>"
                    + "<input type='text' id='promoValue' hidden value='" + voucher.getVchValue() + "'>";

        } else {
            ajaxResponse += "<h6 class='text-danger'> *Invalid promotion code </h6>"
                    + "<input type='text' id='promoValue' hidden value='0'>";
        }

        return ajaxResponse;
    }

    @RequestMapping(value = "/payment-booking", method = RequestMethod.POST)
    @ResponseBody
    public String confirmBooking(@RequestParam("paymentMethod") String paymentMethod,
            @RequestParam("grandTotal") long grandTotal,
            HttpSession session) {

        List<BookingDetailEntity> bookingDetails = (List<BookingDetailEntity>) session.getAttribute("bookingDetails");

        String ajaxResponse = "";

        //set PNR
        String PNR = bookingDetails.get(0).getBooking().getPNR();
        boolean check;
        if (PNR == null) {
            do {
                PNR = RandomString.make(6).toUpperCase();
                check = bookingService.checkExistedPNR(PNR);
            } while (check == true);

            for (BookingDetailEntity bkdt : bookingDetails) {
                bkdt.getBooking().setPNR(PNR.toUpperCase());
            }

        }

        BookingEntity booking = bookingDetails.get(0).getBooking();
        booking.setBookingDetails(bookingDetails);
        booking.setPNR(PNR);
        booking.setBalanceDue(grandTotal);

        session.setAttribute("booking", booking);
        session.setAttribute("bookingDetails", bookingDetails);

        // return payment modal
        if (paymentMethod.equalsIgnoreCase("Pay Later")) {

            ajaxResponse = "<div class='row'>"
                    + "<div class='col-md-12 text-center'>"
                    + "<h4> Your Booking Reference: <span class='text-primary'> <strong>" + PNR + "</strong> </span></h4>"
                    + "<h4> Total on-hold payment: <strong>" + formatNum.format(grandTotal) + "</strong> VND </h4> <br>"
                    + "<h5 class='text-warning'> Please make payment as soon as possible!</h5>"
                    + "</div>"
                    + "</div>";

        } else if (paymentMethod.equalsIgnoreCase("Pay Now")) {
            ajaxResponse = "<div class='row'>"
                    + "<div class='col-md-12 text-center'>"
                    + "<h4> Your Booking Reference: <span class='text-primary'> <strong>" + PNR + "</strong> </span></h4> <br>"
                    + "<h4> Total: <strong>" + formatNum.format(grandTotal) + "</strong> VND </h4>"
                    + " <h5> Please enter your Card Banking information below: </h5>"
                    + "<div class='row justify-content-center'>"
                    + "<div class='col-md-8 p-3 m-2 border border-primary rounded text-left'>"
                    + "<div class='row mb-3 text-left'>"
                    + "<div class='col-md-6'>"
                    + "<label for='fullname' >Full Name</label>"
                    + "<input type='text' id='fullname' class='form-control' value=''>"
                    + "</div>"
                    + "<div class='col-md-3'> "
                    + "<label for='month' >Month (MM)</label>"
                    + "<input required type='number' min='1' max='12' id='month' class='form-control'>"
                    + "</div> "
                    + "<div class='col-md-3'>"
                    + "<label for='year' >Year (YY)</label>"
                    + "<input type='number' min='1' id='year' class='form-control' >"
                    + "</div>"
                    + "</div>"
                    + "<div class='row text-left'>"
                    + "<div class='col-md-8'>"
                    + "<label for='card-number' >Card number (xxxx xxxx xxxx xxxx)</label>"
                    + "<input type='text' id='card-number' class='form-control'>"
                    + "</div>"
                    + "<div class='col-md-4'>"
                    + "<label for='cvv' >CVV (xxx)</label>"
                    + "<input type='number' min='0' id='cvv' class='form-control' >"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>"
                    + "</div>";
        }

        return ajaxResponse;
    }

    @RequestMapping(value = "/pay-later", method = RequestMethod.POST)
    @ResponseBody
    public String payBookingLater(@RequestParam("promoCode") String promoCode,
            @RequestParam("grandTotal") long grandTotal,
            HttpSession session) {

        int numOfPax = (int) session.getAttribute("numOfPax");
        BookingEntity booking = (BookingEntity) session.getAttribute("booking");

        //set flight fare
        for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
            int remainAvail = bkdt.getFlightFare().getAvailability() - numOfPax;
            bkdt.getFlightFare().setAvailability(remainAvail);
            flightFareService.updateFlightFareAvaiability(bkdt.getFlightFare());

            bkdt.setStatus(BookingStatus.ACTIVE);

        }

        //set voucher
        int voucherRemain;
        VoucherEntity voucher = voucherService.checkPromoByCode(promoCode, new Date());
        if (voucher != null) {
            voucherRemain = voucher.getQuantity() - 1;
            booking.setVoucher(voucher);
            booking.getVoucher().setQuantity(voucherRemain);
            voucherService.updateVoucherQuantity(booking.getVoucher());
        }

        booking.setStatus(BookingStatus.ONHOLD);
        booking.setBookingDate(new Date());
        bookingService.saveBooking(booking);

        String textContent = "Booking reference: " + booking.getPNR()
                + "\nStatus: " + booking.getStatus()
                + "\nFull name: " + booking.getFirstName() + " " + booking.getLastName()
                + "\nTotal pending payment: " + formatNum.format(grandTotal) + " VND"
                + "\nPlease make payment as soon as possible!"
                + "\nThank you and have a good day!";
        emailService.sendSimpleMessage(booking.getEmail(), "Ariel Airways - Booking Confirmation", textContent);

        session.removeAttribute("numOfPax");
        session.removeAttribute("bookingDetails");
        session.removeAttribute("grandTotal");
        session.removeAttribute("totalBagPrice");
        session.removeAttribute("totalSeatPrice");
        session.removeAttribute("seatPrice");
        session.removeAttribute("fltFareDept");
        session.removeAttribute("fltFareRetn");
        session.removeAttribute("booking");

        String ajaxResponse = "<div class='text-center'>"
                + "<h4 class='text-primary bksc'> Booking Successfully! <h4> "
                + "<h5> Thank you and enjoy your flights!</h5> "
                + "<h5> Ariel Airways - Explore The World With Ease!"
                + "</div>";
        return ajaxResponse;
    }

    @RequestMapping(value = "/pay-now", method = RequestMethod.POST)
    @ResponseBody
    public String payBookingNow(@RequestParam("promoCode") String promoCode,
            @RequestParam(name = "fullname", required = false) String fullname,
            @RequestParam(name = "month", required = false) int month,
            @RequestParam(name = "year", required = false) int year,
            @RequestParam(name = "cardNumber", required = false) String cardNumber,
            @RequestParam(name = "cvv", required = false) int cvv,
            @RequestParam("grandTotal") long grandTotal,
            HttpSession session) throws Exception {
        String ajaxResponse;

        //credit card check
        Calendar expiredDate = Calendar.getInstance();
        expiredDate.set(year, month, 31);

        cardNumber = cardNumber.replaceAll("\\s", "");

        AccountBankingEntity accountBanking = bankAccountService.validateBankAccount(fullname, grandTotal, expiredDate, cardNumber, cvv);

        if (accountBanking == null) {
            ajaxResponse = "<div class='row justify-content-center invalidcard'> <h4 class='text-danger'> *Invalid card, please try again! </h4></div>";

        } else {

            int numOfPax = (int) session.getAttribute("numOfPax");
            BookingEntity booking = (BookingEntity) session.getAttribute("booking");

            //set paymentEntity            
            PaymentEntity payment = new PaymentEntity();

            payment.setAmount(grandTotal);
            payment.setPaymentDate(new Date());
            payment.setBooking(booking);
            payment.setAccountBanking(accountBanking);

            booking.setPayment(payment);

            //subtract balance in bank account
            long remainAmount = accountBanking.getBalance() - grandTotal;
            accountBanking.setBalance(remainAmount);
            bankAccountService.updateBalanceBankAcc(accountBanking);
            booking.getPayment().setAccountBanking(accountBanking);

            //update availability flight fare
            for (BookingDetailEntity bkdt : booking.getBookingDetails()) {
                int remainAvail = bkdt.getFlightFare().getAvailability() - numOfPax;

                bkdt.getFlightFare().setAvailability(remainAvail);
                flightFareService.updateFlightFareAvaiability(bkdt.getFlightFare());
                bkdt.setStatus(BookingStatus.ACTIVE);
            }

            //update quantity voucher
            int voucherRemain;
            VoucherEntity voucher = voucherService.checkPromoByCode(promoCode, new Date());
            if (voucher != null) {
                voucherRemain = voucher.getQuantity() - 1;
                booking.setVoucher(voucher);
                booking.getVoucher().setQuantity(voucherRemain);
                voucherService.updateVoucherQuantity(booking.getVoucher());
            }

            booking.setStatus(BookingStatus.ACTIVE);
            booking.setBookingDate(new Date());
            booking.setBalanceDue(0);
            bookingService.saveBooking(booking);

            String textContent = "Booking reference: " + booking.getPNR()
                    + "\nStatus: " + booking.getStatus()
                    + "\nFull name: " + booking.getFirstName() + " " + booking.getLastName()
                    + "\nTotal payment: " + formatNum.format(grandTotal) + " VND"
                    + "\nThank you and have a good day!";

            emailService.sendSimpleMessage(booking.getEmail(), "Ariel Airways - Booking Confirmation", textContent);

            session.removeAttribute("numOfPax");
            session.removeAttribute("bookingDetails");
            session.removeAttribute("grandTotal");
            session.removeAttribute("totalBagPrice");
            session.removeAttribute("totalSeatPrice");
            session.removeAttribute("seatPrice");
            session.removeAttribute("fltFareDept");
            session.removeAttribute("fltFareRetn");
            session.removeAttribute("booking");

            ajaxResponse = "<div class='text-center'>"
                    + "<h4 class='text-primary bksc'> Booking Successfully! <h4>"
                    + "<h5> Thank you and enjoy your flights!</h5>"
                    + "<h5> Ariel Airways - Explore The World With Ease! </h5>"
                    + "</div>";
        }
        return ajaxResponse;
    }

//    @RequestMapping(value = {"/extra-service"}, method = RequestMethod.GET)
//    public String servicePage(Model model, HttpSession session
//    ) {
//
//        return "service";
//    }
//
    @RequestMapping(value = {"/passenger-detail"}, method = RequestMethod.GET)
    public String passengerPage(Model model, HttpSession session
    ) {

        return "passenger-detail";
    }

    @RequestMapping(value = {"/payment-detail"}, method = RequestMethod.GET)
    public String paymentPage(Model model, HttpSession session
    ) {

        return "payment";
    }
}
