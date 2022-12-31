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
        <title>Payment | Ariel Airways</title>
        <jsp:include page="include/user/css-page.jsp"/>
    </head>

    <body data-spy="scroll" data-target="#probootstrap-navbar" data-offset="200">
        <jsp:include page="include/header-booking.jsp"/>
        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<c:url value="/resources/images/bg_1.jpg"/>'); height: auto "  id="section-payment">
            <div class="overlay"></div>
            <div class="container">
                <div class="row align-items-center p-1">

                    <div class="col-md-9">
                        <div class="row mb-3"> 
                            <svg xmlns="http://www.w3.org/2000/svg"  width="50" height="50" viewBox="0 0 576 512"> <path fill="white" d="M64 64C28.7 64 0 92.7 0 128V384c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V128c0-35.3-28.7-64-64-64H64zM272 192H496c8.8 0 16 7.2 16 16s-7.2 16-16 16H272c-8.8 0-16-7.2-16-16s7.2-16 16-16zM256 304c0-8.8 7.2-16 16-16H496c8.8 0 16 7.2 16 16s-7.2 16-16 16H272c-8.8 0-16-7.2-16-16zM164.1 160v6.3c6.6 1.2 16.6 3.2 21 4.4c10.7 2.8 17 13.8 14.2 24.5s-13.8 17-24.5 14.2c-3.8-1-17.4-3.7-21.7-4.3c-12.2-1.9-22.2-.3-28.6 2.6c-6.3 2.9-7.9 6.2-8.2 8.1c-.6 3.4 0 4.7 .1 5c.3 .5 1 1.8 3.6 3.5c6.1 4.2 15.7 7.2 29.9 11.4l.8 .2c12.1 3.7 28.3 8.5 40.4 17.4c6.7 4.9 13 11.4 16.9 20.5c4 9.1 4.8 19.1 3 29.4c-3.3 19-15.9 32-31.6 38.7c-4.9 2.1-10 3.6-15.4 4.6V352c0 11.1-9 20.1-20.1 20.1s-20.1-9-20.1-20.1v-6.4c-9.5-2.2-21.9-6.4-29.8-9.1c-1.7-.6-3.2-1.1-4.4-1.5c-10.5-3.5-16.1-14.8-12.7-25.3s14.8-16.1 25.3-12.7c2 .7 4.1 1.4 6.4 2.1l0 0 0 0c9.5 3.2 20.2 6.9 26.2 7.9c12.8 2 22.7 .7 28.8-1.9c5.5-2.3 7.4-5.3 8-8.8c.7-4 .1-5.9-.2-6.7c-.4-.9-1.3-2.2-3.7-4c-5.9-4.3-15.3-7.5-29.3-11.7l-2.2-.7c-11.7-3.5-27-8.1-38.6-16c-6.6-4.5-13.2-10.7-17.3-19.5c-4.2-9-5.2-18.8-3.4-29c3.2-18.3 16.2-30.9 31.1-37.7c5-2.3 10.3-4 15.9-5.1v-6c0-11.1 9-20.1 20.1-20.1s20.1 9 20.1 20.1z"/></svg>
                            <h3 class="text-success align-self-center ml-2">Review Your Itinerary </h3>
                        </div>

                        <div class="row bg-light mb-3">
                            <div class="col-md-12">

                                <div class="row bg-info pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 512 512"> <path fill="white" d="M498.1 5.6c10.1 7 15.4 19.1 13.5 31.2l-64 416c-1.5 9.7-7.4 18.2-16 23s-18.9 5.4-28 1.6L284 427.7l-68.5 74.1c-8.9 9.7-22.9 12.9-35.2 8.1S160 493.2 160 480V396.4c0-4 1.5-7.8 4.2-10.7L331.8 202.8c5.8-6.3 5.6-16-.4-22s-15.7-6.4-22-.7L106 360.8 17.7 316.6C7.1 311.3 .3 300.7 0 288.9s5.9-22.8 16.1-28.7l448-256c10.7-6.1 23.9-5.5 34 1.4z"/></svg>
                                    <h5 class="text-light m-2 ">  <strong> Flights </strong>  </h5>
                                </div>

                                <div class="row p-2">                                        
                                    <div class="col-md-6">
                                        <div class="row m-1">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 640 512"><path fill="#020b6b" d="M381 114.9L186.1 41.8c-16.7-6.2-35.2-5.3-51.1 2.7L89.1 67.4C78 73 77.2 88.5 87.6 95.2l146.9 94.5L136 240 77.8 214.1c-8.7-3.9-18.8-3.7-27.3 .6L18.3 230.8c-9.3 4.7-11.8 16.8-5 24.7l73.1 85.3c6.1 7.1 15 11.2 24.3 11.2H248.4c5 0 9.9-1.2 14.3-3.4L535.6 212.2c46.5-23.3 82.5-63.3 100.8-112C645.9 75 627.2 48 600.2 48H542.8c-20.2 0-40.2 4.8-58.2 14L381 114.9zM0 480c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32s-14.3-32-32-32H32c-17.7 0-32 14.3-32 32z"/></svg>
                                            <h6 class="text-primary ml-1"> <strong> Departure flight: <fmt:formatDate pattern="EEE MMM dd yyyy" value="${bookingDetails[0].flightFare.flight.flightDate}"/> </strong> </h6>
                                        </div>
                                        <h6> Ariel Airways - ${bookingDetails[0].flightFare.flight.flightNumber} </h6>
                                        <div class="row m-1">
                                            <div class="col-md-4">
                                                <h6><strong>  <fmt:formatDate pattern="HH:mm" value="${bookingDetails[0].flightFare.flight.departureTime}"/> </strong></h6>
                                                <h6><strong> <fmt:formatDate pattern="HH:mm" value="${bookingDetails[0].flightFare.flight.arrivalTime}"/> </strong></h6>
                                            </div>
                                            <div class="col-md-8">
                                                <h6> ${bookingDetails[0].flightFare.flight.route.departure.description} </h6>
                                                <h6>${bookingDetails[0].flightFare.flight.route.destination.description}</h6>
                                            </div>
                                        </div>
                                        <h6 class="text-success">${bookingDetails[0].flightFare.fareType.classType}</h6>
                                    </div>

                                    <c:if test="${fn:length(bookingDetails) > 1}"> 
                                        <div class="col-md-6">
                                            <div class="row m-1">
                                                <svg xmlns="http://www.w3.org/2000/svg"  width="15" height="15" viewBox="0 0 640 512"> <path fill="#020b6b" d="M.3 166.9L0 68C0 57.7 9.5 50.1 19.5 52.3l35.6 7.9c10.6 2.3 19.2 9.9 23 20L96 128l127.3 37.6L181.8 20.4C178.9 10.2 186.6 0 197.2 0h40.1c11.6 0 22.2 6.2 27.9 16.3l109 193.8 107.2 31.7c15.9 4.7 30.8 12.5 43.7 22.8l34.4 27.6c24 19.2 18.1 57.3-10.7 68.2c-41.2 15.6-86.2 18.1-128.8 7L121.7 289.8c-11.1-2.9-21.2-8.7-29.3-16.9L9.5 189.4c-5.9-6-9.3-14-9.3-22.5zM32 448H608c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32zm160-80c0 17.7-14.3 32-32 32s-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32zm64 48c-17.7 0-32-14.3-32-32s14.3-32 32-32s32 14.3 32 32s-14.3 32-32 32z"/></svg>
                                                <h6 class="text-primary ml-1"> <strong> Return flight:  <fmt:formatDate pattern="EEE MMM dd yyyy" value="${bookingDetails[1].flightFare.flight.flightDate}"/> </strong>  </h6>
                                            </div>
                                            <h6> Arial Airways - ${bookingDetails[1].flightFare.flight.flightNumber} </h6>
                                            <div class="row m-1">
                                                <div class="col-md-4">
                                                    <h6><strong>  <fmt:formatDate pattern="HH:mm" value="${bookingDetails[1].flightFare.flight.departureTime}"/> </strong></h6>
                                                    <h6><strong>  <fmt:formatDate pattern="HH:mm" value="${bookingDetails[1].flightFare.flight.arrivalTime}"/> </strong></h6>
                                                </div>
                                                <div class="col-md-8">
                                                    <h6> ${bookingDetails[1].flightFare.flight.route.departure.description} </h6>
                                                    <h6>${bookingDetails[1].flightFare.flight.route.destination.description}</h6>
                                                </div>
                                            </div>
                                            <h6 class="text-success">${bookingDetails[1].flightFare.fareType.classType}</h6>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>


                        <div class="row bg-light mb-3">
                            <div class="col-md-12">
                                <div class="row bg-info pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 640 512"><path fill="white"  d="M352 128c0 70.7-57.3 128-128 128s-128-57.3-128-128S153.3 0 224 0s128 57.3 128 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM609.3 512H471.4c5.4-9.4 8.6-20.3 8.6-32v-8c0-60.7-27.1-115.2-69.8-151.8c2.4-.1 4.7-.2 7.1-.2h61.4C567.8 320 640 392.2 640 481.3c0 17-13.8 30.7-30.7 30.7zM432 256c-31 0-59-12.6-79.3-32.9C372.4 196.5 384 163.6 384 128c0-26.8-6.6-52.1-18.3-74.3C384.3 40.1 407.2 32 432 32c61.9 0 112 50.1 112 112s-50.1 112-112 112z"/></svg>
                                    <h5 class="text-light m-2"> <strong> Passengers </strong> </h5>
                                </div>

                                <c:forEach var="pax" items="${bookingDetails[0].passengers}" varStatus="i">
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

                        <div class="row bg-light mb-3">
                            <div class="col-md-12">

                                <div class="row bg-info pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 448 512"><path fill="white" d="M200 344V280H136C122.7 280 112 269.3 112 256C112 242.7 122.7 232 136 232H200V168C200 154.7 210.7 144 224 144C237.3 144 248 154.7 248 168V232H312C325.3 232 336 242.7 336 256C336 269.3 325.3 280 312 280H248V344C248 357.3 237.3 368 224 368C210.7 368 200 357.3 200 344zM0 96C0 60.65 28.65 32 64 32H384C419.3 32 448 60.65 448 96V416C448 451.3 419.3 480 384 480H64C28.65 480 0 451.3 0 416V96zM48 96V416C48 424.8 55.16 432 64 432H384C392.8 432 400 424.8 400 416V96C400 87.16 392.8 80 384 80H64C55.16 80 48 87.16 48 96z"/></svg>
                                    <h5 class="text-light m-2">  <strong> Extra Services  </strong> </h5>
                                </div>

                                <div class="row m-2">
                                    <div class="col-md-6 p-2">
                                        <div class="row m-1">
                                            <svg xmlns="http://www.w3.org/2000/svg"  width="15" height="15"  viewBox="0 0 448 512"><path fill="#020b6b" d="M248 48V256h48V58.7c23.9 13.8 40 39.7 40 69.3V256h48V128C384 57.3 326.7 0 256 0H192C121.3 0 64 57.3 64 128V256h48V128c0-29.6 16.1-55.5 40-69.3V256h48V48h48zM48 288c-12.1 0-23.2 6.8-28.6 17.7l-16 32c-5 9.9-4.4 21.7 1.4 31.1S20.9 384 32 384l0 96c0 17.7 14.3 32 32 32s32-14.3 32-32V384H352v96c0 17.7 14.3 32 32 32s32-14.3 32-32V384c11.1 0 21.4-5.7 27.2-15.2s6.4-21.2 1.4-31.1l-16-32C423.2 294.8 412.1 288 400 288H48z"/></svg>
                                            <h6 class="text-primary ml-1">  <strong> Seat selection  </strong> </h6>
                                        </div>

                                        <c:forEach var="bkdt" items="${bookingDetails}">

                                            <h6>  <strong> ${bkdt.flightFare.flight.route.departure.name} to ${bkdt.flightFare.flight.route.destination.name} - ${bkdt.flightFare.flight.flightNumber} </strong>  </h6>
                                            <div class="row m-2">
                                                <c:forEach var="pax" items="${bkdt.passengers}" varStatus="i">
                                                    <div class="col-md-8">
                                                        <h6> ${i.count}. ${pax.lastName} ${pax.firstName}</h6>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <h6> ${pax.seat}</h6>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </c:forEach>
                                    </div>

                                    <div class="col-md-6 p-2 ">
                                        <div class="row m-1">
                                            <svg xmlns="http://www.w3.org/2000/svg"  width="15" height="15" viewBox="0 0 640 512"><path fill="#020b6b" d="M0 32C0 14.3 14.3 0 32 0H48c44.2 0 80 35.8 80 80V368c0 8.8 7.2 16 16 16H608c17.7 0 32 14.3 32 32s-14.3 32-32 32H541.3c1.8 5 2.7 10.4 2.7 16c0 26.5-21.5 48-48 48s-48-21.5-48-48c0-5.6 1-11 2.7-16H253.3c1.8 5 2.7 10.4 2.7 16c0 26.5-21.5 48-48 48s-48-21.5-48-48c0-5.6 1-11 2.7-16H144c-44.2 0-80-35.8-80-80V80c0-8.8-7.2-16-16-16H32C14.3 64 0 49.7 0 32zM432 96V56c0-4.4-3.6-8-8-8H344c-4.4 0-8 3.6-8 8V96h96zM288 96V56c0-30.9 25.1-56 56-56h80c30.9 0 56 25.1 56 56V96 320H288V96zM512 320V96h16c26.5 0 48 21.5 48 48V272c0 26.5-21.5 48-48 48H512zM240 96h16V320H240c-26.5 0-48-21.5-48-48V144c0-26.5 21.5-48 48-48z"/></svg>
                                            <h6 class="text-primary ml-1">  <strong> Luggage  </strong> </h6>
                                        </div>

                                        <c:forEach var="bkdt" items="${bookingDetails}">

                                            <h6>  <strong>  ${bkdt.flightFare.flight.route.departure.name} to ${bkdt.flightFare.flight.route.destination.name} - ${bkdt.flightFare.flight.flightNumber}  </strong>  </h6>
                                            <div class="row m-2">
                                                <c:forEach var="pax" items="${bkdt.passengers}" varStatus="i">
                                                    <div class="col-md-8">
                                                        <h6> ${i.count}. ${pax.lastName} ${pax.firstName}</h6> 
                                                    </div>
                                                    <div class="col-md-4">
                                                        <h6> 
                                                            <c:forEach var="sb" items="${pax.serviceBookings}">
                                                                ${sb.serviceType.name}
                                                            </c:forEach>
                                                        </h6>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </c:forEach>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- PROMOTION CODE -->
                        <div class="row bg-light mb-3">
                            <div class="col-md-12">
                                <div class="row bg-info pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 384 512"> <path fill="white"  d="M374.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-320 320c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l320-320zM128 128c0-35.3-28.7-64-64-64S0 92.7 0 128s28.7 64 64 64s64-28.7 64-64zM384 384c0-35.3-28.7-64-64-64s-64 28.7-64 64s28.7 64 64 64s64-28.7 64-64z"/></svg>
                                    <h5 class="text-light m-2"> <strong> Promotion </strong> </h5>
                                </div>

                                <div class="row p-2 text-center align-items-center">

                                    <div class="col-md-4">                                        
                                        <h6><strong> Enter your promotion code: </strong></h6>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-control" type="text" id="promotion-input">
                                        <input hidden type="text" id="promo-code">
                                    </div>
                                    <div class="col-md-4">
                                        <div class="row justify-content-center">
                                            <button type="button" class="btn btn-outline-primary" id="promotion-check-btn"> Check </button>
                                            <button disabled type="button" class="btn btn-sm btn-primary" id="promotion-apply-btn"> Apply </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row p-2 justify-content-center" id="promo-ajax" >

                                </div>

                            </div>
                        </div>


                        <div class="row bg-light mb-3">
                            <div class="col-md-12">
                                <div class="row bg-info pl-3 p-2 align-items-center"> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 576 512"> <path fill="white" d="M64 32C28.7 32 0 60.7 0 96v32H576V96c0-35.3-28.7-64-64-64H64zM576 224H0V416c0 35.3 28.7 64 64 64H512c35.3 0 64-28.7 64-64V224zM112 352h64c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm112 16c0-8.8 7.2-16 16-16H368c8.8 0 16 7.2 16 16s-7.2 16-16 16H240c-8.8 0-16-7.2-16-16z"/></svg>
                                    <h5 class="text-light m-2">  <strong> Payment Method  </strong> </h5>
                                </div>

                                <div class="row justify-content-around text-center">
                                    <div class="col-md-6">
                                        <label for="paynow">
                                            <img src="<c:url value="/resources/images/PayNow-1666689673.webp"/>" width="150px" alt="not found">
                                        </label>

                                        <input type="radio" name="payment" id="paynow" value="Pay Now">
                                    </div>
                                    <div class="col-md-6">

                                        <label for="paylater">
                                            <img src="<c:url value="/resources/images/PayLater-1666690025.webp"/>" width="150px" alt="not found">
                                        </label>

                                        <input type="radio" name="payment" id="paylater" value="Pay Later">
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>


                    <!-- TOTAL BOARD -->
                    <div class="col-md-3 fixed-right">
                        <div id="total" class="row text-center m-1 justify-content-center">

                            <div class="row" style="width:100%">
                                <div class="col-md-12 bg-success rounded pt-1 justify-content-center">
                                    <h4> Total <span id="total-value" > <fmt:formatNumber groupingUsed="true" value="${grandTotal}"/> </span> VND </h4>
                                    <input hidden id="valueOfTotal" type="text" value="${grandTotal}">
                                </div>
                            </div>

                            <!-- departure total -->
                            <div class="row" style="width:100%">
                                <div class="col-md-12 mt-2 pt-1 bg-light rounded justify-content-center">
                                    <h6>  ${fltFareDept.flight.flightNumber} | ${fltFareDept.flight.route.departure.name}-${fltFareDept.flight.route.destination.name} | <fmt:formatDate pattern="HH:mm" value="${fltFareDept.flight.departureTime}"/>-<fmt:formatDate pattern="HH:mm" value="${fltFareDept.flight.arrivalTime}"/></h6>
                                    <h6>  <fmt:formatDate pattern="EEE MMM dd yyyy" value="${fltFareDept.flight.flightDate}"/> </h6>
                                    <h6> ${numOfPax} Pax X <fmt:formatNumber groupingUsed="true" value="${fltFareDept.netPrice}"/> = <strong> <fmt:formatNumber groupingUsed="true" value="${fltFareDept.netPrice*numOfPax}"/> đ </strong> </h6>
                                    <h6 class='bg-success rounded'> ${fltFareDept.fareType.classType}</h6>

                                </div>
                            </div>

                            <!-- return total -->
                            <c:if test="${fltFareRetn != null}">
                                <div class="row" style="width:100%">
                                    <div class="col-md-12 mt-2 pt-1 bg-light rounded justify-content-center">
                                        <h6>  ${fltFareRetn.flight.flightNumber} | ${fltFareRetn.flight.route.departure.name}-${fltFareRetn.flight.route.destination.name} | <fmt:formatDate pattern="HH:mm" value="${fltFareRetn.flight.departureTime}"/>-<fmt:formatDate pattern="HH:mm" value="${fltFareRetn.flight.arrivalTime}"/></h6>
                                        <h6>  <fmt:formatDate pattern="EEE MMM dd yyyy" value="${fltFareRetn.flight.flightDate}"/> </h6>                                       
                                        <h6> ${numOfPax} Pax X <fmt:formatNumber groupingUsed="true" value="${fltFareRetn.netPrice}"/> = <strong> <fmt:formatNumber groupingUsed="true" value="${fltFareRetn.netPrice*numOfPax}"/> đ </strong> </h6>
                                        <h6 class='bg-success rounded'> ${fltFareRetn.fareType.classType}</h6>
                                    </div>
                                </div>
                            </c:if>

                            <div class="accordion col-md-12" id="accordionExample">
                                <c:if test="${ totalSeatPrice > 0}"> 
                                    <div class="card row mt-2">
                                        <div class="col-md-12 p-0">
                                            <div class="card-header p-2" id="headingOne">
                                                <h6 class="mb-0 " data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                    Seat <strong> <fmt:formatNumber groupingUsed="true" value="${totalSeatPrice}"/> đ </strong> 
                                                </h6>
                                            </div>

                                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                                <!-- seat setting -->
                                                <div class="row card-body m-0" style="width:100%">
                                                    <c:if test="${totalSeatPrice > 0}">
                                                        <div class="col-md-12 p-1 rounded" id="seat-total">
                                                            <c:forEach var="s" items="${seatPrice}">
                                                                <h6> 01 seat X <span> <fmt:formatNumber groupingUsed="true" value="${s}"/> </span> đ </h6>
                                                            </c:forEach>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                
                                <c:if test="${ totalBagPrice > 0}"> 
                                    <div class="card row mt-2">
                                        <div class="col-md-12 p-0">
                                            <div class="card-header p-2" id="headingTwo">
                                                <h6 class="mb-0 " data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                                    Luggage  <strong> <fmt:formatNumber groupingUsed="true" value="${totalBagPrice}"/> đ </strong>
                                                </h6>
                                            </div>
                                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                                <!-- baggage setting -->
                                                <div class="row card-body m-0  " style="width:100%">
                                                    <c:if test="${totalBagPrice > 0}">
                                                        <div class="col-md-12 p-1 rounded" id="baggage-total">
                                                            <c:forEach var="bkdt" items="${bookingDetails}">
                                                                <c:forEach var="pax" items="${bkdt.passengers}">
                                                                    <c:forEach var="svbk" items="${pax.serviceBookings}">
                                                                        <h6> 01 bag X <span> <fmt:formatNumber groupingUsed="true" value="${svbk.serviceType.price}"/> </span> đ </h6>                                           
                                                                    </c:forEach>                                        
                                                                </c:forEach>
                                                            </c:forEach>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>

                            </div>


                            <!-- promotion setting -->
                            <div class="row  " style="width:100%" id="promo-display" >

                            </div>

                        </div>
                        <div class="row justify-content-center text-center mt-2">
                            <button disabled id="payment-btn" type="button" form="form-next"  data-toggle="modal" data-target="#paymentModal"  class="btn btn-primary"> Payment</button>
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
                        <h3 class="modal-title text-light " id="exampleModalLabel"> <strong> Ariel Airways - Booking Confirmation </strong> </h3>
                    </div>
                    <div class="modal-body">
                        <div class='row' id="payment-result">
                            <div class='col-md-12 text-center'>                                                            

                            </div>
                        </div>

                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-primary" id="btn-paynow" >Pay Now</button>
                        <button type="button" class="btn btn-primary" id="btn-confirm"> Confirm </button>

                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="include/user/footer-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <script src="<c:url value="/resources/myJS/payment.js"/>"></script>


    </body>
</html>
