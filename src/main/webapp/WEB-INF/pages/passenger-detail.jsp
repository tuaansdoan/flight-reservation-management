<%-- 
    Document   : passenger-detail
    Created on : Dec 3, 2022, 8:52:55 PM
    Author     : ASUS
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<c:url value="/resources/images/bg_1.jpg"/>'); height: auto "  id="section-passenger">
            <div class="overlay"></div>
            <div class="container">
                <div class="row align-items-center p-1">

                    <div class="col-md-9">
                        <div class="row mb-3"> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 640 512"><path fill="white" d="M352 128c0 70.7-57.3 128-128 128s-128-57.3-128-128S153.3 0 224 0s128 57.3 128 128zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3zM609.3 512H471.4c5.4-9.4 8.6-20.3 8.6-32v-8c0-60.7-27.1-115.2-69.8-151.8c2.4-.1 4.7-.2 7.1-.2h61.4C567.8 320 640 392.2 640 481.3c0 17-13.8 30.7-30.7 30.7zM432 256c-31 0-59-12.6-79.3-32.9C372.4 196.5 384 163.6 384 128c0-26.8-6.6-52.1-18.3-74.3C384.3 40.1 407.2 32 432 32c61.9 0 112 50.1 112 112s-50.1 112-112 112z"/></svg>
                            <h3 class="text-success align-self-center ml-2">Your Passenger Information</h3>
                        </div>

                        <div class="row"> 
                            <div class="col-md-12  probootstrap-animate">

                                <mvc:form action="${pageContext.request.contextPath}/extra-service" method="POST" id="form-next" modelAttribute="bookingDetail">


                                    <c:forEach begin="0" end="${numOfPax-1}" step="1" varStatus="i">
                                        <div class="probootstrap-form probootstrap-form-box mb60">
                                            <div class="row mb-3 bg-success"> 
                                                <h5 class="text-light m-2"> Passenger ${i.count}  </h5>
                                            </div>
                                            <div class="row mb-3">                                        
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="fname-${i.count}" class="sr-only sr-only-focusable">First Name</label>
                                                        <input required type="text" class="form-control" id="fname-${i.count}" name="passengers[${i.index}].firstName" placeholder="First Name">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="lname-${i.count}" class="sr-only sr-only-focusable">Last Name</label>
                                                        <input required type="text" class="form-control" id="lname-${i.count}" name="passengers[${i.index}].lastName" placeholder="Last Name">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <select  class="js-example-basic-single form-control" id="gender-${i.count}"  name="passengers[${i.index}].gender" style="width: 100%;">
                                                            <option value="" disabled selected class="text-light">Gender</option>
                                                            <c:forEach items="${gender}" var="g">
                                                                <option value="${g}" > ${g.value}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <input required type="text" onfocus="(this.type = 'date')" id="birthDate-${i.count}" name="passengers[${i.index}].birthDate" class="form-control birthDate" placeholder="Date of birth">
                                                    </div>

                                                </div>
                                            </div>                                     
                                        </div>
                                    </c:forEach>

                                    <div class="probootstrap-form probootstrap-form-box mb60">
                                        <div class="row mb-3 bg-info"> 
                                            <h5 class="text-light m-2"> Contact Information </h5>
                                        </div>
                                        <div class="row mb-3">                                        
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="fnamec" class="sr-only sr-only-focusable">First Name</label>
                                                    <input required="" type="text" class="form-control" id="fnamec" name="booking.firstName" placeholder="First Name">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="lnamec" class="sr-only sr-only-focusable">Last Name</label>
                                                    <input required type="text" class="form-control" id="lnamec" name="booking.lastName" placeholder="Last Name">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <select class="js-example-basic-single form-control" id="genderc" name="booking.gender" style="width: 100%;">
                                                        <option value="" disabled selected>Gender</option>
                                                        <c:forEach items="${gender}" var="g">
                                                            <option value="${g}" > ${g.value}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input required type="text" onfocus="(this.type = 'date')" id="birthDatec" name="booking.birthDate" class="form-control birthDate" placeholder="Date of birth">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="email" class="sr-only sr-only-focusable">Email</label>
                                                    <input required type="email" class="form-control" id="email" name="booking.email" placeholder="Email">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="phone" class="sr-only sr-only-focusable">Phone number</label>
                                                    <input type="tel" pattern="[0]{1}[0-9]{9}"  class="form-control" id="phone" name="booking.cellphone" placeholder="Phone number ">
                                                </div>
                                            </div>
                                        </div>
                                    </div>  

                                </mvc:form>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 fixed-right">
                        <div id="total" class="row text-center m-1 justify-content-center">

                            <div class="row" style="width:100%">
                                <div class="col-md-12 bg-success rounded p-1 justify-content-center">
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

                            <input hidden name='fltFareId-departure' value="${fltFareDept.id}">
                            <input hidden name='fltFareId-return' value="${fltFareRetn.id}">

                        </div>
                        <div class="row justify-content-center text-center mt-2">
                            <button type="submit" form="form-next" class="btn btn-primary" > Next</button>
                        </div>
                    </div>

                </div>
            </div>

        </section>
        <jsp:include page="include/user/footer-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        <script src="<c:url value="/resources/myJS/passenger.js"/>"></script>

    </body>
</html>
