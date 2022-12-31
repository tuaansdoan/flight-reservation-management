<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar" id="probootstrap-navbar">
    <div class="container flex-column">     

        <div class="row align-self-stretch">
            <div class="col-4">
                <div class="d-flex align-items-center">
                    <a class="navbar-brand" href="<c:url value="/home"/>"> Ariel <i style="font-size: 12px">Airways </i>  </a> 
                    <i class="gg-airplane" style="color: white"></i>
                </div>
            </div>
            <div class="col-8">
                <div class="row justify-content-end">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#probootstrap-menu" aria-controls="probootstrap-menu" aria-expanded="false" aria-label="Toggle navigation">
                        <span><i class="ion-navicon"></i></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="probootstrap-menu">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="#section-select">Flight Info</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-passenger">Passenger Details</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-extra-services">Extra Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#section-payment">Payment</a></li>                       
                    </ul>
                </div>
            </div>

        </div>
    </div>
</nav>

