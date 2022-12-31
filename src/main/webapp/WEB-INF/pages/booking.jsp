<%-- 
    Document   : welcomePage
    Created on : Jun 9, 2020, 10:09:35 AM
    Author     : ldanh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking flights | Ariel Airways</title>
        <jsp:include page="include/user/css-page.jsp"/>
    </head>
    <body data-spy="scroll" data-target="#probootstrap-navbar" data-offset="200">
        <jsp:include page="include/header-booking.jsp"/>
        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<c:url value="/resources/images/bg_1.jpg"/>'); height: auto "  id="section-select">
            <div class="overlay"></div>
            <div class="container">

                <div class="row align-items-center p-1">
                    <div class="col-md-9">
                        <div class="row mb-3"> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 512 512"> <path fill="white" d="M498.1 5.6c10.1 7 15.4 19.1 13.5 31.2l-64 416c-1.5 9.7-7.4 18.2-16 23s-18.9 5.4-28 1.6L284 427.7l-68.5 74.1c-8.9 9.7-22.9 12.9-35.2 8.1S160 493.2 160 480V396.4c0-4 1.5-7.8 4.2-10.7L331.8 202.8c5.8-6.3 5.6-16-.4-22s-15.7-6.4-22-.7L106 360.8 17.7 316.6C7.1 311.3 .3 300.7 0 288.9s5.9-22.8 16.1-28.7l448-256c10.7-6.1 23.9-5.5 34 1.4z"/></svg>
                            <h3 class="text-success align-self-center ml-2">Choose Your Flight</h3>
                        </div>

                        <input hidden type="text" id="dept-station" value="${route.departure.id}"> 
                        <input hidden type="text" id="dest-station" value="${route.destination.id}"> 
                        <input type="number" id="numOfPax" value="${numOfPax}" hidden>


                        <div class="row mb-5" id="depart-session"> 
                            <div class="col-md-12">
                                <div class="row justify-content-center"> 
                                    <h4 class="text-light bg-success m-0 rounded p-2">
                                        <strong> ${route.departure.description} </strong> (<span class="dept">${route.departure.name}</span>) to <strong>${route.destination.description}</strong> (<span class="dest">${route.destination.name}</span>)
                                    </h4>
                                </div>

                                <div class="row justify-content-center"> 
                                    <div id="pagination" class="col-md-12 text-center justify-content-md-between p-0" > 
                                    </div>

                                </div>


                                <div class="row bg-white ">
                                    <div class="col-md-12">
                                        <table class="table text-center" id="flight-table">
                                            <tr>
                                                <th class="col-4"> <span class="text-success"> Departure </span> <span id="dept-date"><fmt:formatDate pattern="dd-MMM-yyy" value="${flights[0].flightDate}"/> </span> </th>
                                                <th class="col-4 text-center"> ECONOMY </th>
                                                <th class="col-4 text-center" > BUSINESS </th>
                                            </tr>

                                            <c:forEach var="f" items="${flights}" varStatus="i">

                                                <tr>
                                                    <td > 
                                                        <div class="row align-items-center ">
                                                            <div class="col-md-4"> 
                                                                <span class='fs-5' id="dept-time-${f.id}"> <fmt:formatDate pattern="HH:mm" value="${f.departureTime}"/> </span>   
                                                                <br>  ${f.route.departure.name}
                                                            </div>
                                                            <div class="col-md-4 text-center ">
                                                                <i class="ion-arrow-right-a "></i>
                                                                <h6 id="fltNum${f.id}"> ${f.flightNumber} </h6>
                                                            </div>
                                                            <div class="col-md-4"> 
                                                                <span class='fs-5' id="arrv-time-${f.id}">  <fmt:formatDate pattern="HH:mm" value="${f.arrivalTime}"/> </span>
                                                                <br> ${f.route.destination.name}
                                                            </div>
                                                        </div>
                                                    </td>

                                                    <td class="align-middle economy" >
                                                        <c:forEach var="k" items ="${economyFltFares}" varStatus="e">                                                 
                                                            <c:if test="${f.id == k.flight.id}">
                                                                <label for="fare-departure" > ${k.netPrice} </label>  
                                                                <input type="radio" name="fare-departure"  value="${k.netPrice}" onclick="selectFlight(${f.id}, value, '${k.fareType.classType}',${k.id}, 'departure')" > 
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>

                                                    <td class="align-middle business" > 
                                                        <c:forEach var="k" items ="${businessFltFares}" varStatus="e">                                                 
                                                            <c:if test="${f.id == k.flight.id}">
                                                                <label for="fare-departure"> ${k.netPrice} </label>                                                             
                                                                <input type="radio" name="fare-departure" value="${k.netPrice}" onclick="selectFlight(${f.id}, value, '${k.fareType.classType}', ${k.id}, 'departure')" > 
                                                            </c:if>
                                                        </c:forEach>
                                                    </td>                                       
                                                </tr>

                                            </c:forEach>

                                        </table>
                                    </div>
                                </div>  
                            </div>
                        </div>

                        <c:if test="${returnflights != null}">
                            <div class="row" id="return-session"> 
                                <div class="col-md-12"> 
                                    <div class="row justify-content-center"> 
                                        <h4 class="text-light bg-success m-0 rounded p-2">
                                            <strong>  ${route.destination.description} </strong> (<span>${route.destination.name}</span>) to <strong> ${route.departure.description}</strong> (<span>${route.departure.name}</span>)
                                        </h4>
                                    </div>

                                    <div class="row justify-content-center"> 
                                        <div id="pagination-return" class="col-md-12 text-center justify-content-md-between p-0" > 
                                        </div>
                                    </div>

                                    <div class="row bg-white ">
                                        <div class="col-md-12"> 
                                            <table class="table text-center" id="flight-table-return">
                                                <tr>
                                                    <th class="col-4" > <span class="text-success"> Return </span> <span id="return-date">   <fmt:formatDate pattern="dd-MMM-yyy" value="${returnflights[0].flightDate}"/> </span> </th>
                                                    <th class="col-4 text-center"> ECONOMY </th>
                                                    <th class="col-4 text-center" > BUSINESS </th>
                                                </tr>

                                                <c:forEach var="f" items="${returnflights}" varStatus="i">

                                                    <tr>
                                                        <td > 
                                                            <div class="row align-items-center ">
                                                                <div class="col-md-4"> 
                                                                    <span class='fs-5' id="dept-time-${f.id}"> <fmt:formatDate pattern="HH:mm" value="${f.departureTime}"/> </span>   
                                                                    <br>  ${f.route.departure.name}
                                                                </div>
                                                                <div class="col-md-4 text-center ">
                                                                    <i class="ion-arrow-right-a "></i>
                                                                    <h6 id="fltNum${f.id}"> ${f.flightNumber} </h6>
                                                                </div>
                                                                <div class="col-md-4"> 
                                                                    <span class='fs-5' id="arrv-time-${f.id}">  <fmt:formatDate pattern="HH:mm" value="${f.arrivalTime}"/> </span>
                                                                    <br> ${f.route.destination.name}
                                                                </div>
                                                            </div>
                                                        </td>

                                                        <td class="align-middle economy" >
                                                            <c:forEach var="k" items ="${ecoReturnFltFares}" varStatus="e">                                                 
                                                                <c:if test="${f.id == k.flight.id}">
                                                                    <label for="fare-return" > ${k.netPrice} </label>  
                                                                    <input type="radio" name="fare-return"  value="${k.netPrice}" onclick="selectFlight(${f.id}, value, '${k.fareType.classType}',${k.id}, 'return')" > 
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>

                                                        <td class="align-middle business" > 
                                                            <c:forEach var="k" items ="${busiReturnFltFares}" varStatus="e">                                                 
                                                                <c:if test="${f.id == k.flight.id}">
                                                                    <label for="fare-return"> ${k.netPrice} </label>                                                             
                                                                    <input type="radio" name="fare-return" value="${k.netPrice}" onclick="selectFlight(${f.id}, value, '${k.fareType.classType}', ${k.id}, 'return')" > 
                                                                </c:if>
                                                            </c:forEach>
                                                        </td>                                       
                                                    </tr>

                                                </c:forEach>

                                            </table>
                                        </div>
                                    </div>  
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <!-- total money -->

                    <div class="col-md-3 fixed-right" >

                        <form action="<c:url value="/passenger-detail"/>" method="post">

                            <div class="row text-center m-1 justify-content-center">

                                <div class="row" style="width:100%">
                                    <div class="col-md-12 bg-success rounded p-1 justify-content-center">
                                        <h4>  Total <span id="grand-total">0</span>  VND </h4>
                                        <input hidden name="grand-total" id="valueOfTotal" value="">
                                    </div>
                                </div>
                                <div class='row' style='width:100%' id='total-departure'>

                                </div>
                                <div class='row' style='width:100%' id='total-return'>

                                </div>

                            </div>

                            <div class="row justify-content-center text-center mt-2">
                                <button type="submit" class="btn btn-primary" id="next-btn" disabled> Next</button>
                            </div>             

                        </form>

                    </div>              

                </div>
            </div>

        </section>
        <jsp:include page="include/user/footer-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <script src="<c:url value="/resources/myJS/booking.js"/>"></script>

    </body>
</html>
