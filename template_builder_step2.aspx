<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="template_builder_step2.aspx.cs" Inherits="fnsignManager.template_builder_step2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <link href="/js/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/07105a45a7.js"></script>
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="//cloud.typography.com/6546274/756308/css/fonts.css" />
    
    <script src="/js/jquery-ui/external/jquery/jquery.js"></script>
    <script src="/js/jquery-ui/jquery-ui.js"></script>
    
    <script src="https://use.typekit.net/uzf7lvs.js"></script>
    <script>try{Typekit.load({ async: true });}catch(e){}</script>
    
    <!-- Include Editor style. -->
    <link href='https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/froala_editor.min.css' rel='stylesheet' type='text/css' />
    <link href='https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/froala_style.min.css' rel='stylesheet' type='text/css' />
    <link href='https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/colors.min.css' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/char_counter.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/code_view.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/emoticons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/file.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/fullscreen.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/image.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/image_manager.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/line_breaker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/quick_insert.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/special_characters.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/table.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/css/plugins/video.min.css">

    <!-- Include JS file. -->
    <script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/froala_editor.min.js'></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/align.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/char_counter.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/code_view.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/colors.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/emoticons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/entities.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/file.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/font_family.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/font_size.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/fullscreen.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/image.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/image_manager.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/inline_style.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/line_breaker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/link.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/lists.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/paragraph_format.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/paragraph_style.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/print.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/quick_insert.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/quote.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/save.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/special_characters.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/table.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/url.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.4.2/js/plugins/video.min.js"></script>
    
    <script>
        $.FroalaEditor.DEFAULTS.key = '7D-11riH-8G-7hC5ali==';
    </script>
    
    <style type="text/css">
        #wrapper { width: 100%;height: 100%;background-color: #000;padding-top: 35px;padding-left: 0px;padding-right: 0px;}
        #container { width: 25%;height: <%= temp_height %>px;background-color: #1d2127;float: left;box-shadow: -5px 0 0 #2f3139 inset;color: #777777;vertical-align: top;}
        #template_wrapper { width: 75%;height: <%= temp_height %>px;overflow: scroll;float: left;}
        #controls { width: 100%;float: left;height: 35px;position: fixed;top: 0;left: 0;background-color: #cccccc;z-index: 1000;}
        #template { position: relative; }

        .sidebar-header { position: relative;color: #777777;height: 50px; }
        .sidebar-title { color: #465162;padding: 15px; }
        .sidebar-toggle { position: absolute;top: 0;right: 0;width: 73px;height: 50px;background-color: #171717;border-radius: 0 0 0 5px;text-align: center;cursor: pointer; }
        .fa-bars { margin-top: 15px;}
        .theme-options { float: left;width: 300px;max-height: 150px;position: relative;margin-left: 15px;margin-top: 20px; }
        .resizable {border: 1px solid #ccc;}
        .control { float: left;margin-right: 15px; }
        .content-header { cursor: move;height: 20px;background-color: #c0c0c0;}
        .right { float: right; }
        .scrolling-panel { height: 300px;width: 100%; }
        .scrolling-block { height: 320px;margin-bottom: 20px;position: relative; }
        .repeating-panel { height: 500px;width: 100%; }
        .repeating-block { height: 520px;margin-bottom: 20px; }

        .inactive { color: #231f20; }
        .active { color: #0072b7; }

        .ui-resizable-helper { border: 1px dotted gray; }

        .trash { width: 128px;height: 128px;position: fixed;z-index: 10000;bottom: 10px;right: 10px; }
        .empty { background-image: url('/img/trash_empty.png'); }
        .full { background-image: url('/img/trash_full.png'); }
        .trash .hover { background-image: url('/img/trash_hover.png'); }

        .scrollHover { border: 1px dotted #0072b7; background-color: #0072b7;opacity: 0.3; }

        /* grid */
        .col-3 { width: 25%;float: left; }
        .col-6 { width: 50%;float: left; }
        .controls-left {width: 40%;float:left; }
        .controls-center { width: 30%;float: left;}

        .success { color: #00b73c; }

        /* fonts */
        h1 { font-family: 'Open Sans', sans-serif;font-size: 24px;font-weight: 800;color: #231f20;margin-top: 0;padding-top: 0; }

        /*#scrolling_block { z-index: 10000; }*/
        .ui-tabs .ui-tabs-panel { padding: 0; }
        .ui-tabs .ui-tabs-nav { padding: 0; }
        .ui-widget-header { background-color: #1d2127;border: none; }
        #tabs { border: none; }
        .ui-tabs-anchor { font-size: 13px; }

        .theme-options span { color: #777777; }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
            <div id="trash" class="trash empty"></div>
            <div id="controls">
                <div class="controls-left">
                    <div class="control">
                        <img src="/assets/images/logo2.png" style="height: 25px; padding-top: 5px; padding-bottom: 5px;" />
                    </div>
                    <div class="control">
                        Move <a href="javascript:void();" onclick="toggleDraggable()"><i class="fa fa-arrows fa-2x active" id="drag-button"></i></a>
                    </div>
                    <div class="control">
                        Resize <a href="javascript:void();" onclick="toggleSizable()"><i class="fa fa-arrows-alt fa-2x inactive" id="resize-button"></i></a>
                    </div>
                    <div class="control">
                        Edit <a href="javascript:void();" onclick="toggleEditor()"><i class="fa fa-pencil-square-o fa-2x inactive" id="edit-button"></i></a>
                    </div>
                </div>
                <div class="controls-center">
                    <h1><%= o.title %></h1>
                </div>
                <div class="controls-center">
                    <div id="live_preview_container" class="control right">
                        Preview <a href="/preview-options/<%= o.id %>" target="_blank">
                            <i class="fa fa-television fa-2x inactive" id="preview_button"></i>
                        </a>
                    </div>
                    <div id="save_button_container" class="control right">
                        Save <a href="javascript:void();" onclick="save()">
                            <i class="fa fa-save fa-2x inactive" id="save_button"></i></a>
                    </div>
                    <div class="control right">
                        Back <a href="/overlays"><i class="fa fa-arrow-circle-o-left fa-2x inactive"></i></a>
                    </div>
                </div>
            </div>
            <div id="container">
                <div class="sidebar-header">
		            <div class="sidebar-title">
		                Options
		            </div>
		            <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
		                <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		            </div>
		        </div>
                <!-- TABS GO HERE --> 
                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">Main</a></li>
                        <li><a href="#tabs-2">Announcements</a></li>
                        <li><a href="#tabs-3">More</a></li>
                        <li><a href="#tabs-4">Social</a></li>
                    </ul>
                    <!-- DRAG AND DROP OPTIONS GO HERE -->
                    <div id="tabs-1">
                    <div class="theme-options draggable" id="session_title">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-title">{SESSION TITLE}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="session_category">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-category">{SESSION CATEGORY}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="session_location">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-location">{SESSION LOCATION}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="session_start_time">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-start-time">{START TIME: 00:00AM}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="session_start_date">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-start-date">{START DATE: MM/DD}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="session_end_time">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-end-time">{END TIME: 00:00PM}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="session_description">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="session-description">{SESSION DESCRIPTION}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="speaker_name">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="speaker-name">{SPEAKER NAME}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="speaker_company">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="speaker-company">{SPEAKER COMPANY}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="speaker_twitter">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="speaker-twitter">{SPEAKER TWITTER}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="speaker_email">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="speaker-email">{SPEAKER EMAIL}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="current_server_time">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="current-server-time">{SERVER TIME: 00:00AM}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="current_desktop_time">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="current-desktop-time">{CHROMEBOX TIME: 00:00AM}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="header_block">
                       <div class="resizable">
                           <div class="content-header"></div>
                           <div class="fr-editor invisible">
                               <span replace="header-block">{HEADER}</span>
                           </div>
                       </div>
                    </div>
                    <div class="theme-options draggable" id="logo_replacement">
                        <div class="content-header"></div>
                        <img class="fr-editor" id="logo-replacement" src="/img/logo_template.png"/>
                    </div>
                    <div class="theme-options draggable repeating-block" id="repeating_block">
                        <div id="repeating_size" class="resizable">
                            <div id="repeating_header" class="content-header"></div>
                            <div id="repeating_panel" class="repeating-panel">
                                <span class="repeating-help" replace="repeating-block">{REPEATING BLOCK}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable scrolling-block" id="scrolling_block">
                        <div id="scrolling_size" class="resizable">
                            <div id="scrolling_header" class="content-header"></div>
                            <div id="scrolling_panel" class="scrolling-panel">
                                <span class="scrolling-help" replace="scrolling-block">{SCROLLING BLOCK}</span>
                            </div>
                        </div>
                    </div>
                    </div>
                    <div id="tabs-2">
                        <div class="theme-options draggable" id="announcement_ticker">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="announcement-ticker">{TICKER}</span>
                                </div>
                            </div>
                        </div>
                        <div class="theme-options draggable" id="priority_title">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="priority-title">{ANNOUNCEMENT TITLE}</span>
                                </div>
                            </div>
                        </div>
                        <div class="theme-options draggable" id="priority_description">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="priority-description">{ANNOUNCEMENT DESCRIPTION}</span>
                                </div>
                            </div>
                        </div>
                        <div class="theme-options draggable" id="priority_image">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="priority-image">{ANNOUNCEMENT IMAGE}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tabs-3">
                    <div class="theme-options draggable" id="end_of_day_title">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="end-of-day-title">{END OF DAY / NO SESSION TITLE}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="end_of_day_category">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="end-of-day-category">{END OF DAY / NO SESSION CATEGORY}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="end_of_day_time">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="end-of-day-time">{END OF DAY / NO SESSION TIME}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="end_of_day_description">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="end-of-day-description">{END OF DAY / NO SESSION DESCRIPTION}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="next_session_title">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="next-session-title">{NEXT SESSION TITLE}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="next_session_start_time">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="next-session-start-time">{NEXT SESSION START TIME}</span>
                            </div>
                        </div>
                    </div>
                    <div class="theme-options draggable" id="next_session_start_time_and_title">
                        <div class="resizable">
                            <div class="content-header"></div>
                            <div class="fr-editor">
                                <span replace="next-session-start-time-and-title">{NEXT SESSION START TIME & TITLE 2:00 pm: THIS IS THE TITLE}</span>
                            </div>
                        </div>
                    </div>
                </div>
                    <div id="tabs-4">
                        <div class="theme-options draggable" id="twitter_pic">
                            <div class="content-header"></div>
                            <img class="fr-editor" id="twitter-pic" src="/img/twitter.jpg"/>
                        </div>
                        <div class="theme-options draggable" id="twitter_name">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="twitter-name">{TWITTER NAME}</span>
                                </div>
                            </div>
                        </div>
                        <div class="theme-options draggable" id="twitter_username">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="twitter-username">{TWITTER USERNAME}</span>
                                </div>
                            </div>
                        </div>
                        <div class="theme-options draggable" id="twitter_tweet">
                            <div class="resizable">
                                <div class="content-header"></div>
                                <div class="fr-editor">
                                    <span replace="twitter-tweet">{TWEET}</span>
                                </div>
                            </div>
                        </div>
                        <div class="theme-options draggable repeating-block" id="twitter_block">
                            <div id="twitter_size" class="resizable">
                                <div id="twitter_header" class="content-header"></div>
                                <div id="twitter_panel" class="repeating-panel">
                                    <span class="twitter-help" replace="twitter-block">{TWITTER BLOCK}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="template_wrapper">
                <div id="template" runat="server" ClientIDMode="Static">
                    <!-- This is where the template is built -->
                            
                </div>
            </div>
        </div>
        
        <asp:HiddenField runat="server" ID="template_width" />
        <asp:HiddenField runat="server" ID="template_height" />
        <asp:HiddenField runat="server" ID="template_bg" />
        <asp:HiddenField runat="server" ID="overlay_id" />

    </form>
    
    <script type="text/javascript">

        var drag = true;
        var size = false;
        var edit = false;

        $(".resizable").resizable({
            handles: 'n, e, s, w, ne, se, sw, nw',
            start: function (e, ui) {

            },
            resize: function (e, ui) {

            },
            stop: function (e, ui) {
                if ($(this).prop('id') == 'scrolling_size') {

                    console.log('found it');

                }
            }
        });

        function toggleSizable() {
            if (size) {
                $(".resizable").resizable('disable');
                size = false;

                $("#resize-button").removeClass('active').addClass('inactive');
            } else {
                // disable draggable
                $(".draggable").draggable('disable');
                drag = false;

                // disable editor
                $(".fr-editor").froalaEditor('destroy');
                edit = false;

                // enable sizable
                $(".resizable").resizable('enable');
                size = true;

                $(".active").removeClass('active').addClass('inactive');
                $("#resize-button").removeClass('inactive').addClass('active');
            }
        }

        function toggleEditor() {
            if (edit) {
                $(".fr-editor").froalaEditor('destroy');
                edit = false;

                $("#edit-button").removeClass('active').addClass('inactive');
            } else {
                // disable draggable
                $(".draggable").draggable('disable');
                drag = false;

                // disable sizable 
                $(".resizable").resizable('disable');
                size = false;

                $(".fr-editor").froalaEditor({
                    toolbarInline: true,
                    charCounterCount: false,
                    toolbarButtons: ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', '|', 'specialCharacters', 'color', 'emoticons', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', '-', 'quote', 'insertHR', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', '|', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html', 'applyFormat', 'removeFormat', 'fullscreen', 'print', 'help'],
                    fontFamily: {
                        "Arial,sans-serif": 'Arial',
                        "franklin-gothic-urw,sans-serif": 'Franklin Gothic',
                        "Georgia,sans-serif": 'Georgia',
                        "Gotham Narrow A,Gotham Narrow B,sans-serif": 'Gotham Narrow',
                        "Impact,sans-serif": 'Impact',
                        "Tahoma,sans-serif": 'Tahoma',
                        "Times New Roman,sans-serif": 'Times New Roman',
                        "Verdana,sans-serif": 'Verdana'
                    },
                    fontFamilySelection: true,
                    fontSizeSelection: true,
                    paragraphFormatSelection: true
                });
                edit = true;

                $(".active").removeClass('active').addClass('inactive');
                $("#edit-button").removeClass('inactive').addClass('active');
            }
        }

        function destroyRemnants() {
            $(".ui-draggable-dragging").remove();
        }

        function toggleDraggable() {
            if (drag) {
                $(".dragme").draggable('disable');
                $(".draggable").draggable('disable');
                drag = false;

                $("#drag-button").removeClass('active').addClass('inactive');
            } else {
                // disable resizable
                $(".resizable").resizable('disable');
                size = false;

                // disable editor
                $(".fr-editor").froalaEditor('destroy');
                edit = false;

                // enable draggable
                $(".dragme").draggable('enable');
                $(".draggable").draggable('enable');
                drag = true;

                $(".active").removeClass('active').addClass('inactive');
                $("#drag-button").removeClass('inactive').addClass('active');
            }
        }

        $(document).ready(function() {
            $("#template").css('width', $("#template_width").val() + 'px');
            $("#template").css('height', $("#template_height").val() + 'px');
            $("#template").css('background-image', "url('http://fnsign.azurewebsites.net/uploads/" + $("#template_bg").val() + "')");
        });

        function save() {

            $("#template #scrolling_panel").css("height", $("#template #scrolling_size").css("height")).css("position", "relative").css("overflow", "hidden");
            //$("#template #scrolling_panel").css("height", $("#template #scrolling_size").height());

            var id = $("#overlay_id").val();
            var layout = escape($("#template").html());

            $.ajax({
                type: "POST",
                url: "/services/editor.asmx/save",
                data: "{'id': " + id + ", 'layout': '" + layout + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                async: false,
                success: function () {
                    $("#save_button").addClass("success");
                }
            });
        }

        $(function() {
            
            $("#tabs").tabs();

            $(".resizable").resizable({
                handles: 'n, e, s, w, ne, se, sw, nw',
                start: function (e, ui) {

                },
                resize: function (e, ui) {

                },
                stop: function (e, ui) {
                    
                }
            });

            $(".draggable").draggable({
                handle: '.content-header',
                helper: 'clone',
                cursor: 'move',
                opacity: 0.5
            });

            $(".trash").droppable({
                accept: '.dragme',
                tolerance: 'pointer',
                greedy: true,
                hoverClass: 'hover',
                drop: function(event, ui) {
                    $(ui.draggable).remove();
                    $("#trash").removeClass("hover");
                    $("#trash").removeClass("empty");
                    $("#trash").addClass("full");
                }
            });

            $("#scrolling_panel").droppable({
                accept: '*',
                tolerance: 'pointer',
                greedy: true,
                hoverClass: 'scrollHover',
                drop: function (event, ui) {
                    var element = $(ui.draggable);
                    var dropZone = $(this);

                    element.detach().appendTo(dropZone);

                    $("#scrolling_panel .theme-options").css("position", "absolute");

                    element.draggable('option', 'containment', 'parent');

                    console.log('Dropped into the scrolling panel');

                    $(element).addClass('dragme');
                    $(element).removeClass('draggable');
                    $(element).addClass('scroll');
                }
            });

            $("#repeating_panel").droppable({
                accept: '*',
                tolerance: 'pointer',
                greedy: true,
                hoverClass: 'scrollHover',
                drop: function (event, ui) {
                    var element = $(ui.draggable);
                    var dropZone = $(this);

                    element.detach().appendTo(dropZone);

                    $("#repeating_panel .theme-options").css("position", "absolute");

                    element.draggable('option', 'containment', 'parent');

                    console.log('Dropped into the repeating panel');

                    $(element).addClass('dragme');
                    $(element).removeClass('draggable');
                    $(element).addClass('scroll');
                }
            });

            $("#twitter_panel").droppable({
                accept: '*',
                tolerance: 'pointer',
                greedy: true,
                hoverClass: 'scrollHover',
                drop: function (event, ui) {
                    var element = $(ui.draggable);
                    var dropZone = $(this);

                    element.detach().appendTo(dropZone);

                    $("#twitter_panel .theme-options").css("position", "absolute");

                    element.draggable('option', 'containment', 'parent');

                    console.log('Dropped into the twitter panel');

                    $(".twitter-help").text('');

                    $(element).addClass('dragme');
                    $(element).removeClass('draggable');
                    $(element).addClass('scroll');
                }
            });

            $(".dragme").draggable({
                handle: '.content-header',
                cursor: 'move',
                helper: 'original',
                drop: function (event, ui) {
                    // remove the helper
                    setTimeout(destroyRemnants, 0);
                },
                stop: function (event, ui) {

                    setTimeout(destroyRemnants, 0);

                    $(".draggable").draggable({
                        handle: '.content-header',
                        helper: 'clone',
                        cursor: 'move',
                        opacity: 0.5,
                        drop: function (event, ui) {
                            setTimeout(destroyRemnants, 0);
                        }
                    });
                }
            });

            $("#template").droppable({
                accept: '.draggable',
                tolerance: 'pointer',
                greedy: false,
                hoverClass: 'ui-state-highlight',
                drop: function(event, ui) {

                    var element = $(ui.draggable).clone();

                    var coord = ui.helper.position();

                    element.css('left', ui.position.left - 356);
                    element.css('top', coord.top);

                    console.log('TOP: ' + coord.top);

                    $(this).append(element);

                    $("#template .theme-options").css("position", "absolute");

                    if (element.prop('id') == 'scrolling_block') {
                        $(".scrolling-help").html('');
                        $("#scrolling_header").html('Scrolling Content');
                        $("#template #scrolling_block").css('position', 'absolute');
                    }

                    if (element.prop('id') == 'repeating_block') {
                        $(".repeating-help").html('');
                        $("#repeating_header").html('Repeating Content');
                    }

                    $(element).addClass('dragme');
                    $(element).removeClass("draggable");

                    $(".resizable").resizable({
                        handles: 'n, e, s, w, ne, se, sw, nw',
                        start: function (e, ui) {

                        },
                        resize: function (e, ui) {

                        },
                        stop: function (e, ui) {
                            if ($(this).prop('id') == 'scrolling_size') {

                                console.log('found it');
                                
                            }
                        } 
                    });

                    //$(".dragme").draggable('disable');

                    $(".dragme").draggable({
                        handle: '.content-header',
                        cursor: 'move',
                        helper: 'original',
                        drop: function(event, ui) {
                            // remove the helper
                            setTimeout(destroyRemnants, 0);

                            var coord = ui.helper.position();

                            console.log("Drag TOp: " + coord.top);
                        },
                        stop: function(event, ui) {

                            setTimeout(destroyRemnants, 0);

                            var coord = ui.helper.position();

                            console.log("Drag TOp: " + coord.top);

                            $(ui.draggable).css('top', coord.top + 'px');

                            $(".draggable").draggable({
                                handle: '.content-header',
                                helper: 'clone',
                                cursor: 'move',
                                opacity: 0.5,
                                drop: function(event, ui) {
                                    setTimeout(destroyRemnants, 0);
                                }
                            });
                        }
                    });

                    $(".resizable").resizable('disable');

                    $(function () {
                        $(".fr-editor").froalaEditor({
                            toolbarInline: true,
                            charCounterCount: false,
                            toolbarButtons: ['fontFamily', 'fontSize', 'bold', 'italic', 'underline', 'strikeThrough', 'color', 'emoticons', '-', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'indent', 'outdent', '-', 'insertImage', 'insertLink', 'insertFile', 'insertVideo', 'undo', 'redo'],
                            fontFamily: {
                                "Arial,sans-serif": 'Arial',
                                "franklin-gothic-urw,sans-serif": 'Franklin Gothic',
                                "Georgia,sans-serif": 'Georgia',
                                "Impact,sans-serif": 'Impact',
                                "Tahoma,sans-serif": 'Tahoma',
                                "Times New Roman,sans-serif": 'Times New Roman',
                                "Verdana,sans-serif": 'Verdana'
                            },
                            fontFamilySelection: true,
                            fontSizeSelection: true,
                            paragraphFormatSelection: true
                        });

                        $(".fr-editor").froalaEditor('destroy');
                    });
                }
            });

            
        });

    </script>

</body>
</html>
