/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {

    $("#promotion-check-btn").click(function () {

        var promoCode = $("#promotion-input").val();

        $.ajax({
            type: "POST",
            url: "promotion-check",
            data: {promoCode: promoCode},
            success: function (data) {
                $("#promo-ajax").html(data);

                if (parseInt($("#promoValue").val()) > 0) {
                    $("#promotion-apply-btn").removeAttr("disabled");
                }
            }
        });



    });

    $("#promotion-apply-btn").click(function () {

        var total = parseInt($("#valueOfTotal").val());
        var promoValue = parseInt($("#promoValue").val());
        var promoCode = $("#promotion-input").val();

        total -= promoValue;

        $("#total-value").text(total.toLocaleString('en-vn', {style: 'decimal'}));
        $("#promo-display").html("<div class=\"col-md-12 mt-2 p-1 bg-light rounded\">"
                + "<h6> Promo <strong class='text-danger'> (" + promoValue.toLocaleString('en-vn', {style: 'decimal'}) + ") đ</strong>  </h6>"
                + "</div>");

        $("#valueOfTotal").attr("value", total);
        $("#promotion-apply-btn").attr("disabled", true);
        $("#promotion-input").val("");
        $("#promo-code").attr("value", promoCode);

    });

// REMOVE PROMO CODE
    $("#promotion-input").focus(function () {

        var total = parseInt($("#valueOfTotal").val());
        var promoValue = parseInt($("#promoValue").val());

        if ($.isNumeric(promoValue)) {
            total += promoValue;
            $("#valueOfTotal").attr("value", total);
            $("#total-value").text(total.toLocaleString('en-vn', {style: 'decimal'}));
        }

        $("#promo-display").empty();
        $("#promo-ajax").empty();

        $("#promotion-apply-btn").attr("disabled", true);
        $("#promo-code").removeAttr("value");


    });

    $("#paynow").click(function () {
        $("#btn-paynow").show();
        $("#btn-confirm").hide();
        $("#payment-btn").removeAttr("disabled");
    });

    $("#paylater").click(function () {
        $("#btn-paynow").hide();
        $("#btn-confirm").show();
        $("#payment-btn").removeAttr("disabled");
    });

    $("#payment-btn").click(function () {
        var promoCode = $("#promo-code").val();
        var paymentMethod = $("input[name='payment']:checked").val();
        var totalAmount = $("#valueOfTotal").val();

        $.ajax({
            type: "POST",
            url: "payment-booking",
            data: {promoCode: promoCode,
                paymentMethod: paymentMethod,
                grandTotal: totalAmount},
            success: function (data) {
                $(".modal-body").html(data);
            }
        });
    });


// pay later
    $("#btn-confirm").click(function () {
        var promoCode = $("#promo-code").val();
        var delay = 5000;
        var totalAmount = $("#valueOfTotal").val();
        $.ajax({
            type: "POST",
            url: "pay-later",
            data: {promoCode: promoCode,
                grandTotal: totalAmount},
            success: function (data) {
                $(".modal-body").html(data);
                setTimeout(function () {
                    window.location = "home";
                }, delay);
            }
        });
    });

// pay now
    $("#btn-paynow").click(function () {

        var promoCode = $("#promo-code").val();
        var delay = 8000;
        var fullname = $("#fullname").val();
        var month = $("#month").val();
        var year = $("#year").val();
        var cardNumber = $("#card-number").val();
        var cvv = $("#cvv").val();
        var totalAmount = $("#valueOfTotal").val();
        

        if (fullname === "" || month === "" || year === "" || cardNumber === "" || cvv === "") {
            $(".modal-body").append("<div class='row justify-content-center invalidcard'> <h4 class='text-danger'> *Please enter your card information! </h4></div>");
            removeTextInvalid();
        } else {
            $.ajax({
                type: "POST",
                url: "pay-now",
                data: {promoCode: promoCode,
                    fullname: fullname,
                    month: month,
                    year: year,
                    cardNumber: cardNumber,
                    cvv: cvv,
                    grandTotal: totalAmount},
                success: function (data) {
                    $(".modal-body").append(data);

                    removeTextInvalid();

                    if ($("h4").hasClass("bksc")) {
                        setTimeout(function () {
                            window.location = "home";
                        }, delay);
                    }

                }
            });
        }
        ;

    });



});

//invalid card

function removeTextInvalid() {
    $(".invalidcard").fadeOut(5000, function () {
        $(".invalidcard").remove();
    });
}
