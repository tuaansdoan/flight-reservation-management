<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
    <div class="container flex-column">
<!--        <div class="row align-self-end">
            <div class="col-12" style="font-size: 12px">
                <sec:authorize access="!isAuthenticated()">
                    <span><a href="<c:url value="/login" />"  data-toggle="modal" data-target="#loginModal" >Login</a></span>
                </sec:authorize>            
                <span> | </span>
                <span> Sign Up  </span>
            </div>
        </div>-->

        <div class="row align-self-stretch">
            <div class="col-4">

                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="<c:url value="/home"/>"> Ariel <i style="font-size: 12px">Airways </i>  </a> 
                    <i class="gg-airplane" style="color: white"></i>
                </div>
            </div>
            <div class="col-8 align-self-center">
                <div class="row justify-content-end">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
                        <span><i class="ion-navicon"></i></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="probootstrap-menu">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="#section-home">Search flights</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-city-guides">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-services">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-travel">Travel With Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-contact">My Bookings </a></li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</nav>
<!-- Modal -->
<!--<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 400px">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form action="<c:url value="j_spring_security_check"/>" id="form-login" method="post">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="username">User Name</label>
                                <input autocomplete="off" required type="email" class="form-control" name="username" placeholder="User Name">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">

                            <div class="form-group">
                                <label for="password" >Password</label>
                                <input autocomplete="off" required type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
                
            <div class="modal-footer">
                <input type="submit" class="btn btn-success" form="form-login"  value="login"/>
            </div>
        </div>
    </div>
</div>-->
