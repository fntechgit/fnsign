$.getScript("/js/jquery.cookie.js", function () { });

var theContent = '';
var wasFull = false;

$(document).ready(function () {
    summit();
});

function summit() {
    var height = $(".inner").height();

    var outerHeight = $(".scroll-wrapper-inner").height();

    if (height > outerHeight) {
        $(".inner").animate({ top: "-" + height }, 25000, "linear", slideBottom);
    }
}

function slideBottom() {

    var height = $(".inner").height();

    $(".inner").css("top", "1300px");

    $(".inner").animate({ top: "-" + height}, 25000, "linear", cycle);
}

function cycle() {
    slideBottom();
}

function session_full() {
    location_id = $("#location_sched").val();

    console.log('Checking for Full Session');

    var single_height = $("#current_session_header .session").height();

    $.ajax({
        type: "POST",
        url: "/services/preview.asmx/current",
        data: "{'location': '" + location_id + "'}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {

            if (data.d.event_id == 0) {

                //console.log('EventID Lost');

                var cookie_id = $.cookie("FNSIGN_EventID");

                // if Session["event_id"] Is Null check for the cookie
                $.ajax({
                    type: "POST",
                    url: "/services/preview.asmx/loginAgain",
                    data: "{'event_id': '" + cookie_id + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data, status) {
                        session_full();
                    }
                });

            } else {
                // check to see if the session is full
                if (data.d.full === true) {
                    // show the full session graphic
                    var fullsess = $("#full_session_graphic").val();

                    console.log('Session Is Full');

                    $("body").append("<div id='full' style='position:absolute;top:0;left:0;width:1080px;height:1920px;z-index:500;'><img src='/uploads/" + fullsess + "' width='1080' height='1920' /></div>");

                } else {
                    $("#full").remove();
                }
            }
        }
    });
}