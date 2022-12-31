<%-- 
    Document   : passenger-detail
    Created on : Dec 3, 2022, 8:52:55 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Bookings | Ariel Airways</title>
        <jsp:include page="include/user/css-page.jsp"/>
    </head>

    <body data-spy="scroll" data-target="#probootstrap-navbar" data-offset="200">
        <jsp:include page="include/user/header.jsp"/>
        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<c:url value="/resources/images/bg_1.jpg"/>'); height: auto "  id="section-contact">
            <div class="overlay"></div>
            <div class="container">
                <div class="row align-items-center p-1">

                    <div class="col-md-9">
                        <div class="row mb-3 justify-content-between"> 
                            <div class="col-md-6"> 
                                <div class="row ">
                                    <svg xmlns="http://www.w3.org/2000/svg"  width="50" height="50" viewBox="0 0 640 512"><path fill="white" d="M256 0c-35 0-64 59.5-64 93.7v84.6L8.1 283.4c-5 2.8-8.1 8.2-8.1 13.9v65.5c0 10.6 10.2 18.3 20.4 15.4l171.6-49 0 70.9-57.6 43.2c-4 3-6.4 7.8-6.4 12.8v42c0 7.8 6.3 14 14 14c1.3 0 2.6-.2 3.9-.5L256 480l110.1 31.5c1.3 .4 2.6 .5 3.9 .5c6 0 11.1-3.7 13.1-9C344.5 470.7 320 422.2 320 368c0-60.6 30.6-114 77.1-145.6L320 178.3V93.7C320 59.5 292 0 256 0zM640 368c0-79.5-64.5-144-144-144s-144 64.5-144 144s64.5 144 144 144s144-64.5 144-144zm-76.7-43.3c6.2 6.2 6.2 16.4 0 22.6l-72 72c-6.2 6.2-16.4 6.2-22.6 0l-40-40c-6.2-6.2-6.2-16.4 0-22.6s16.4-6.2 22.6 0L480 385.4l60.7-60.7c6.2-6.2 16.4-6.2 22.6 0z"/></svg>
                                    <h3 class="text-success align-self-center ml-2"> My Bookings </h3> 
                                </div>    
                            </div>
                            <div class="col-md-6"> 
                                <div class="row justify-content-end">                                    
                                    <button class="btn btn-warning " id="cancel-btn" data-toggle="modal" data-target="#cancelBookingModal" > Cancel Booking </button>
                                </div>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="cancelBookingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Hey, Wait!!</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" id="modal-cancelBooking">
                                            Are you sure, you want to cancel your flight booking?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" id="cancel-booking-btn"> Yes, sure </button>
                                            <input hidden id="reference" value="${booking.PNR}">
                                            <input hidden id="lastname" value="${booking.lastName}">
                                        </div>
                                    </div>
                                </div>
                            </div>        

                        </div>
                        <!-- booking info -->
                        <div class="row bg-light mb-3">
                            <div class="col-md-6">
                                <div class="row bg-success pl-3 p-2 align-items-center"> 
                                    <h5 class="text-light m-2"> PNR:<strong>  ${booking.PNR}  </strong> </h5>
                                </div>
                            </div>
                            <div class="col-md-6 bg-success align-self-center">
                                <div class="row bg-success p-3 justify-content-end"> 
                                    <h5 class="pr-2 m-0 text-light">Status </h5>
                                    <c:if test="${booking.status eq 'ONHOLD'}">
                                        <h5 class="text-warning m-0 booking-status"> <strong> ${booking.status} </strong>  </h5>
                                    </c:if>
                                    <c:if test="${booking.status eq 'ACTIVE'}">
                                        <h5 class="text-light m-0 booking-status"> <strong> ${booking.status} </strong> </h5>
                                    </c:if>
                                    <c:if test="${booking.status eq 'CANCELLED'}">
                                        <h5 class="text-danger m-0 booking-status"><strong> ${booking.status} </strong></h5>
                                    </c:if>

                                    <input hidden id="booking-status" value="${booking.status}"> 
                                </div>
                            </div>
                        </div>

                        <div class="row bg-light mb-3">
                            <div class="col-md-12">

                                <div class="row bg-success pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 512 512"> <path fill="white" d="M498.1 5.6c10.1 7 15.4 19.1 13.5 31.2l-64 416c-1.5 9.7-7.4 18.2-16 23s-18.9 5.4-28 1.6L284 427.7l-68.5 74.1c-8.9 9.7-22.9 12.9-35.2 8.1S160 493.2 160 480V396.4c0-4 1.5-7.8 4.2-10.7L331.8 202.8c5.8-6.3 5.6-16-.4-22s-15.7-6.4-22-.7L106 360.8 17.7 316.6C7.1 311.3 .3 300.7 0 288.9s5.9-22.8 16.1-28.7l448-256c10.7-6.1 23.9-5.5 34 1.4z"/></svg>
                                    <h5 class="text-light m-2 ">  <strong> Flights </strong>  </h5>
                                </div>

                                <div class="row p-2">                                        
                                    <div class="col-md-6">
                                        <div class="row m-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 640 512"><path fill="#020b6b" d="M381 114.9L186.1 41.8c-16.7-6.2-35.2-5.3-51.1 2.7L89.1 67.4C78 73 77.2 88.5 87.6 95.2l146.9 94.5L136 240 77.8 214.1c-8.7-3.9-18.8-3.7-27.3 .6L18.3 230.8c-9.3 4.7-11.8 16.8-5 24.7l73.1 85.3c6.1 7.1 15 11.2 24.3 11.2H248.4c5 0 9.9-1.2 14.3-3.4L535.6 212.2c46.5-23.3 82.5-63.3 100.8-112C645.9 75 627.2 48 600.2 48H542.8c-20.2 0-40.2 4.8-58.2 14L381 114.9zM0 480c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32s-14.3-32-32-32H32c-17.7 0-32 14.3-32 32z"/></svg>
                                            <h6 class="text-primary ml-1"> <strong> Departure flight: <fmt:formatDate pattern="EEE MMM dd yyyy" value="${booking.bookingDetails[0].flightFare.flight.flightDate}"/> </strong> </h6>
                                        </div>
                                        <div class="row m-1">
                                            <h6 class="m-0 align-self-center"> Ariel Airways - ${booking.bookingDetails[0].flightFare.flight.flightNumber} </h6>
                                            <c:if test="${booking.bookingDetails[0].status ne 'CANCELLED'}">  
                                                <button type="button" class="btn btn-warning p-1 m-0 ml-3 cancel-detail-btn" onclick="cancelBookingDetail(${booking.bookingDetails[0].id})"> Cancel </button>
                                            </c:if>
                                        </div>
                                        <div class="row m-1">
                                            <div class="col-md-4">
                                                <h6><strong>  <fmt:formatDate pattern="HH:mm" value="${booking.bookingDetails[0].flightFare.flight.departureTime}"/> </strong></h6>
                                                <h6><strong> <fmt:formatDate pattern="HH:mm" value="${booking.bookingDetails[0].flightFare.flight.arrivalTime}"/> </strong></h6>
                                            </div>
                                            <div class="col-md-8">
                                                <h6> ${booking.bookingDetails[0].flightFare.flight.route.departure.description} </h6>
                                                <h6>${booking.bookingDetails[0].flightFare.flight.route.destination.description}</h6>
                                            </div>
                                        </div>
                                        <h6 class="text-success">${booking.bookingDetails[0].flightFare.fareType.classType}</h6>                               
                                        <h6> Status: <strong class="bookingDetail-status" id="bkdt-stt-${booking.bookingDetails[0].id}"> ${booking.bookingDetails[0].status} </strong> </h6>

                                    </div>

                                    <c:if test="${fn:length(booking.bookingDetails) > 1}"> 
                                        <div class="col-md-6">
                                            <div class="row m-1">
                                                <svg xmlns="http://www.w3.org/2000/svg"  width="15" height="15" viewBox="0 0 640 512"> <path fill="#020b6b" d="M.3 166.9L0 68C0 57.7 9.5 50.1 19.5 52.3l35.6 7.9c10.6 2.3 19.2 9.9 23 20L96 128l127.3 37.6L181.8 20.4C178.9 10.2 186.6 0 197.2 0h40.1c11.6 0 22.2 6.2 27.9 16.3l109 193.8 107.2 31.7c15.9 4.7 30.8 12.5 43.7 22.8l34.4 27.6c24 19.2 18.1 57.3-10.7 68.2c-41.2 15.6-86.2 18.1-128.8 7L121.7 289.8c-11.1-2.9-21.2-8.7-29.3-16.9L9.5 189.4c-5.9-6-9.3-14-9.3-22.5zM32 448H608c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32zm160-80c0 17.7-14.3 32-32 32s-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32zm64 48c-17.7 0-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32s-14.3 32-32 32z"/></svg>
                                                <h6 class="text-primary ml-1"> <strong> Return flight:  <fmt:formatDate pattern="EEE MMM dd yyyy" value="${booking.bookingDetails[1].flightFare.flight.flightDate}"/> </strong>  </h6>
                                            </div>
                                            <div class="row m-1 align-self-center">
                                                <h6 class="m-0 align-self-center"> Arial Airways - ${booking.bookingDetails[1].flightFare.flight.flightNumber} </h6>
                                                <c:if test="${booking.bookingDetails[1].status ne 'CANCELLED'}">  
                                                    <button type="button" class="btn btn-warning p-1 m-0 ml-3 cancel-detail-btn" onclick="cancelBookingDetail(${booking.bookingDetails[1].id})"> Cancel </button>
                                                </c:if>
                                            </div>

                                            <div class="row m-1">
                                                <div class="col-md-4">
                                                    <h6><strong>  <fmt:formatDate pattern="HH:mm" value="${booking.bookingDetails[1].flightFare.flight.departureTime}"/> </strong></h6>
                                                    <h6><strong>  <fmt:formatDate pattern="HH:mm" value="${booking.bookingDetails[1].flightFare.flight.arrivalTime}"/> </strong></h6>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6> ${booking.bookingDetails[1].flightFare.flight.route.departure.description} </h6>
                                                    <h6>${booking.bookingDetails[1].flightFare.flight.route.destination.description}</h6>
                                                </div>
                                            </div>
                                            <h6 class="text-success">${booking.bookingDetails[1].flightFare.fareType.classType}</h6>
                                            <h6> Status: <strong class="bookingDetail-status" id="bkdt-stt-${booking.bookingDetails[1].id}" > ${booking.bookingDetails[1].status} </strong> </h6>

                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>


                        <div class="row bg-light mb-3">
                            <div class="col-md-12">
                                <div class="row bg-success pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 640 512"><path fill="white"  d="M352 128c0 70.7-57.3 128-128 128s-128-57.3-128-128S153.3 0 224 0s128 57.3 128 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM609.3 512H471.4c5.4-9.4 8.6-20.3 8.6-32v-8c0-60.7-27.1-115.2-69.8-151.8c2.4-.1 4.7-.2 7.1-.2h61.4C567.8 320 640 392.2 640 481.3c0 17-13.8 30.7-30.7 30.7zM432 256c-31 0-59-12.6-79.3-32.9C372.4 196.5 384 163.6 384 128c0-26.8-6.6-52.1-18.3-74.3C384.3 40.1 407.2 32 432 32c61.9 0 112 50.1 112 112s-50.1 112-112 112z"/></svg>
                                    <h5 class="text-light m-2"> <strong> Passengers </strong> </h5>
                                </div>

                                <c:forEach var="pax" items="${booking.bookingDetails[0].passengers}" varStatus="i">
                                    <div class="row p-2 ml-2">
                                        <div class="col-md-6">
                                            <h6><strong> ${i.count}. ${pax.lastName} ${pax.firstName} </strong></h6>
                                        </div>
                                        <div class="col-md-6">
                                            <h6><strong>${pax.gender.value}</strong></h6>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>

                        <!-- EXTRA SERVICES -->
                        <div class="row bg-light mb-3">
                            <div class="col-md-12">

                                <mvc:form action="${pageContext.request.contextPath}/update-services" method="POST" id="formUpdateService" modelAttribute="bookingPax">

                                    <div class="row bg-success pl-3 p-2 align-items-center"> 
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 448 512"><path fill="white" d="M200 344V280H136C122.7 280 112 269.3 112 256C112 242.7 122.7 232 136 232H200V168C200 154.7 210.7 144 224 144C237.3 144 248 154.7 248 168V232H312C325.3 232 336 242.7 336 256C336 269.3 325.3 280 312 280H248V344C248 357.3 237.3 368 224 368C210.7 368 200 357.3 200 344zM0 96C0 60.65 28.65 32 64 32H384C419.3 32 448 60.65 448 96V416C448 451.3 419.3 480 384 480H64C28.65 480 0 451.3 0 416V96zM48 96V416C48 424.8 55.16 432 64 432H384C392.8 432 400 424.8 400 416V96C400 87.16 392.8 80 384 80H64C55.16 80 48 87.16 48 96z"/></svg>
                                        <h5 class="text-light m-2">  <strong> Extra Services  </strong> </h5>
                                    </div>

                                    <div class="row m-2">
                                        <div class="col-md-6 p-2">
                                            <div class="row m-1">
                                                <svg xmlns="http://www.w3.org/2000/svg"  width="15" height="15"  viewBox="0 0 448 512"><path fill="#020b6b" d="M248 48V256h48V58.7c23.9 13.8 40 39.7 40 69.3V256h48V128C384 57.3 326.7 0 256 0H192C121.3 0 64 57.3 64 128V256h48V128c0-29.6 16.1-55.5 40-69.3V256h48V48h48zM48 288c-12.1 0-23.2 6.8-28.6 17.7l-16 32c-5 9.9-4.4 21.7 1.4 31.1S20.9 384 32 384l0 96c0 17.7 14.3 32 32 32s32-14.3 32-32V384H352v96c0 17.7 14.3 32 32 32s32-14.3 32-32V384c11.1 0 21.4-5.7 27.2-15.2s6.4-21.2 1.4-31.1l-16-32C423.2 294.8 412.1 288 400 288H48z"/></svg>
                                                <h6 class="text-primary ml-1">  <strong> Seat selection  </strong> </h6>

                                                <button type="button" class="btn btn-warning p-1 m-0 ml-3 buymore-btn"  data-toggle="modal" data-target=".seat-selection-modal"> Change </button>
                                            </div>

                                            <!-- Extra large modal -->
                                            <div class="modal fade seat-selection-modal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Seat Reservation</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>

                                                        <div class="modal-body row">

                                                            <div class="col-md-6 ">
                                                                <input hidden type="text"  id="numOfPax" value="${fn:length(booking.bookingDetails[0].passengers)}">

                                                                <c:forEach var="bkdt" items="${booking.bookingDetails}" varStatus="j">
                                                                    <c:if test="${bkdt.status ne 'CANCELLED'}">

                                                                        <div class="row ml-2 mt-3">
                                                                            <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 640 512"><path fill="#020b6b" d="M381 114.9L186.1 41.8c-16.7-6.2-35.2-5.3-51.1 2.7L89.1 67.4C78 73 77.2 88.5 87.6 95.2l146.9 94.5L136 240 77.8 214.1c-8.7-3.9-18.8-3.7-27.3 .6L18.3 230.8c-9.3 4.7-11.8 16.8-5 24.7l73.1 85.3c6.1 7.1 15 11.2 24.3 11.2H248.4c5 0 9.9-1.2 14.3-3.4L535.6 212.2c46.5-23.3 82.5-63.3 100.8-112C645.9 75 627.2 48 600.2 48H542.8c-20.2 0-40.2 4.8-58.2 14L381 114.9zM0 480c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32s-14.3-32-32-32H32c-17.7 0-32 14.3-32 32z"/></svg>
                                                                            <span> &nbsp; ${bkdt.flightFare.flight.route.departure.name} to ${bkdt.flightFare.flight.route.destination.name} </span> 
                                                                        </div>

                                                                        <c:forEach var="b" items="${bkdt.passengers}" varStatus="i">
                                                                            <div class="row ml-2 mb-2">
                                                                                <div class="col-md-12 border border-dark p-2 hoverseat" id="choose-seat-${i.count}${bkdt.flightFare.flight.id}" onclick="selectPaxForSeat(${i.count}, ${bkdt.flightFare.flight.id})" >
                                                                                    <div class="row">
                                                                                        <div class="col-md-6">
                                                                                            <h6> ${b.firstName} ${b.lastName}</h6>
                                                                                            <c:if test="${b.seat != ''}">
                                                                                                <h6 class="text-primary" id="seat-status-${i.count}${bkdt.flightFare.flight.id}" >Selected </h6>
                                                                                            </c:if>
                                                                                            <c:if test="${b.seat == ''}">
                                                                                                <h6 class="text-primary" id="seat-status-${i.count}${bkdt.flightFare.flight.id}" >Choose your seat</h6>
                                                                                            </c:if>
                                                                                        </div>
                                                                                        <c:if test="${b.seat != ''}">
                                                                                            <div class="col-md-6 align-self-center " id="dpl-div-${i.count}${bkdt.flightFare.flight.id}">
                                                                                                <div class="row">
                                                                                                    <div class="col-md-8 pt-1 text-center bg-success rounded">
                                                                                                        <h3 id="selected-seat-${i.count}${bkdt.flightFare.flight.id}"> ${b.seat} </h3>
                                                                                                        <h6 class="text-light hideMoney" id="hideMoney-${i.count}${bkdt.flightFare.flight.id}"> + <span id="seat-price-${i.count}${bkdt.flightFare.flight.id}"> </span> VND </h6>

                                                                                                        <input hidden type="text" class="seat-price" id="value-price-${i.count}${bkdt.flightFare.flight.id}" value>
                                                                                                        <input hidden type="text" name="bookingDetails[${j.index}].passengers[${i.index}].seat" id="ctrl-seat-${i.count}${bkdt.flightFare.flight.id}" value="${b.seat}"> <!-- for controller -->
                                                                                                    </div>

                                                                                                    <div class="col-md-4 align-self-center dpl-div" id="remove-seat-${i.count}${bkdt.flightFare.flight.id}" onclick="removeSeat(${i.count},${bkdt.flightFare.flight.id})">
                                                                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.3394 9.32245C16.7434 8.94589 16.7657 8.31312 16.3891 7.90911C16.0126 7.50509 15.3798 7.48283 14.9758 7.85938L12.0497 10.5866L9.32245 7.66048C8.94589 7.25647 8.31312 7.23421 7.90911 7.61076C7.50509 7.98731 7.48283 8.62008 7.85938 9.0241L10.5866 11.9502L7.66048 14.6775C7.25647 15.054 7.23421 15.6868 7.61076 16.0908C7.98731 16.4948 8.62008 16.5171 9.0241 16.1405L11.9502 13.4133L14.6775 16.3394C15.054 16.7434 15.6868 16.7657 16.0908 16.3891C16.4948 16.0126 16.5171 15.3798 16.1405 14.9758L13.4133 12.0497L16.3394 9.32245Z" fill="currentColor" /><path fill-rule="evenodd" clip-rule="evenodd" d="M1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12ZM12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z" fill="currentColor" /></svg>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </c:if>
                                                                                        <c:if test="${b.seat == ''}">
                                                                                            <div class="col-md-6 align-self-center dpldiv " id="dpl-div-${i.count}${bkdt.flightFare.flight.id}">
                                                                                                <div class="row">
                                                                                                    <div class="col-md-8 pt-1 text-center bg-success rounded">
                                                                                                        <h3 id="selected-seat-${i.count}${bkdt.flightFare.flight.id}"></h3>
                                                                                                        <h6 class="text-light"> + <span id="seat-price-${i.count}${bkdt.flightFare.flight.id}"> </span> VND </h6>
                                                                                                        <input hidden type="text" class="seat-price" id="value-price-${i.count}${bkdt.flightFare.flight.id}" value>
                                                                                                        <input hidden type="text" name="bookingDetails[${j.index}].passengers[${i.index}].seat" id="ctrl-seat-${i.count}${bkdt.flightFare.flight.id}" value> <!-- for controller -->
                                                                                                    </div>

                                                                                                    <div class="col-md-4 align-self-center dpl-div" id="remove-seat-${i.count}${bkdt.flightFare.flight.id}" onclick="removeSeat(${i.count},${bkdt.flightFare.flight.id})">
                                                                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.3394 9.32245C16.7434 8.94589 16.7657 8.31312 16.3891 7.90911C16.0126 7.50509 15.3798 7.48283 14.9758 7.85938L12.0497 10.5866L9.32245 7.66048C8.94589 7.25647 8.31312 7.23421 7.90911 7.61076C7.50509 7.98731 7.48283 8.62008 7.85938 9.0241L10.5866 11.9502L7.66048 14.6775C7.25647 15.054 7.23421 15.6868 7.61076 16.0908C7.98731 16.4948 8.62008 16.5171 9.0241 16.1405L11.9502 13.4133L14.6775 16.3394C15.054 16.7434 15.6868 16.7657 16.0908 16.3891C16.4948 16.0126 16.5171 15.3798 16.1405 14.9758L13.4133 12.0497L16.3394 9.32245Z" fill="currentColor" /><path fill-rule="evenodd" clip-rule="evenodd" d="M1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12ZM12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z" fill="currentColor" /></svg>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </c:if>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                        </c:forEach>  

                                                                    </c:if>

                                                                    <c:if test="${bkdt.status eq 'CANCELLED'}">

                                                                        <c:forEach var="b" items="${bkdt.passengers}" varStatus="i">
                                                                            <input hidden type="text" name="bookingDetails[${j.index}].passengers[${i.index}].seat" id="ctrl-seat-${i.count}${bkdt.flightFare.flight.id}" value="${b.seat}"> <!-- for controller -->
                                                                        </c:forEach>  

                                                                    </c:if>

                                                                </c:forEach>
                                                            </div>


                                                            <div class="col-md-6" id="aircraft-model" style="height: 500px; overflow: scroll">
                                                                <div class="row justify-content-center">
                                                                    <div class="col-md-6 p-0">
                                                                        <svg preserveAspectRatio="none" overflow="visible" viewBox="-2 -1 104 99" version="1" style="width: auto;">
                                                                        <path d="M102.8 100.8C102.8 100.8 103.5 85 88.4 43.6 72.4-0.1 50.1 0.6 50.1 0.6 50.1 0.6 28.9-1 12.9 42.7-2.3 84.1-1.6 99.8-1.6 99.8c39.4 1.3 85.9-0.1 104.4 1z" fill="#bbb"></path>
                                                                        <path d="m101.9 99.3c0 0 1.5-14.1-13.6-55.3C72.4 0.5 50.1 1.2 50.1 1.2c0 0-22.3-0.7-38.3 42.7C-3.3 85.1-1.8 99.7-1.8 99.7 20.4 100.1 80.2 99.3 101.9 99.3Z" stroke-miterlimit="3.9" style="fill:none;stroke-width:1.4;stroke:#bbb"></path>
                                                                        <polyline transform="matrix(0,2.0874101,-2.3408275,0,306.0275,-2.0827237)" points="9.7 110 13.9 110 17 115.7 13.6 115.7 9.7 110 " fill="#fff"></polyline>
                                                                        <path d="m32.6 27.6 0.1 7.4-2.2 4.1-7.9-1.7c0 0 2-3.8 4-5.7 1.9-2 6.1-4.1 6.1-4.1M21.2 39.6l7.8 1.5c0 0-5.6 6.8-8.7 7.4-3.2 0.6 0.9-8.9 0.9-8.9" fill="#fff"></path>
                                                                        <polyline transform="matrix(0,2.0874101,-2.3408275,0,306.0275,-2.0827237)" points="9.7 108.5 13.9 108.5 17 102.8 13.6 102.8 9.7 108.5 " fill="#fff"></polyline>
                                                                        <path d="m68.1 27.6-0.1 7.4 2.2 4.1 7.9-1.7c0 0-2-3.8-4-5.7-1.9-2-6.1-4.1-6.1-4.1M79.5 39.6l-7.8 1.5c0 0 5.6 6.8 8.7 7.4 3.2 0.6-0.9-8.9-0.9-8.9" fill="#fff"></path>
                                                                        <polyline transform="matrix(0,2.0874101,-2.3408275,0,306.0275,-2.0827237)" points="33.8 126.7 42.4 128.4 42.4 124.1 44.3 124.1 44.3 110.3 45.5 110.3 45.5 108 43.9 108 43.9 102.3 47.2 102.3 47.2 99 43.8 99 43.8 94.9 42.6 94.9 42.6 90.6 34 92.4 33.8 126.7 " fill="#eeeeee"></polyline>
                                                                        </svg>
                                                                    </div>
                                                                </div>
                                                                <div class="row justify-content-center" >
                                                                    <div class="col-md-6 p-0">
                                                                        <table id="seat-map-table" style="table-layout: fixed; width: 100%;" >

                                                                        </table>
                                                                        <input hidden type="text" id="seatmap-fltId" value>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>


                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end seat modal -->

                                            <c:forEach var="bkdt" items="${booking.bookingDetails}">

                                                <h6>  <strong> ${bkdt.flightFare.flight.route.departure.name} to ${bkdt.flightFare.flight.route.destination.name} - ${bkdt.flightFare.flight.flightNumber} </strong>  </h6>
                                                <div class="row m-2">
                                                    <c:forEach var="pax" items="${bkdt.passengers}" varStatus="i">
                                                        <div class="col-md-8">
                                                            <h6> ${i.count}. ${pax.lastName} ${pax.firstName}</h6>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <h6 class="reserved-seat" id="reserved-seat-${i.count}${pax.flight.id}"> ${pax.seat}</h6>
                                                        </div>
                                                    </c:forEach>

                                                </div>
                                            </c:forEach>
                                        </div>

                                        <div class="col-md-6 p-2 ">
                                            <div class="row m-1">
                                                <svg xmlns="http://www.w3.org/2000/svg"  width="15" height="15" viewBox="0 0 640 512"><path fill="#020b6b" d="M0 32C0 14.3 14.3 0 32 0H48c44.2 0 80 35.8 80 80V368c0 8.8 7.2 16 16 16H608c17.7 0 32 14.3 32 32s-14.3 32-32 32H541.3c1.8 5 2.7 10.4 2.7 16c0 26.5-21.5 48-48 48s-48-21.5-48-48c0-5.6 1-11 2.7-16H253.3c1.8 5 2.7 10.4 2.7 16c0 26.5-21.5 48-48 48s-48-21.5-48-48c0-5.6 1-11 2.7-16H144c-44.2 0-80-35.8-80-80V80c0-8.8-7.2-16-16-16H32C14.3 64 0 49.7 0 32zM432 96V56c0-4.4-3.6-8-8-8H344c-4.4 0-8 3.6-8 8V96h96zM288 96V56c0-30.9 25.1-56 56-56h80c30.9 0 56 25.1 56 56V96 320H288V96zM512 320V96h16c26.5 0 48 21.5 48 48V272c0 26.5-21.5 48-48 48H512zM240 96h16V320H240c-26.5 0-48-21.5-48-48V144c0-26.5 21.5-48 48-48z"/></svg>
                                                <h6 class="text-primary ml-1">  <strong> Luggage  </strong> </h6>

                                                <button type="button" class="btn btn-warning p-1 m-0 ml-3 buymore-btn"  data-toggle="modal" data-target=".luggage-modal"> Change </button>
                                            </div>

                                            <!-- luggage modal -->

                                            <div class="modal fade luggage-modal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-xl" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Extra Luggage </h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>

                                                        <div class="modal-body row">
                                                            <div class="col-md-12">
                                                                <div class="row ml-2">
                                                                    <div class="col-md-5 ">

                                                                    </div>
                                                                    <div class="col-md-7 ">
                                                                        <div class="row justify-content-around text-center align-items-end"> 
                                                                            <div>
                                                                                <svg xmlns="http://www.w3.org/2000/svg" height="15" width="15" viewBox="0 0 512 512"><path fill="#020b6b" d="M176 56V96H336V56c0-4.4-3.6-8-8-8H184c-4.4 0-8 3.6-8 8zM128 96V56c0-30.9 25.1-56 56-56H328c30.9 0 56 25.1 56 56V96v32V480H128V128 96zM64 96H96V480H64c-35.3 0-64-28.7-64-64V160c0-35.3 28.7-64 64-64zM448 480H416V96h32c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64z"/></svg>
                                                                                <h6> 15kg </h6>
                                                                            </div>
                                                                            <div>
                                                                                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 512 512"><path fill="#020b6b" d="M176 56V96H336V56c0-4.4-3.6-8-8-8H184c-4.4 0-8 3.6-8 8zM128 96V56c0-30.9 25.1-56 56-56H328c30.9 0 56 25.1 56 56V96v32V480H128V128 96zM64 96H96V480H64c-35.3 0-64-28.7-64-64V160c0-35.3 28.7-64 64-64zM448 480H416V96h32c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64z"/></svg>
                                                                                <h6> 20kg </h6>
                                                                            </div>
                                                                            <div>
                                                                                <svg xmlns="http://www.w3.org/2000/svg" height="25" width="25" viewBox="0 0 512 512"><path fill="#020b6b" d="M176 56V96H336V56c0-4.4-3.6-8-8-8H184c-4.4 0-8 3.6-8 8zM128 96V56c0-30.9 25.1-56 56-56H328c30.9 0 56 25.1 56 56V96v32V480H128V128 96zM64 96H96V480H64c-35.3 0-64-28.7-64-64V160c0-35.3 28.7-64 64-64zM448 480H416V96h32c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64z"/></svg>
                                                                                <h6> 25kg </h6>
                                                                            </div>
                                                                            <div>
                                                                                <svg xmlns="http://www.w3.org/2000/svg" height="30" width="30" viewBox="0 0 512 512"><path fill="#020b6b" d="M176 56V96H336V56c0-4.4-3.6-8-8-8H184c-4.4 0-8 3.6-8 8zM128 96V56c0-30.9 25.1-56 56-56H328c30.9 0 56 25.1 56 56V96v32V480H128V128 96zM64 96H96V480H64c-35.3 0-64-28.7-64-64V160c0-35.3 28.7-64 64-64zM448 480H416V96h32c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64z"/></svg>
                                                                                <h6> 30kg </h6>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>

                                                                <c:forEach var="bkdt" items="${booking.bookingDetails}" varStatus="j">
                                                                    <c:if test="${bkdt.status ne 'CANCELLED'}">

                                                                        <div class="row mt-3">
                                                                            <div class="col-md-12">
                                                                                <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 640 512"><path fill="#020b6b" d="M381 114.9L186.1 41.8c-16.7-6.2-35.2-5.3-51.1 2.7L89.1 67.4C78 73 77.2 88.5 87.6 95.2l146.9 94.5L136 240 77.8 214.1c-8.7-3.9-18.8-3.7-27.3 .6L18.3 230.8c-9.3 4.7-11.8 16.8-5 24.7l73.1 85.3c6.1 7.1 15 11.2 24.3 11.2H248.4c5 0 9.9-1.2 14.3-3.4L535.6 212.2c46.5-23.3 82.5-63.3 100.8-112C645.9 75 627.2 48 600.2 48H542.8c-20.2 0-40.2 4.8-58.2 14L381 114.9zM0 480c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32s-14.3-32-32-32H32c-17.7 0-32 14.3-32 32z"/></svg>
                                                                                <span> &nbsp; ${bkdt.flightFare.flight.route.departure.name} to ${bkdt.flightFare.flight.route.destination.name} </span> 
                                                                            </div>
                                                                        </div>


                                                                        <c:forEach var="b" items="${bkdt.passengers}" varStatus="i" >
                                                                            <div class="row ml-2">
                                                                                <div class="col-md-5 border border-dark p-2 mb-2 selected-pax" id="choose-pax-${i.count}">
                                                                                    <div class="row">
                                                                                        <div class="col-md-7" >
                                                                                            <h6>${b.firstName} ${b.lastName}</h6>

                                                                                            <h6 class="text-primary" id="bag-status-${i.count}${bkdt.flightFare.flight.id}">Choose your baggage</h6>
                                                                                        </div>
                                                                                        <div class="col-md-5 align-self-center bagdiv" id="bagdiv-${i.count}${bkdt.flightFare.flight.id}">
                                                                                            <div class="row">
                                                                                                <div class="col-md-8 pt-1 text-center bg-success rounded">
                                                                                                    <h4 id="selected-baggage-${i.count}${bkdt.flightFare.flight.id}">                                                                                                                                                                                                            
                                                                                                        ${b.serviceBookings[0].serviceType.name}                                                                                                        
                                                                                                    </h4>  
                                                                                                </div>
                                                                                                <div class="col-md-4 align-self-center" id="remove-bag-${i.count}${bkdt.flightFare.flight.id}" onclick="removeBag(${i.count},${bkdt.flightFare.flight.id})">
                                                                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.3394 9.32245C16.7434 8.94589 16.7657 8.31312 16.3891 7.90911C16.0126 7.50509 15.3798 7.48283 14.9758 7.85938L12.0497 10.5866L9.32245 7.66048C8.94589 7.25647 8.31312 7.23421 7.90911 7.61076C7.50509 7.98731 7.48283 8.62008 7.85938 9.0241L10.5866 11.9502L7.66048 14.6775C7.25647 15.054 7.23421 15.6868 7.61076 16.0908C7.98731 16.4948 8.62008 16.5171 9.0241 16.1405L11.9502 13.4133L14.6775 16.3394C15.054 16.7434 15.6868 16.7657 16.0908 16.3891C16.4948 16.0126 16.5171 15.3798 16.1405 14.9758L13.4133 12.0497L16.3394 9.32245Z" fill="currentColor" /><path fill-rule="evenodd" clip-rule="evenodd" d="M1 12C1 5.92487 5.92487 1 12 1C18.0751 1 23 5.92487 23 12C23 18.0751 18.0751 23 12 23C5.92487 23 1 18.0751 1 12ZM12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21Z" fill="currentColor" /></svg>
                                                                                                </div>
                                                                                            </div>

                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="col-md-7">
                                                                                    <div class="row justify-content-around text-center">
                                                                                        <input hidden type="radio" name="baggage-${i.count}${bkdt.flightFare.flight.id}" id="bag-${i.count}${bkdt.flightFare.flight.id}">
                                                                                        <c:forEach var="bag" items="${baggageService}">
                                                                                            <div class="col-md-3">
                                                                                                <input type="radio" name="baggage-${i.count}${bkdt.flightFare.flight.id}" value="${bag.price}" id="bag-${i.count}-${bag.name}" onclick="selectBagForPax(${i.count}, '${bag.name}', ${bag.id}, ${bkdt.flightFare.flight.id})" >
                                                                                                <h6> + <fmt:formatNumber groupingUsed="true" value="${bag.price}"/> VND </h6>
                                                                                            </div>
                                                                                        </c:forEach>    
                                                                                        <input hidden type="text" class="luggage-form" id="luggage-${i.count}${bkdt.flightFare.flight.id}" name="bookingDetails[${j.index}].passengers[${i.index}].serviceBookings[0].serviceType.id" value="${b.serviceBookings[0].serviceType.id}"> <!-- for controller -->

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                    </c:if>

                                                                    <c:if test="${bkdt.status eq 'CANCELLED'}">
                                                                        <c:forEach var="b" items="${bkdt.passengers}" varStatus="i" >
                                                                            <input hidden type="text" class="luggage-form" id="luggage-${i.count}${bkdt.flightFare.flight.id}" name="bookingDetails[${j.index}].passengers[${i.index}].serviceBookings[0].serviceType.id" value="${b.serviceBookings[0].serviceType.id}"> <!-- for controller -->
                                                                        </c:forEach>
                                                                    </c:if>

                                                                </c:forEach>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- end luggage modal -->

                                            <c:forEach var="bkdt" items="${booking.bookingDetails}">

                                                <h6>  <strong>  ${bkdt.flightFare.flight.route.departure.name} to ${bkdt.flightFare.flight.route.destination.name} - ${bkdt.flightFare.flight.flightNumber}  </strong>  </h6>
                                                <div class="row m-2">
                                                    <c:forEach var="pax" items="${bkdt.passengers}" varStatus="i">
                                                        <div class="col-md-8">
                                                            <h6> ${i.count}. ${pax.lastName} ${pax.firstName}</h6> 
                                                        </div>
                                                        <div class="col-md-4">
                                                            <h6 id="baggage-replace-${i.count}${pax.flight.id}"> 
                                                                ${pax.serviceBookings[0].serviceType.name}
                                                            </h6>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </c:forEach>


                                        </div>
                                    </div>
                                </mvc:form>
                            </div>
                        </div>
                    </div>



                    <!-- TOTAL BOARD -->
                    <div class="col-md-3 fixed-right">
                        <div id="total" class="row text-center m-1 justify-content-center">

                            <div class="row" style="width:100%">
                                <div class="col-md-12 bg-success rounded pt-1 justify-content-center">
                                    <c:if test="${booking.payment.amount == null}">
                                        <h4> Paid <span id="total-value-paid" > <fmt:formatNumber groupingUsed="true" value="0"/> </span> VND </h4>
                                    </c:if>

                                    <c:if test="${booking.payment.amount != null}">
                                        <h4> Paid <span id="total-value-paid" > <fmt:formatNumber groupingUsed="true" value="${booking.payment.amount}"/> </span> VND </h4>
                                    </c:if>
                                    <input hidden id="valueOfTotalPaid" type="text" value="${booking.payment.amount}">

                                </div>
                            </div>


                            <!-- seat setting -->
                            <div class="row  " style="width:100%">
                                <div class="col-md-12 mt-2 p-1 bg-light rounded" id="seat-total">
                                </div>
                            </div>
                            <!-- baggage setting -->
                            <div class="row  " style="width:100%">
                                <div class="col-md-12 mt-2 p-1 bg-light rounded" id="baggage-total">
                                </div>
                            </div>


                            <!-- BALANCE DUE setting -->
                            <div class="row  " style="width:100%"  >
                                <div class="col-md-12 mt-2 pt-1 bg-light rounded justify-content-center"> 

                                    <h6 class="text-danger" > Balance due <strong id="balance-due-total"> <fmt:formatNumber groupingUsed="true" value="${booking.balanceDue}"/></strong> VND </h6>
                                    <input hidden id="valueOfBalanceDue" type="text" value="${booking.balanceDue}">
                                    <input hidden id="originalBalanceDue" type="text" value="${booking.balanceDue}">

                                </div>
                            </div>

                        </div>
                        <div class="row justify-content-center text-center mt-2">
                            <button disabled id="payment-btn" type="button" data-toggle="modal" data-target="#paymentModal"  class="btn btn-primary"> Pay</button>
                        </div>
                    </div>
                </div>
            </div>

        </section>

        <!-- Modal -->
        <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-info justify-content-center">
                        <h3 class="modal-title text-light " id="exampleModalLabel"> <strong> Balance Due Payment </strong> </h3>
                    </div>
                    <div class="modal-body">
                        <div class='row' id="payment-result">
                            <div class='col-md-12 text-center'>                                                       
                                <h4> Total due: <strong id="total-due">  </strong> VND </h4>
                                <h5> Please enter your Card Banking information below: </h5>
                                <div class='row justify-content-center'>
                                    <div class='col-md-8 p-3 m-2 border border-primary rounded text-left'>
                                        <div class='row mb-3 text-left'>
                                            <div class='col-md-6'>
                                                <label for='fullname' >Full Name</label>
                                                <input type='text' id='fullname' class='form-control' value=''>
                                            </div>
                                            <div class='col-md-3'> 
                                                <label for='month' >Month (MM)</label>
                                                <input type='number' id='month' min="1" max="12" class='form-control'>
                                            </div> 
                                            <div class='col-md-3'>
                                                <label for='year' >Year (YY)</label>
                                                <input type='number' id='year' min="0" class='form-control' >
                                            </div>
                                        </div>
                                        <div class='row text-left'>
                                            <div class='col-md-8'>
                                                <label for='card-number' >Card number (xxxx xxxx xxxx xxxx)</label>
                                                <input type='text' id='card-number' class='form-control'>
                                            </div>
                                            <div class='col-md-4'>
                                                <label for='cvv' >CVV (xxx)</label>
                                                <input type='number' id='cvv' min="0" class='form-control' >
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>

                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-primary" id="btn-paynow" >Pay Now</button>                        
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="include/user/footer-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <script src="<c:url value="/resources/myJS/my-bookings.js"/>"></script>



    </body>
</html>
