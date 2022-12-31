/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {

    $("#aircraft-model").hide();
    $(".dpldiv").hide();
    $("#seat-total").hide();
    $(".bagdiv").hide();
    $("#baggage-total").hide();


});

//SEAT SELECTION
var id;

var numOfPax = parseInt($("#numOfPax").val());

function displaySeatMap(flightId) {

    $.ajax({
        type: "POST",
        url: "seat-map",
        data: {flightId: flightId},
        success: function (data) {
            $("#seat-map-table").html(data);

            //select again selected seat
            for (var i = 1; i <= numOfPax; i++) {
                var seatNum = $("#ctrl-seat-" + i + flightId).val();
                $("#seat-" + seatNum + "-" + flightId).removeClass("bg-white").addClass("bg-success").addClass("picked" + i + flightId).attr("disabled", "true");

            }
        }
    });



}

function selectPaxForSeat(index, flightId) {

    id = index;

    $("#aircraft-model").show();


    //select pax and set flt id for seat map
    if ($("#seatmap-fltId").val() === "") {
        $("#seatmap-fltId").attr("value", flightId);
        displaySeatMap(flightId);
    }

    //select pax in other seatmap
    if (parseInt($("#seatmap-fltId").val()) !== parseInt(flightId)) {
        $("#seatmap-fltId").attr("value", flightId);

        displaySeatMap(flightId);

    }


    //for display border of selecting pax
    $(".hoverseat").removeClass("border-primary").addClass("border-dark").removeAttr("style");
    $("#choose-seat-" + id + flightId).removeClass("border-dark").addClass("border-primary").css("border-width", "2px");



}

function pickUpSeat(seatNum, price, flightId) {


    $("#seat-total").show();

    $(".picked" + id + flightId).removeClass("picked" + id + flightId).addClass("bg-white").removeAttr("disabled");
    $("#seat-" + seatNum + "-" + flightId).removeClass("bg-white").addClass("bg-success").addClass("picked" + id + flightId).attr("disabled", "true");

    $("#selected-seat-" + id + flightId).text(seatNum);
    $("#dpl-div-" + id + flightId).show();
    $("#seat-price-" + id + flightId).text(price.toLocaleString('en-vn', {style: 'decimal'}));
    $("#value-price-" + id + flightId).attr("value", price);
    $("#seat-status-" + id + flightId).text("Selected");
    $("#ctrl-seat-" + id + flightId).attr("value", seatNum);

    //set total price

    totalSet();

}

function removeSeat(index, flightId) {
    id = index;
    $("#selected-seat-" + id + flightId).empty();
    $("#seat-price-" + id + flightId).empty();
    $("#value-price-" + id + flightId).removeAttr("value");
    $("#seat-status-" + id + flightId).text("Choose your seat");
    $("#dpl-div-" + id + flightId).hide();
    $("#ctrl-seat-" + id + flightId).removeAttr("value");


    $(".picked" + id + flightId).removeClass("picked" + id + flightId).addClass("bg-white").removeAttr("disabled");

    totalSet();
}

//calculate total
function totalSet() {

    var preTotal = parseInt($("#fareTotal").val());
    var totalPriceSeat = 0;
    var totalPriceBag = 0;

    $("#seat-total").empty();
    $("#baggage-total").empty();

    $(".seat-price").each(function () {
        if ($.isNumeric(parseInt($(this).val()))) {
            totalPriceSeat += parseInt($(this).val());
            var pr = parseInt($(this).val());
            $("#seat-total").append("<h6> 01 seat X <span> " + pr.toLocaleString('en-vn', {style: 'decimal'}) + "</span> đ </h6>");
        }
    });

    $("input[name|='baggage']:radio:checked").each(function () {
        if ($.isNumeric(parseInt($(this).val()))) {
            totalPriceBag += parseInt($(this).val());
            var pr = parseInt($(this).val());
            $("#baggage-total").append("<h6> 01 bag X <span> " + pr.toLocaleString('en-vn', {style: 'decimal'}) + "</span> đ </h6>");
        }
    });

    if (totalPriceBag === 0) {
        $("#baggage-total").hide();
    }

    if (totalPriceSeat === 0) {
        $("#seat-total").hide();
    }

    var total = preTotal + totalPriceSeat + totalPriceBag;
    $("#total-value").text(total.toLocaleString('en-vn', {style: 'decimal'}));
    $("#valueOfTotal").attr("value", total);

    
}



//BAGGAGE SELECTION

function selectBagForPax(index, name, bagServiceId, flightId) {

    id = index;
    $("#baggage-total").show();

    $("#bag-status-" + id + flightId).text("Baggage selected");
    $("#selected-baggage-" + id + flightId).text(name);
    $("#bagdiv-" + id + flightId).show();
    $("#luggage-" + id + flightId).attr("value", bagServiceId);
    totalSet();


}

function removeBag(index, flightId) {
    id = index;

    $("#selected-baggage-" + id + flightId).empty();
    $("#bagdiv-" + id + flightId).hide();
    $("#bag-status-" + id + flightId).text("Choose your baggage");
    $("#bag-" + id + flightId).prop("checked", true);
    $("#luggage-" + id + flightId).attr("value", 0);
    totalSet();
}

