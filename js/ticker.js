var old_message = '';


function refreshNews() {

    var template_id = 0;
    var terminal_id = 0;

    $.ajax({
        type: "POST",
        url: "/services/preview.asmx/get_message",
        data: "{'template_id': " + template_id + ", 'terminal_id': " + terminal_id + ", 'priority': false}",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (data, status) {

            //console.log("Length: " + data.d.length);

            if (data.d.id < 1) {

                var $mq = $("#announcement_ticker");

                console.log('No Ticker Announcement');

                $mq.hide();
                showMarquee();

                $mq.bind('finished', showMarquee);

            } else {

                var $mq2 = $("#announcement_ticker");

                $mq2.show();
                //$mq2.marquee('destroy');

                console.log(data.d.message);
                console.log('Updating the Data');

                $("#announcement_ticker .fr-editor").html($("#announcement_ticker .fr-editor").html().replace(/{.+}/, data.d.message));

                if (old_message !== data.d.message) {
                    console.log('Old Message does not equal the New Message');

                    $("#announcement_ticker .fr-editor").html($("#announcement_ticker .fr-editor").html().replace(old_message, data.d.message));

                    old_message = data.d.message;
                }

                //$mq.html($("#announcement_ticker .fr-editor").html().replace(/{.+}/, data.d.message));

                console.log('Run the Marquee');
                $mq2.marquee({ duration: 10000 });

                $mq2.bind('finished', showMarquee);

                //$mq2.marquee('destroy');
            }
        }
    });
}



function showMarquee() {
    console.log('Marquee Finished');

    refreshNews();
}