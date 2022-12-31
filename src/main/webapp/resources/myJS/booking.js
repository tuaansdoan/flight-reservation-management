/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var deptDate = $("#dept-date").text();
var currentDate = new Date(deptDate);

var retDate = $("#return-date").text();

if (retDate !== "") {
    var returnDate = new Date(retDate);
}

var deptStation = $("#dept-station").val();
var destStation = $("#dest-station").val();

var dataAjax = "";


$(document).ready(function () {
    var dept = createPagination(currentDate, "departure");
    $("#pagination").html(dept);

    var flightdept = changeDate(currentDate, deptStation, destStation, "departure");
    $("#flight-table").html(flightdept);

    if (retDate !== "") {
        var rtrn = createPagination(returnDate, "return");
        $("#pagination-return").html(rtrn);

        var flightreturn = changeDate(returnDate, destStation, deptStation, "return");
        $("#flight-table-return").html(flightreturn);
    }

});

function createPagination(enterDate, roundTrip) {
    var crrntDate = new Date(enterDate);
    var ngay = new Date(enterDate).getDate();
    var prevDate = new Date(enterDate);
    var nextDate = new Date(enterDate);


    let str = '<ul>';

    str += "<li class='page-item no'><a onclick=\"createPagination(" + prevDate.setDate(ngay - 1)
            + ",\'" + roundTrip + "\')\"> <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' width='40px' height='40px'><path fill='white' fill-rule='evenodd' d='M9.78 12.78a.75.75 0 01-1.06 0L4.47 8.53a.75.75 0 010-1.06l4.25-4.25a.75.75 0 011.06 1.06L6.06 8l3.72 3.72a.75.75 0 010 1.06z'></path></svg></a></li>";

    for (let i = -3; i < 4; i++) {
        let status = (i === 0) ? "active" : "no";
        str += "<li class='page-item " + status + "'>"
                + "<a onclick=\"createPagination(" + crrntDate.setDate(ngay + i) + ",\'" + roundTrip + "\')\">"
                + crrntDate.toLocaleDateString('en-us', {weekday: "short", day: "2-digit", month: "short"})
                + '</a></li>';

        crrntDate = new Date(enterDate);

    }

    str += "<li class='page-item no'><a onclick=\"createPagination(" + nextDate.setDate(ngay + 1)
            + ",\'" + roundTrip + "\')\"> <svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' width='40px' height='40px'><path fill='white' fill-rule='evenodd' d='M6.22 3.22a.75.75 0 011.06 0l4.25 4.25a.75.75 0 010 1.06l-4.25 4.25a.75.75 0 01-1.06-1.06L9.94 8 6.22 4.28a.75.75 0 010-1.06z'></path></svg></a></li>";

    str += '</ul>';

    if (roundTrip === "departure") {
        document.getElementById('pagination').innerHTML = str;
        var flightDept = changeDate(crrntDate, deptStation, destStation, roundTrip);
        $("#flight-table").html(flightDept);
    }

    if (roundTrip === "return") {
        document.getElementById('pagination-return').innerHTML = str;
        var flightReturn = changeDate(crrntDate, destStation, deptStation, roundTrip);
        $("#flight-table-return").html(flightReturn);
    }

    return str;
}

//change day on date pagination
function changeDate(enterDate, departure, destination, roundTrip) {
    var date = new Date(enterDate);
    $("#total-" + roundTrip).empty();
    totalAmount();

    $.ajax({
        type: "POST",
        url: "change-date",
        data: {date: date, departure: departure, destination: destination, roundTrip},
        success: function (data) {
            dataAjax = data;

            if (roundTrip === "departure") {
                $("#flight-table").html(data);
            }

            if (roundTrip === "return") {
                $("#flight-table-return").html(data);
            }

            soldout();
            $("#next-btn").attr("disabled", true);

        }
    });

//    $("#total").html("<div class='row' style='width:100%'>"
//            + "<div class='col-md-12 bg-success rounded p-1 justify-content-center'>"
//            + "<h4>  Total <span> 0 VND </span> </h4>"
//            + "</div>"
//            + "</div>");

    return dataAjax;
}

//set sold out

function soldout() {
    $("td").each(function () {
        var str = $(this).text().trim();
        if (str === "") {
            $(this).text("SOLD OUT");
        }
    });
}

//calculate total amount for each round
function selectFlight(index, value, fareType, fltFareId, roundTrip) {

    var dept;
    var dest;
    var date;

    var deptTime = $("#dept-time-" + index).text();
    var arrvTime = $("#arrv-time-" + index).text();
    var fltNum = $("#fltNum" + index).text();
    var price = parseInt(value);
    var numOfPax = $("#numOfPax").val();



    if (roundTrip === "departure") {
        date = new Date($("#dept-date").text());
        dept = $(".dept").text();
        dest = $(".dest").text();
    }

    if (roundTrip === "return") {
        date = new Date($("#return-date").text());
        dest = $(".dept").text();
        dept = $(".dest").text();
    }

    var content = "";

    content += "<div class='col-md-12 mt-2 pt-1 bg-light rounded justify-content-center'>"
            + "<h6>" + fltNum + " | " + dept + "-" + dest + " | " + "<span>" + deptTime + "-" + arrvTime + "</span></h6>"
            + "<h6>" + date.toDateString() + "</h6>"
            + "<h6>" + numOfPax + " Pax X " + price.toLocaleString('en-vn', {style: 'decimal'}) + " = <strong>" + (numOfPax * price).toLocaleString('en-vn', {style: 'decimal'}) + " đ </strong> </h6>"
            + "<h6 class='bg-success rounded'>" + fareType + "</h6>"
            + "</div>"
            + "<input hidden type='text' id='sum-" + roundTrip + "' value='" + numOfPax * price + "'>"
            + "<input hidden name='fltFareId-" + roundTrip + "' value='" + fltFareId + "'>";


    $("#total-" + roundTrip).html(content);

    totalAmount();
    nextButton();

}

//grand total
function totalAmount() {
    var sumDept = parseInt($("#sum-departure").val());
    var sumRetn = parseInt($("#sum-return").val());

    if (!$.isNumeric(sumDept)) {
        sumDept = 0;
    }

    if (!$.isNumeric(sumRetn)) {
        sumRetn = 0;
    }

    $("#grand-total").text((sumDept + sumRetn).toLocaleString('en-vn', {style: 'decimal'}));
    $("#valueOfTotal").val(sumDept + sumRetn);
}

//next button remove disabled
function nextButton() {
    if (retDate !== "") {
        if ($("input[name='fare-departure']").is(":checked") && $("input[name='fare-return']").is(":checked")) {
            $("#next-btn").removeAttr("disabled");
        }
    } else {
        $("#next-btn").removeAttr("disabled");
    }

}