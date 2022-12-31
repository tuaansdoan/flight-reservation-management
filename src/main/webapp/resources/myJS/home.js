/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function () {
    $("#id_label_single").change(function () {

        var dept = $("#id_label_single option:selected").val();

        $.ajax({
            type: "POST",
            url: "select-dest",
            data: {dept: dept},
            success: function (data) {

                $('#id_label_single2').html(data);
            }
        });
    });

    $("#oneway").click(function () {
        $("#probootstrap-date-arrival").removeAttr("required");
        $("#return-date").hide();
        $("#probootstrap-date-arrival").attr("disabled", true);

    });

    $("#round").click(function () {
        $("#probootstrap-date-arrival").attr("required", true);
        $("#return-date").show();
        $("#probootstrap-date-arrival").removeAttr("disabled");

    });

    $("#retrieve-booking").click(function () {

        var lastname = $("#lname").val();
        var reference = $("#reference").val();

        $(".myBookingsMsg").remove();

        if (lastname === "" || reference === "") {
            $("#myBookingsMsg-container").append("<h6 class='text-danger myBookingsMsg'> *Please enter reference and lastname! </h6>");
            $(".myBookingsMsg").fadeOut(5000, function () {
                $(".myBookingsMsg").remove();
            });
        } else {

            $.ajax({
                type: "POST",
                url: "check-myBookings",
                data: {lastname: lastname,
                    reference: reference},
                success: function (data) {
                    if (data === "fail") {
                        $("#myBookingsMsg-container").append("<h6 class='text-danger myBookingsMsg'> *Invalid reference or lastname! </h6>");
                        $(".myBookingsMsg").fadeOut(5000, function () {
                            $(".myBookingsMsg").remove();
                        });
                    }

                    if (data === "done") {
                        $("#form-myBookings").submit();
                    }
                }
            });

        }

    });

    
});

function removeTextInvalid() {
    $(".invalidcard").fadeOut(5000, function () {
        $(".invalidcard").remove();
    });
}
