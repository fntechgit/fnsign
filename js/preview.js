$(document).ready(function() {
    setInterval(primary, 10000);
});

function primary() {
    priority_announcements();
}

function secondary() {
    
}

function priority_announcements() {
    // check for announcement
    // these are zero because we are in live preview and not tied to a terminal or template yet
    terminal_id = 0;
    template_id = 0;

    //session_full();

    $.ajax({
        type: "POST",
        url: "/services/preview.asmx/get_message",
        data: "{'template_id': " + template_id + ", 'terminal_id': " + terminal_id + ", 'priority': true}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {

            if (data.d.id > 0) {
                // check to see if this is the announcement template 
                if ($("#is_announcement_template").val() === "no") {
                    if ($("#end_of_day_template").val() !== '') {
                        // build the whole url
                        window.location = '/preview/' + $("#event_id").val() + '/' + $("#location_id").val() + '/' + $("#regular_overlay").val() + '/' + $("#announcement_overlay").val() + '/' + $("#end_of_day_template").val() + '/announcement';
                    } else {
                        // build the url without end of day 
                        window.location = '/preview/' + $("#event_id").val() + '/' + $("#location_id").val() + '/' + $("#regular_overlay").val() + '/announce/' + $("#announcement_overlay").val() + '/announcement';
                    }
                }

                // if it is then render the announcement
                if ($("#priority_title").length) {
                    $("#priority_title .fr-editor").html($("#priority_title .fr-editor").html().replace(/{.+}/, data.d.title));
                }

                if ($("#priority_description").length) {
                    $("#priority_description .fr-editor").html($("#priority_description .fr-editor").html().replace(/{.+}/, data.d.message));
                }

                if ($("#priority_image").length) {
                    if (data.d.pic != null) {
                        $("#priority_image .fr-editor").html($("#priority_image .fr-editor").html().replace(/{.+}/, "<img src=\"/uploads/" + data.d.pic + "\" />"));
                    }
                }

                //$(".twitter").hide();
                //$(".announcement").show();

            } else {

                console.log('No Announcement');

                if ($("#is_announcement_template").val() === "yes") {
                    if ($("#end_of_day_template").val() !== '') {
                        // build the whole url
                        window.location = '/preview/' + $("#event_id").val() + '/' + $("#location_id").val() + '/' + $("#regular_overlay").val() + '/' + $("#announcement_overlay").val() + '/' + $("#end_of_day_template").val() + '/default';
                    } else {
                        // build the url without end of day 
                        window.location = '/preview/' + $("#event_id").val() + '/' + $("#location_id").val() + '/' + $("#regular_overlay").val() + '/announce/' + $("#announcement_overlay").val() + '/default';
                    }
                }

            }
        }
    });
}

//function session_full() {
//    terminal_id = $("#terminal_id").val();
//    template_id = $("#template_id").val();

//    $.ajax({
//        type: "POST",
//        url: "/display.asmx/session_full",
//        data: "{'terminal_id': " + terminal_id + "}",
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: function (data, status) {

//            if (data.d.id > 0) {

//                if (wasFull == false) {
//                    theContent = $("body").html();
//                }
//                wasFull = true;

//                console.log(wasFull);
//                console.log(theContent);

//                $("body").append("<div id='full' style='position:absolute;top:0;left:0;width:1080px;height:1920px;z-index:500;'><img src='/uploads/session_full.jpg' width='1080' height='1920' /></div>");

//            } else {

//                //if ($("#wasFull").val() == "1") {
//                //    theContent = $("#theContentField").val();
//                //}


//                $("#full").remove();

//            }
//        }
//    });
//}