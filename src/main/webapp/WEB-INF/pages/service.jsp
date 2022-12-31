<%-- 
    Document   : service
    Created on : Dec 4, 2022, 7:37:43 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking flights | Ariel Airways</title>
        <jsp:include page="include/user/css-page.jsp"/>

    </head>

    <body data-spy="scroll" data-target="#probootstrap-navbar" data-offset="200">
        <jsp:include page="include/header-booking.jsp"/>

        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<c:url value="/resources/images/bg_1.jpg"/>'); height: auto "  id="section-extra-services">
            <div class="overlay"></div>
            <div class="container">

                <div class="row align-items-center p-1">

                    <div class="col-md-9" id="accordion">


                        <mvc:form action="${pageContext.request.contextPath}/payment-detail" method="POST" id="form-next" modelAttribute="bookingpax">
                            <input hidden id="valueOfTotal" name="grand-total" value="${grandTotal}"> <!-- for controller -->

                            <div class="row mb-3"> 
                                <svg xmlns="http://www.w3.org/2000/svg" height="50" width="50" viewBox="0 0 384 512"><path fill="white" d="M144 56c0-4.4 3.6-8 8-8h80c4.4 0 8 3.6 8 8v72H144V56zm176 72H288V56c0-30.9-25.1-56-56-56H152C121.1 0 96 25.1 96 56v72H64c-35.3 0-64 28.7-64 64V416c0 35.3 28.7 64 64 64c0 17.7 14.3 32 32 32s32-14.3 32-32H256c0 17.7 14.3 32 32 32s32-14.3 32-32c35.3 0 64-28.7 64-64V192c0-35.3-28.7-64-64-64zM112 224H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 128H272c8.8 0 16 7.2 16 16s-7.2 16-16 16H112c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/></svg>
                                <h3 class="text-success align-self-center ml-2">Extra services</h3>
                            </div>


                            <div class="row card"> 
                                <div class="col-md-12  probootstrap-animate">
                                    <div class="row bg-light p-2" >
                                        <div class="col-md-4" style="background-image: url('<c:url value="/resources/images/seat-selection.webp"/>'); background-size: 100%; background-position: center; background-repeat: no-repeat; ">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="probootstrap-animate" data-animate-effect="fadeInRight">
                                                <h3 class="heading m-2">Seat Selection</h3>
                                                <div class="row justify-content-center text-center">
                                                    <div class="col-md-4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" viewBox="0 0 640 512"><path fill="#020b6b" d="M64 160C64 89.3 121.3 32 192 32H448c70.7 0 128 57.3 128 128v33.6c-36.5 7.4-64 39.7-64 78.4v48H128V272c0-38.7-27.5-71-64-78.4V160zM544 272c0-20.9 13.4-38.7 32-45.3c5-1.8 10.4-2.7 16-2.7c26.5 0 48 21.5 48 48V448c0 17.7-14.3 32-32 32H576c-17.7 0-32-14.3-32-32H96c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32V272c0-26.5 21.5-48 48-48c5.6 0 11 1 16 2.7c18.6 6.6 32 24.4 32 45.3v48 32h32H512h32V320 272z"/></svg>
                                                        <h6>Select your preferred seat</h6>

                                                    </div>
                                                    <div class="col-md-4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" viewBox="0 0 640 512"><path fill="#020b6b"d="M184 88c0 30.9-25.1 56-56 56s-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56zM64 245.7C54 256.9 48 271.8 48 288s6 31.1 16 42.3V245.7zm144.4-49.3C178.7 222.7 160 261.2 160 304c0 34.3 12 65.8 32 90.5V416c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V389.2C26.2 371.2 0 332.7 0 288c0-61.9 50.1-112 112-112h32c24 0 46.2 7.5 64.4 20.3zM448 416V394.5c20-24.7 32-56.2 32-90.5c0-42.8-18.7-81.3-48.4-107.7C449.8 183.5 472 176 496 176h32c61.9 0 112 50.1 112 112c0 44.7-26.2 83.2-64 101.2V416c0 17.7-14.3 32-32 32H480c-17.7 0-32-14.3-32-32zM568 88c0 30.9-25.1 56-56 56s-56-25.1-56-56s25.1-56 56-56s56 25.1 56 56zm8 157.7v84.7c10-11.3 16-26.1 16-42.3s-6-31.1-16-42.3zM320 160c-35.3 0-64-28.7-64-64s28.7-64 64-64s64 28.7 64 64s-28.7 64-64 64zM240 304c0 16.2 6 31 16 42.3V261.7c-10 11.3-16 26.1-16 42.3zm144-42.3v84.7c10-11.3 16-26.1 16-42.3s-6-31.1-16-42.3zM448 304c0 44.7-26.2 83.2-64 101.2V448c0 17.7-14.3 32-32 32H288c-17.7 0-32-14.3-32-32V405.2c-37.8-18-64-56.5-64-101.2c0-61.9 50.1-112 112-112h32c61.9 0 112 50.1 112 112z"/></svg>
                                                        <h6> Sit together with your family and friends</h6>

                                                    </div>
                                                    <div class="col-md-4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" viewBox="0 0 448 512"><path fill="#020b6b" d="M336 48c0-26.5-21.5-48-48-48s-48 21.5-48 48s21.5 48 48 48s48-21.5 48-48zM141.7 175.5c9.9-9.9 23.4-15.5 37.5-15.5c1.9 0 3.8 .1 5.6 .3L153.6 254c-9.3 28 1.7 58.8 26.8 74.5l86.2 53.9-25.4 88.8c-4.9 17 5 34.7 22 39.6s34.7-5 39.6-22l28.7-100.4c5.9-20.6-2.6-42.6-20.7-53.9L254 299l30.9-82.4 5.1 12.3C305 264.7 339.9 288 378.7 288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H378.7c-12.9 0-24.6-7.8-29.5-19.7l-6.3-15c-14.6-35.1-44.1-61.9-80.5-73.1l-48.7-15c-11.1-3.4-22.7-5.2-34.4-5.2c-31 0-60.8 12.3-82.7 34.3L73.4 153.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l23.1-23.1zM107.2 352H48c-17.7 0-32 14.3-32 32s14.3 32 32 32h69.6c19 0 36.2-11.2 43.9-28.5L173 361.6l-9.5-6c-17.5-10.9-30.5-26.8-37.9-44.9L107.2 352z"/></svg>
                                                        <h6> Board and leave the plane with ease</h6>

                                                    </div>
                                                </div>
                                                <div class="row justify-content-center">
                                                    <button class="btn btn-primary" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
                                                            aria-controls="collapseOne">
                                                        Select
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="collapseOne" class="collapse " aria-labelledby="headingOne" data-parent="#accordion" style="height: auto" >
                                    <div class="row card-body ">
                                        <div class="col-md-6 ">

                                            <c:forEach var="bkdt" items="${bookingDetails}" varStatus="j">
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
                                                                    <h6 class="text-primary" id="seat-status-${i.count}${bkdt.flightFare.flight.id}" >Choose your seat </h6>
                                                                </div>
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
                                                            </div>
                                                        </div>
                                                    </div>

                                                </c:forEach>  
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


                            <div class="row mt-2 card">
                                <div class="col-md-12  probootstrap-animate">
                                    <div class="row bg-light p-2" >

                                        <div class="col-md-8">
                                            <div class="probootstrap-animate" data-animate-effect="fadeInLeft">
                                                <h3 class="heading m-2">Extra Baggage</h3>
                                                <div class="row justify-content-center text-center">
                                                    <div class="col-md-4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" viewBox="0 0 512 512"><path fill="#020b6b" d="M176 56V96H336V56c0-4.4-3.6-8-8-8H184c-4.4 0-8 3.6-8 8zM128 96V56c0-30.9 25.1-56 56-56H328c30.9 0 56 25.1 56 56V96v32V480H128V128 96zM64 96H96V480H64c-35.3 0-64-28.7-64-64V160c0-35.3 28.7-64 64-64zM448 480H416V96h32c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64z"/></svg>
                                                        <h6>Carry more than your free cabin baggage allowance</h6>

                                                    </div>
                                                    <div class="col-md-4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" viewBox="0 0 576 512"><path fill="#020b6b" d="M400 96l0 .7c-5.3-.4-10.6-.7-16-.7H256c-16.5 0-32.5 2.1-47.8 6c-.1-2-.2-4-.2-6c0-53 43-96 96-96s96 43 96 96zm-16 32c3.5 0 7 .1 10.4 .3c4.2 .3 8.4 .7 12.6 1.3C424.6 109.1 450.8 96 480 96h32l-18.8 75.1c15.8 14.8 28.7 32.8 37.5 52.9H544c17.7 0 32 14.3 32 32v96c0 17.7-14.3 32-32 32H512c-9.1 12.1-19.9 22.9-32 32v64c0 17.7-14.3 32-32 32H416c-17.7 0-32-14.3-32-32V448H256v32c0 17.7-14.3 32-32 32H192c-17.7 0-32-14.3-32-32V416c-34.9-26.2-58.7-66.3-63.2-112H68c-37.6 0-68-30.4-68-68s30.4-68 68-68h4c13.3 0 24 10.7 24 24s-10.7 24-24 24H68c-11 0-20 9-20 20s9 20 20 20H99.2c12.1-59.8 57.7-107.5 116.3-122.8c12.9-3.4 26.5-5.2 40.5-5.2H384zm64 136c0-13.3-10.7-24-24-24s-24 10.7-24 24s10.7 24 24 24s24-10.7 24-24z"/></svg>
                                                        <h6> Save up to 80% compared to airport rates </h6>

                                                    </div>
                                                    <div class="col-md-4">
                                                        <svg xmlns="http://www.w3.org/2000/svg" height="40" width="40" viewBox="0 0 512 512"> <path fill="#020b6b"  d="M384 176c0 70.7-57.3 128-128 128s-128-57.3-128-128s57.3-128 128-128s128 57.3 128 128zm7.8-112C359.5 24.9 310.7 0 256 0S152.5 24.9 120.2 64H64C28.7 64 0 92.7 0 128V448c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V128c0-35.3-28.7-64-64-64H391.8zM296 224c0-10.6-4.1-20.2-10.9-27.4l33.6-78.3c3.5-8.1-.3-17.5-8.4-21s-17.5 .3-21 8.4L255.7 184c-22 .1-39.7 18-39.7 40c0 22.1 17.9 40 40 40s40-17.9 40-40z"/></svg>
                                                        <h6> Diverse extra baggage options</h6>

                                                    </div>
                                                </div>                                            
                                                <div class="row justify-content-center">
                                                    <button class="btn btn-primary collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                                            aria-expanded="false" aria-controls="collapseTwo">
                                                        Select
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4" style="background-image: url(<c:url value="/resources/images/travel-concept-with-baggage-passport.jpg"/>); background-size: 100%; background-position: center; background-repeat: no-repeat; ">
                                        </div>
                                    </div>
                                </div>


                                <!-- BAGGAGE -->

                                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="row card-body">
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

                                            <c:forEach var="bkdt" items="${bookingDetails}" varStatus="j">

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
                                                                <div class="col-md-5 bagdiv align-self-center" id="bagdiv-${i.count}${bkdt.flightFare.flight.id}">
                                                                    <div class="row">
                                                                        <div class="col-md-8 pt-1 text-center bg-success rounded">
                                                                            <h4 id="selected-baggage-${i.count}${bkdt.flightFare.flight.id}"></h4>  
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

                                                                <input hidden type="text" id="luggage-${i.count}${bkdt.flightFare.flight.id}" name="bookingDetails[${j.index}].passengers[${i.index}].serviceBookings[0].serviceType.id" value="0"> <!-- for controller -->

                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </mvc:form>


                    </div>


                    <input hidden type="text"  id="numOfPax" value="${numOfPax}">

                    <!-- TOTAL AMOUNT -->
                    <div class="col-md-3 fixed-right">
                        <div id="total" class="row text-center m-1 justify-content-center">

                            <div class="row" style="width:100%">
                                <div class="col-md-12 bg-success rounded pt-1 justify-content-center">
                                    <h4> Total <span id="total-value" > <fmt:formatNumber groupingUsed="true" value="${grandTotal}"/> </span> VND </h4>
                                    <input hidden id="fareTotal" value="${grandTotal}">
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

                        </div>
                        <div class="row justify-content-center text-center mt-2">
                            <button type="submit" class="btn btn-primary" form="form-next">Next</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="include/user/footer-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <script src="<c:url value="/resources/myJS/extra-service.js"/>"></script>
    </body>
</html>
