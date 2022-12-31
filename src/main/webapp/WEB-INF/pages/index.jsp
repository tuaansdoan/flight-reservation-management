<%-- 
    Document   : index
    Created on : Nov 24, 2022, 10:04:33 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ariel Airways</title>
        <jsp:include page="include/user/css-page.jsp"/>
    </head>

    <body data-spy="scroll" data-target="#probootstrap-navbar" data-offset="200">
        <jsp:include page="include/user/header.jsp"/>

        <section class="probootstrap-cover overflow-hidden relative"  style="background-image: url('<c:url value="/resources/images/bg_1.jpg"/>'); height: 120vh "  id="section-home">
            <div class="overlay"></div>
            <div class="container">
                <div class="row align-items-center" style="padding-top: 0px">
                    <div class="col-md">
                        <h2 class="heading mb-2 display-4 font-light probootstrap-animate">Explore The World With Ease</h2>
                    </div> 
                    <div class="col-md probootstrap-animate">
                        <mvc:form class="probootstrap-form" action="${pageContext.request.contextPath}/search-flight" method="POST" >

                            <div class="form-group">
                                <div>
                                    <h6 class="text-danger text-center"> ${msg} </h6>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="id_label_single">From</label>
                                            <div class="probootstrap_select-wrap">
                                                <label for="id_label_single" style="width: 100%;">
                                                    <select required class="js-example-basic-single js-states form-control" id="id_label_single" name="departure" style="width: 100%;">
                                                        <option value="" disabled selected>-- Select --</option>
                                                        <c:forEach items="${listDeparture}" var="d">
                                                            <option value="${d.departure.id}" > ${d.departure.description}</option>
                                                        </c:forEach>
                                                    </select>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-group">
                                            <label for="id_label_single2">To</label>
                                            <div class="probootstrap_select-wrap">
                                                <label for="id_label_single2" style="width: 100%;">
                                                    <select required class="js-example-basic-single js-states form-control" id="id_label_single2" name="destination" style="width: 100%;">
                                                        <option value="" disabled  selected>-- Select --</option>

                                                    </select>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END row -->

                                <div class="row mb-2">
                                    <div class="col-md">
                                        <label for="round" class="mr-5"><input type="radio" id="round" name="direction" checked> Round Trip</label>
                                        <label for="oneway"><input type="radio" id="oneway" name="direction">  Oneway</label>
                                    </div>
                                </div>
                                <!-- END row -->

                                <div class="row mb-2">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="probootstrap-date-departure">Departure date</label>
                                            <div class="probootstrap-date-wrap">
                                                <span class="icon ion-calendar"></span> 
                                                <input autocomplete="off" type="text" id="probootstrap-date-departure" name="departureDate" class="form-control" required >
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6" id="return-date">
                                        <div class="form-group">
                                            <label for="probootstrap-date-arrival">Return date</label>
                                            <div class="probootstrap-date-wrap">
                                                <span class="icon ion-calendar"></span> 
                                                <input autocomplete="off" type="text" id="probootstrap-date-arrival" name="returnDate" class="form-control" required>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- END row -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="numOfPax">Number of Passengers:</label>
                                        <input type="number" id="numOfPax" name="numOfPax" class="form-control" value="1" min="1" max="10"  required>
                                    </div>
                                </div>

                                <div class="row">                                  
                                    <div class="col-md">
                                        <input type="submit" value="Search flights" class="btn btn-primary btn-block" >
                                    </div>
                                </div>
                            </div>
                        </mvc:form>
                    </div>
                </div>
            </div>

        </section>
        <!-- END section -->


        <section class="probootstrap_section" id="section-feature-testimonial">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-12 text-center mb-5 probootstrap-animate">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Why we Love Places</h2>
                        <blockquote class="">
                            <p class="lead mb-4"><em>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</em></p>
                            <p class="probootstrap-author">
                                <a>
                                    <img src="<c:url value="/resources/images/person_1.jpg"/>" alt="Free Template by ProBootstrap.com" class="rounded-circle">
                                    <span class="probootstrap-name">James Smith</span>
                                    <span class="probootstrap-title">Chief Executive Officer</span>
                                </a>
                            </p>
                        </blockquote>

                    </div>
                </div>

            </div>
        </section>
        <!-- END section -->


        <section class="probootstrap_section" id="section-city-guides">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Top Places Around The World</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
                        <a href="#" class="probootstrap-thumbnail">
                            <img src="<c:url value="/resources/images/img_1.jpg"/>" alt="Free Template by ProBootstrap.com" class="img-fluid">
                            <div class="probootstrap-text">
                                <h3>Buena</h3>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
                        <a href="#" class="probootstrap-thumbnail">
                            <img src="<c:url value="/resources/images/img_2.jpg"/>" alt="Free Template by ProBootstrap.com" class="img-fluid">
                            <h3>Road</h3>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
                        <a href="#" class="probootstrap-thumbnail">
                            <img src="<c:url value="/resources/images/img_3.jpg"/>" alt="Free Template by ProBootstrap.com" class="img-fluid">
                            <h3>Australia</h3>
                        </a>
                    </div>
                    <div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
                        <a href="#" class="probootstrap-thumbnail">
                            <img src="<c:url value="/resources/images/img_4.jpg"/>" alt="Free Template by ProBootstrap.com" class="img-fluid">
                            <h3>Japan</h3>
                        </a>
                    </div>
                </div>
            </div>
        </section>



        <section class="probootstrap_section" id="section-services">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Our Services</h2>
                    </div>
                </div>
            </div>
        </section>


        <section class="probootstrap-section-half d-md-flex" id="section-about">
            <div class="probootstrap-image probootstrap-animate" data-animate-effect="fadeIn" style="background-image: url(<c:url value="/resources/images/img_2.jpg"/>)"></div>
            <div class="probootstrap-text">
                <div class="probootstrap-inner probootstrap-animate" data-animate-effect="fadeInRight">
                    <h2 class="heading mb-4">Customer Service</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                    <p><a href="#" class="btn btn-primary">Read More</a></p>
                </div>
            </div>
        </section>


        <section class="probootstrap-section-half d-md-flex">
            <div class="probootstrap-image order-2 probootstrap-animate" data-animate-effect="fadeIn" style="background-image: url(<c:url value="/resources/images/img_3.jpg"/>)"></div>
            <div class="probootstrap-text order-1">
                <div class="probootstrap-inner probootstrap-animate" data-animate-effect="fadeInLeft">
                    <h2 class="heading mb-4">Payment Options</h2>
                    <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.</p>
                    <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                    <p><a href="#" class="btn btn-primary">Learn More</a></p>
                </div>
            </div>
        </section>
        <!-- END section -->

        <section class="probootstrap_section" id="section-travel">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Travel With Us</h2>
                    </div>
                </div>

                <div class="row probootstrap-animate">
                    <div class="col-md-12">
                        <div class="owl-carousel js-owl-carousel">
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-teatro-de-la-caridad"></span>
                                <em>Teatro de la Caridad</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-royal-museum-of-the-armed-forces"></span>
                                <em>Royal Museum of the Armed Forces</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-parthenon"></span>
                                <em>Parthenon</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-marina-bay-sands"></span>
                                <em>Marina Bay Sands</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-samarra-minaret"></span>
                                <em>Samarra Minaret</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-chiang-kai-shek-memorial"></span>
                                <em>Chiang Kai Shek Memorial</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-heuvelse-kerk-tilburg"></span>
                                <em>Heuvelse Kerk Tilburg</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-cathedral-of-cordoba"></span>
                                <em>Cathedral of Cordoba</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-london-bridge"></span>
                                <em>London Bridge</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-taj-mahal"></span>
                                <em>Taj Mahal</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-leaning-tower-of-pisa"></span>
                                <em>Leaning Tower of Pisa</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-burj-al-arab"></span>
                                <em>Burj al Arab</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-gate-of-india"></span>
                                <em>Gate of India</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-osaka-castle"></span>
                                <em>Osaka Castle</em>
                            </a>
                            <a class="probootstrap-slide" href="#">
                                <span class="flaticon-statue-of-liberty"></span>
                                <em>Statue of Liberty</em>
                            </a>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END section -->

        <section class="probootstrap_section bg-light">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">More Services</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_1.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <h5 class="mb-3">01. Service Title Here</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                            </div>
                        </div>

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_2.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <h5 class="mb-3">02. Service Title Here</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_4.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <h5 class="mb-3">03. Service Title Here</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                            </div>
                        </div>

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_5.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <h5 class="mb-3">04. Service Title Here</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- END section -->

        <section class="probootstrap_section" id="section-feature-testimonial">
            <div class="container">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-12 text-center mb-5 probootstrap-animate">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Testimonial</h2>
                        <blockquote class="">
                            <p class="lead mb-4"><em>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</em></p>
                            <p class="probootstrap-author">
                                <a>
                                    <img src="<c:url value="/resources/images/person_1.jpg"/>" alt="Free Template by ProBootstrap.com" class="rounded-circle">
                                    <span class="probootstrap-name">James Smith</span>
                                    <span class="probootstrap-title">Chief Executive Officer</span>
                                </a>

                            </p>
                        </blockquote>

                    </div>
                </div>

            </div>
        </section>
        <!-- END section -->

        <section class="probootstrap_section bg-light">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">News</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_1.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <span class="text-uppercase">January 1st 2018</span>
                                <h5 class="mb-3">Travel To United States Without Visa</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_2.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <span class="text-uppercase">January 1st 2018</span>
                                <h5 class="mb-3">Travel To United States Without Visa</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-6">

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_4.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <span class="text-uppercase">January 1st 2018</span>
                                <h5 class="mb-3">Travel To United States Without Visa</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>

                        <div class="media probootstrap-media d-flex align-items-stretch mb-4 probootstrap-animate">
                            <div class="probootstrap-media-image" style="background-image: url(<c:url value="/resources/images/img_5.jpg"/>)">
                            </div>
                            <div class="media-body">
                                <span class="text-uppercase">January 1st 2018</span>
                                <h5 class="mb-3">Travel To United States Without Visa</h5>
                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                <p><a href="#">Read More</a></p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <!-- END section -->

        <section class="probootstrap_section">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">Travel With Us</h2>
                    </div>
                </div>

                <div class="row probootstrap-animate">
                    <div class="col-md-12">
                        <div class="owl-carousel js-owl-carousel-2">
                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_2.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_1.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_3.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_4.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_5.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->


                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_2.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_1.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_3.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_4.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                            <div>
                                <div class="media probootstrap-media d-block align-items-stretch mb-4 probootstrap-animate">
                                    <img src="<c:url value="/resources/images/sq_img_5.jpg"/>" alt="Free Template by ProBootstrap" class="img-fluid">
                                    <div class="media-body">
                                        <h5 class="mb-3">02. Service Title Here</h5>
                                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. </p>
                                    </div>
                                </div>
                            </div>
                            <!-- END slide item -->

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END section -->

        <section class="probootstrap_section bg-light" id="section-contact">
            <div class="container">
                <div class="row text-center mb-5 probootstrap-animate">
                    <div class="col-md-12">
                        <h2 class="display-4 border-bottom probootstrap-section-heading">My Bookings</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 probootstrap-animate">

                        <p>The functions in My Bookings:  </p>
                        <div class="row">
                            <ul style="list-style-type: none;">                                                               
                                <li class="ion-android-arrow-up"> Review your bookings </li>
                                <li class="ion-android-arrow-up"> Make payment </li>
                                <li class="ion-android-arrow-up"> Add/Remove extra services </li>
                                <li class="ion-android-arrow-up"> Cancel bookings </li>
                            </ul>
                        </div>
                        <small>
                            <strong>Please note:</strong> Some of the features are restricted to bookings made by third parties (e.g. tour operators and travel agencies).
                        </small>

                        <div class="row mt-5"> <h5 class="text-success"> <strong> GET IN TOUCH: </strong>  </h5></div>
                        <div class="row ">
                            <div class="col-md-6">
                                <ul class="probootstrap-contact-details">
                                    <li>
                                        <span class="text-uppercase"><span class="ion-paper-airplane"></span> Email</span>
                                        tuandoan.potn@gmail.com
                                    </li>
                                    <li>
                                        <span class="text-uppercase"><span class="ion-ios-telephone"></span> Phone</span>
                                        +84 787 501 170
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <ul class="probootstrap-contact-details">
                                    <li>
                                        <span class="text-uppercase"><span class="ion-ios-person"></span> LinkedIn</span>
                                        tuandoan.potn
                                    </li>
                                    <li>
                                        <span class="text-uppercase"><span class="ion-location"></span> Address</span>
                                        Cam Le <br>                                         
                                        Da Nang, Viet Nam
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6  probootstrap-animate">
                        <form action="${pageContext.request.contextPath}/my-bookings" id="form-myBookings" method="post" class="probootstrap-form probootstrap-form-box mb60">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="reference">Booking reference </label>
                                        <input type="text" class="form-control" id="reference" name="reference" placeholder="e.g KH77TU">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lname" >Last Name</label>
                                        <input type="text" class="form-control" id="lname" name="lastname" placeholder="e.g Nguyen">
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <input type="button" class="btn btn-primary btn-block" id="retrieve-booking" value="Retrieve booking">
                                </div>
                            </div>
                            <div class="row mt-4 justify-content-center" id="myBookingsMsg-container">
                                <h6 class="text-danger myBookingsMsg">${myBookingsMsg}</h6>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="include/user/footer-page.jsp"/>
        <jsp:include page="include/user/js-page.jsp"/>
        
        <script src="<c:url value="/resources/myJS/home.js"/>"></script>

    </body>
</html>
