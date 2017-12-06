<%@ Page Title="FNSIGN > Version History" Language="C#" MasterPageFile="~/fnsign.master" AutoEventWireup="true" CodeBehind="versions.aspx.cs" Inherits="fnsignManager.versions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="navigation_sidebar" runat="server">
    <!-- start: sidebar goes into the  -->
	<aside id="sidebar-left" class="sidebar-left">
				
		<div class="sidebar-header">
		    <div class="sidebar-title">
		        Navigation
		    </div>
		    <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
		        <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
		    </div>
		</div>
				
		<div class="nano">
		    <div class="nano-content">
		        <nav id="menu" class="nav-main" role="navigation">
		            <ul class="nav nav-main">
		                <li>
		                    <a href="/">
		                        <i class="fa fa-tachometer" aria-hidden="true"></i>
		                        <span>Dashboard</span>
		                    </a>
		                </li>
                        <li class="nav-parent">
                            <a href="/templates">
                                <i class="fa fa-edit" aria-hidden="true"></i>
                                <span>Templates</span>
                            </a>
                        </li>
		                <li>
                            <a href="/overlays">
                                <i class="fa fa-camera" aria-hidden="true"></i>
                                <span>Overlays</span>
                            </a>
                        </li>
                        <li>
		                    <a href="/announcements">
		                        <i class="fa fa-bullhorn" aria-hidden="true"></i>
		                        Announcements
		                    </a> 
		                </li>
                        <li class="nav-parent">
                            <a href="/sessions">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <span>Sessions</span>
                            </a>
                        </li>
                        <li id="preference_link" runat="server" Visible="false">
		                    <a href="/locations">
		                        <i class="fa fa-map-marker" aria-hidden="true"></i>
		                        <span>Locations</span>
		                    </a>
		                </li>
                        <li id="display_link" runat="server" Visible="false">
		                    <a href="/assignments">
		                        <i class="fa fa-desktop" aria-hidden="true"></i>
		                        <span>Assignments</span>
		                    </a>
		                </li>
                        <li id="event_link" runat="server" Visible="false">
		                    <a href="/events">
		                        <i class="fa fa-calendar" aria-hidden="true"></i>
		                        <span>Events</span>
		                    </a>
		                </li>
                        <li id="user_link" runat="server" Visible="false">
		                    <a href="/users">
		                        <i class="fa fa-users" aria-hidden="true"></i>
		                        <span>Users</span>
		                    </a>
		                </li>
                        <li id="versions_link" class="nav-active">
		                    <a href="/versions">
		                        <i class="fa fa-code-fork" aria-hidden="true"></i>
		                        <span>Version History</span>
		                    </a>
		                </li>
		            </ul>
		        </nav>
		    </div>
				
		</div>
				
	</aside>
	<!-- end: sidebar -->
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="content_main" runat="server">
     <section role="main" class="content-body">
		<header class="page-header">
			<h2>FNSIGN Version History</h2>
					
			<div class="right-wrapper pull-right">
				<ol class="breadcrumbs">
					<li>
						<a href="/dashboard">
							<i class="fa fa-tachometer"></i>
						</a>
					</li>
					<li><i class="fa fa-code-fork"></i> <span>Version History</span></li>
				</ol>
					
				<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
			</div>
		</header>

		<!-- start: page -->
         
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.2.0.4 - 4.10.17 - SVN REVISION 96</h2>
                </header>
                <div class="panel-body">
                    <h2><strong>Feature:</strong> Full Session Graphic</h2>
                    
                    <p><strong>Description: </strong>The Full Session Graphic and Session Management is now much easier to manage.  You can update the Full Session Graphic in a single location for the entire event and then make a session full with a single click.</p>
                    
                    <h4>Files Affected:</h4>
                    
                    <ul>
                        <li>fnsign\fnsignDisplay\display.asmx</li>
                        <li>fnsign\fnsignManager\add_event.aspx</li>
                        <li>fnsign\fnsignManager\add_event.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\add_event.aspx.cs</li>
                        <li>fnsign\fnsignManager\add_message.aspx</li>
                        <li>fnsign\fnsignManager\add_message.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\add_message.aspx.cs</li>
                        <li>fnsign\fnsignManager\fnsign.master</li>
                        <li>fnsign\fnsignManager\global.asax.cs</li>
                        <li>fnsign\fnsignManager\js\daily.js</li>
                        <li>fnsign\fnsignManager\js\preview.js</li>
                        <li>fnsign\schedInterface\overlays.cs</li>
                        <li>fnsign\fnsignManager\messages.aspx</li>
                        <li>fnsign\fnsignManager\messages.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\messages.aspx.cs</li>
                        <li>fnsign\services\preview.asmx</li>
                        <li>fnsign\fnsignManager\sessions.aspx</li>
                        <li>fnsign\fnsignManager\sessions.aspx.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.cs</li>
                        <li>fnsign\fnsignManager\versions.aspx</li>
                        <li>fnsign\schedInterface\events.cs</li>
                        <li>fnsign\schedInterface\messages.cs</li>
                        <li>fnsign\schedInterface\sched.dbml.layout</li>
                        <li>fnsign\schedInterface\sched.designer.cs</li>
                        <li>fnsign\fnsignManager\toggle_session_full.aspx</li>
                        <li>fnsign\fnsignManager\toggle_session_full.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\toggle_session_full.aspx.cs</li>
                    </ul>
                    
                    <h4>Options:</h4>
                    
                    <ul>
                        <li>Full Session Graphic is uploaded on the Edit Event Page</li>
                        <li>Sessions Screen click the Battery icon to Toggle a Full Session off or on</li>
                    </ul>
                    
                    <h4>Demo</h4>
                    
                    <video id="clone_overlay_demo" width="100%" controls>
                        <source src="https://d3vv6lp55qjaqc.cloudfront.net/items/2J0p02402S0u3n1b392P/session_full.m4v?X-CloudApp-Visitor-Id=324636" type="video/mp4" />
                    </video>
                    
                    <hr/>
                </div>
            </section>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.2.0.4 - 4.7.17 - SVN REVISION 96</h2>
                </header>
                <div class="panel-body">
                    <h2><strong>Feature:</strong> openstackAPI Review & Upgrades</h2>
                    
                    <p><strong>Description: </strong>The openstackAPI was reviewed and upgraded following the actual API being upgraded by OpenStack staff.  The data format was greatly changed and required major refactoring.</p>
                    
                    <h4>Demo</h4>
                    
                    <video id="clone_overlay_demo" width="100%" controls>
                        <source src="https://d3vv6lp55qjaqc.cloudfront.net/items/3Y3r2u2J353G3m1i0c38/fnsign_openstackAPI.m4v?X-CloudApp-Visitor-Id=324636" type="video/mp4" />
                    </video>
                    
                    <hr/>
                </div>
            </section>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.2.0.3 - 4.6.17 - SVN REVISION 95</h2>
                </header>
                <div class="panel-body">
                    <h2><strong>Feature:</strong> Bottom Overlay</h2>
                    
                    <p><strong>Description: </strong>The “Bottom Overlay” feature allows you to take a cut of the template background FOOTER and upload it.  FNSIGN will then take that file that you uploaded and create a layer that hovers above all the content on the page to ensure that scrolling content has a hard stop to scroll underneath.</p>
                    
                    <h4>Files Affected:</h4>
                    
                    <ul>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_step1.aspx.cs</li>
                        <li>fnsign\fnsignManager\versions.aspx</li>
                        <li>fnsign\schedInterface\overlays.cs</li>
                        <li>fnsign\schedInterface\sched.dbml</li>
                        <li>fnsign\schedInterface\sched.dbml.layout</li>
                        <li>fnsign\schedInterface\sched.designer.cs</li>
                        <li></li>
                    </ul>
                    
                    <h4>Options:</h4>
                    
                    <ul>
                        <li>Bottom Overlay Image: the image that you upload which has been cut from your main template file.  This is always 1080 pixels wide (assuming your template is 1080 px wide) and you just need to know the height</li>
                        <li>Bottom Overlay Height: you simply need to know the height of the footer image which you can see in the demo video below how to find that value</li>
                    </ul>
                    
                    <h4>Demo</h4>
                    
                    <video id="clone_overlay_demo" width="100%" controls>
                        <source src="https://d3vv6lp55qjaqc.cloudfront.net/items/0s1D3b1a3m2S2n223Y3g/fnsign_bottom_overlay.m4v?X-CloudApp-Visitor-Id=324636" type="video/mp4" />
                    </video>
                    
                    <hr/>
                </div>
            </section>
            
            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.2.0.2 - 4.6.17 - SVN REVISION 94</h2>
                </header>
                <div class="panel-body">
                    <h2><strong>Feature:</strong> Group by Location</h2>
                    
                    <p><strong>Description: </strong>The “Group by Location” Feature allows you to sort Sessions by Location and also only show the Location name when it changes to make for a more clean appearance.  This would be used for a registration template or for a group of rooms.</p>
                    
                    <h4>Files Affected:</h4>
                    
                    <ul>
                        <li>fnsign\fnsignManager\edit_assignment.aspx</li>
                        <li>fnsign\fnsignManager\edit_assignment.aspx.cs</li>
                        <li>fnsign\fnsignManager\edit_assignment.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview_select_options.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview_select_options.aspx.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview_select_options.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_step1.aspx.cs</li>
                        <li>fnsign\fnsignManager\versions.aspx</li>
                        <li>fnsign\schedInterface\overlays.cs</li>
                        <li>fnsign\schedInterface\terminals.cs</li>
                    </ul>
                    
                    <h4>Variations:</h4>
                    
                    <ul>
                        <li>you can test this function using LIVE PREVIEW and the Overlay will store your option for repeated testing</li>
                        <li>once you create a terminal you need to set the Group by Location at the Terminal level as well</li>
                    </ul>
                    
                    <h4>Demo</h4>
                    
                    <video id="clone_overlay_demo" width="100%" controls>
                        <source src="https://d3vv6lp55qjaqc.cloudfront.net/items/1y1R3s0Q0T1m3u0e2g06/fnsign_group_by_location.m4v?X-CloudApp-Visitor-Id=324636" type="video/mp4" />
                    </video>
                    
                    <hr/>
                </div>
            </section>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.2.0.1 - 4.5.17 - SVN REVISION 93</h2>
                </header>
                <div class="panel-body">
                    <h2><strong>Feature:</strong> Group by Start Time</h2>
                    
                    <p><strong>Description: </strong>The “Group by Start Time” feature allows you to turn ON or OFF grouping by time which means that the “START TIME” will only show when the time is different.  So if there are multiple sessions with the same start time the start time will only appear for the first.  </p>
                    
                    <h4>Files Affected:</h4>
                    
                    <ul>
                        <li>fnsign\fnsignManager\edit_assignment.aspx</li>
                        <li>fnsign\fnsignManager\edit_assignment.aspx.cs</li>
                        <li>fnsign\fnsignManager\edit_assignment.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview_select_options.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview_select_options.aspx.cs</li>
                        <li>fnsign\fnsignManager\template_builder_live_preview_select_options.aspx.designer.cs</li>
                        <li>fnsign\fnsignManager\template_builder_step1.aspx.cs</li>
                        <li>fnsign\fnsignManager\versions.aspx</li>
                        <li>fnsign\schedInterface\overlays.cs</li>
                        <li>fnsign\schedInterface\terminals.cs</li>
                    </ul>
                    
                    <h4>Notes:</h4>
                    
                    <ul>
                        <li>this option should only work on either the registration template where “All Sessions” are selected or if multiple rooms are grouped into one terminal.  The reason is that otherwise the time will always change between sessions because only one session can happen in one location at one time.</li>
                    </ul>
                    
                    <h4>Demo</h4>
                    
                    <video id="clone_overlay_demo" width="100%" controls>
                        <source src="https://d3vv6lp55qjaqc.cloudfront.net/items/3F3B2m3K0I001l1k3d2N/fnsign_group_by_start.m4v?X-CloudApp-Visitor-Id=324636" type="video/mp4" />
                    </video>
                    
                    <hr/>
                </div>
            </section>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.2.0.0 - 4.4.17 - SVN REVISION 92</h2>
                </header>
                <div class="panel-body">
                    <h2><strong>Feature:</strong> Clone Overlay</h2>
                    
                    <p><strong>Description: </strong>Clone Overlay is used to take the content from one Overlay and move it to another overlay so the two can be edited independent of each other.  </p>
                    
                    <h4>Files Affected:</h4>
                    
                    <ul>
                        <li>fnsign\fnsignManager\overlays.aspx</li>
                        <li>fnsign\fnsignManager\overlays.aspx.cs</li>
                        <li>fnsign\fnsignManager\clone_overlay.aspx</li>
                        <li>fnsign\fnsignManager\clone_overlay.aspx.cs</li>
                        <li>fnsign\fnsignManager\clone_overlay.aspx.designer.cs</li>
                    </ul>
                    
                    <h4>Variations:</h4>
                    
                    <ul>
                        <li>you can either select the Clone icon from a row within the Overlays grid which saves you having to select the Overlay you want to clone on the “Clone Overlay” screen or you can jump right to the “clone overlay” screen and select it from a list. </li>
                        <li>* you can either upload a new guide document to use with the overlay or you can use the one from the cloned overlay</li>
                    </ul>
                    
                    <h4>Demo</h4>
                    
                    <video id="clone_overlay_demo" width="100%" controls>
                        <source src="https://d3vv6lp55qjaqc.cloudfront.net/items/1e3r3t3M1a1t422C0r35/FNSIGN_clone_overlay.m4v?X-CloudApp-Visitor-Id=324636" type="video/mp4" />
                    </video>
                    
                    <hr/>
                </div>
            </section>

            <section class="panel">
                <header class="panel-heading">
                    <div class="panel-actions">
                        <a href="#" class="fa fa-caret-down"></a>
                        <a href="#" class="fa fa-times"></a>
                    </div>
                    
                    <h2 class="panel-title">Version 6.1.0.5 - 3.29.17 - SVN REVISION 88-90</h2>
                </header>
                <div class="panel-body">
                    <h2>Bug Fix: Overlay Builder - SVN REVISION 90 (checked in by Justin Tabb)</h2>
                    
                    <p><strong>Bug Fix Description: </strong>code was updated to ensure the absolute positioning is being correctly interpreted by the overlay builder and passed through to the database for storage and proper rendering in LIVE PREVIEW or FNDISPLAY.</p>
                    
                    <h4>Files Affected:</h4>
                    
                    <ul>
                        <li>fnsign\fnsignManager\template_builder_live_preview.aspx</li>
                        <li>fnsign\fnsignManager\template_builder_step2.aspx</li>
                    </ul>
                    
                    <h4>Technical Description:</h4>
                    
                    <p>The absolute and relative positioning were being interpreted differently in the overlay builder vs the live preview and fndisplay tools so I made Javascript changes to mathematically calculate the proper ratios and proportions and tested them thoroughly against the scrolling and repeating panel functions.</p>
                    
                    <hr/>

                    <h2>Feature: Scroll Speed</h2>
                    
                    <p><strong>Description: </strong>Scrolling speed within the overlay is controlled on the LIVE PREVIEW OPTIONS screen.</p>
                    
                    <h4>Variations:</h4>
                    
                    <ul>
                        <li>Auto-Calculate based on Height (DEFAULT)</li>
                        <li>Ranging Between 1-60 Seconds you can select the manual option</li>
                    </ul>
                    
                    <hr/>
                </div>
            </section>

			<section class="panel">

				<header class="panel-heading">
					<div class="panel-actions">
						<a href="#" class="fa fa-caret-down"></a>
						<a href="#" class="fa fa-times"></a>
					</div>
						
					<h2 class="panel-title">Version 6.1.0.4 - 3.27.17</h2>
				</header>
				<div class="panel-body">
					<h2>Feature: Timewarp</h2>
                    
                    <p><strong>Description: </strong>TimeWarp is used to tell the system what date to use to find and display sessions within the event.  It is set at the Event level so the system can run individual times on separate events all at the same time.</p>
                    
                    <h4>Variations</h4>
                    
                    <ul>
                        <li>"Use Real Time” - DEFAULT (this functions as you would expect, the server date is now set as GMT and each event has a timezone set and the system calculates the correct “Real Time” based off of time.windows.com and the adjustment of the timezone)</li>
                        <li>“Timewarp Fixed” (with this feature you set a date and time and it does not adjust, it simply stays as if fixed in time, this can be good for doing a quick check of a certain session time)</li>
                        <li>“Timewarp Real” (with this feature you set a starting date and time and the system moves that date and time forward as it would in real time, so you can set the start date as the beginning of the event and watch as the system cycles through the time period of the event and see each session time block cycle through)</li>
                    </ul>
                    
                    <h4>Other Options</h4>
                    
                    <ul>
                        <li>Display System - with this option you can use Timewarp ONLY on the Display system </li>
                        <li>FNSIGN System - with this option you can use Timewarp ONLY on the Manager system so you could test options while the Display system runs in Real Time Mode during an event</li>
                    </ul>
                    
                    <h4>Technical Details</h4>
                    
                    <ul>
                        <li>FNSIGN Timewarp Service - this Windows Service is set to automatically start and runs constantly on the FNSIGN Server (172.16.1.75), the service polls the database every second and checks for events that are set to use the timewarp feature with the “Timewarp Real” function set and iterates the time forward mimicking real time but using the “Start Time” set in the Timewarp field (Screenshot below)</li>
                    </ul>
                    
                    <img src="http://ovri.de/290i091M3x2V/download/Screen%20Shot%202017-03-23%20at%2011.40.43%20PM.png" style="width: 90%;" alt="FNSIGN Timewarp Service" />

				    <hr/>
                    
                    <h2>Feature: End of Day Messaging</h2>
                    
                    <p><strong>Description: </strong>End of Day Messaging is used to set the information that displays in the “Static Current Session” field on the FNSIGN Display.  </p>
                    
                    <h4>Options:</h4>
                    
                    <ul>
                        <li><strong>Title</strong> - this replaces the “Session Title” field </li>
                        <li><strong>Category</strong> - this replaces the “Location” field</li>
                        <li><strong>Time</strong> - this will replace the “Session Time” field</li>
                        <li><strong>Description</strong> - if used by the template (which it usually isn’t) this will replace the “Session Description field.</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature: No Session Messaging</h2> 

                    <p><strong>Description:</strong>	Similar to “End of Day Messaging” this feature allows you to set what information displays “BETWEEN” sessions when there is nothing available.</p>

                    <h4>Options:</h4>
                    
                    <ul>
                        <li><strong>Title</strong> - this replaces the “Session Title” field </li>
                        <li><strong>Category</strong> - this replaces the “Location” field</li>
                        <li><strong>Time</strong> - this will replace the “Session Time” field</li>
                        <li><strong>Description</strong> - if used by the template (which it usually isn’t) this will replace the “Session Description field.</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		SCHED Importer</h2>

                    <p><strong>Description:</strong>	The SCHED Importer is a Windows Application that runs on a schedule and connects to both SCHED and FNSIGN and pulls the appropriate information from SCHED and brings it into FNSIGN.</p>

                    <h4>Options:</h4>

                    <ul>
                        <li>Event URL: this is the URL that SCHED gives you for participants to interact with SCHED, it is entered on the Event Add / Edit Screen in FNSIGN</li>
                        <li>API Key: this is provided to you from SCHED in the admin interface and is entered on the Event Add / Edit Screen in FNSIGN</li>
                    </ul>

                    <h4>Technical Details:</h4>

                    <ul>
                        <li>at this point TECHNICAL options are all managed through code, we have a line item in the “Self Sustained” list to bring these options into the interface so they are easily managed</li>
                        <li>run from the FNSIGN Web Server (172.16.1.75) and the schedule is managed from the Task Scheduler in Windows Server (Screenshot below)</li>
                    </ul>
                    
                    <img src="http://ovri.de/1z0O1k1h2Z0a/download/Screen%20Shot%202017-03-24%20at%2012.11.01%20PM.png" alt="FNSIGN Sched Updater" style="width: 90%;" />

                    <hr/>
                    
                    <h2>Feature:		Announcement System</h2>

                    <p><strong>Description:</strong>	The Announcement System is used to schedule and push announcements to displays</p>

                    <h4>Variations:</h4>

                    <ul>
                        <li><strong>Terminal</strong> (using this function you can push an announcement to a specific display for instance Ballroom A ONLY will receive the announcement)</li>
                        <li><strong>Template</strong> (using this function you can push an announcement to a GROUP of monitors.  So you can select Template Floor 2 and it will go to all the monitors on Floor 2 but none of the other monitors)</li>
                        <li><strong>Event</strong> (using this function you can push announcements to ALL monitors)</li>
                    </ul>

                    <h4>Options:</h4>

                    <ul>
                        <li>the default is to use the Ticker / Scrolling Announcement at the bottom of the screen (or wherever you place it)</li>
                        <li>Priority: Priority announcements replace the “Twitter” text</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		Session & Location Data</h2>

                    <p><strong>Description:</strong>	Session & Location Data can be added / managed through the system in several different ways and the data controls what is on the screens at any given date / time.</p>

                    <h4>Variations:</h4>

                    <ul>
                        <li><strong>Manual Add / Edit / Delete</strong> - you can manually enter, modify and delete session data using FNSIGN; however, if you are also using an automated importer like SCHED or OpenStack and you try to change any of the data that comes from that system the changes you make will be overwritten</li>
                        <li><strong>Import</strong> - using the CSV template provided on the Import page you can Append or Overwrite your entire import file</li>
                        <li><strong>SCHED API</strong> - using the SCHED API system the autoupdater will maintain a sync between SCHED and FNSIGN</li>
                        <li><strong>oculusAPI</strong> - using the Oculus API this system will update your data from the oculusAPI </li>
                        <li><strong>openstackAPI</strong> - this system will sync with the openstackAPI (note this system has not been updated since Austin and the API has so this will need work prior to Boston)</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		Terminal Assignments</h2>

                    <p><strong>Description:</strong>	This feature takes the Terminals that are created using the FNDISPLAY system and assigns them to a Template so the system knows how to render the content for that location.</p>

                    <h4>Options:</h4>

                    <ul>
                        <li><strong>All Sessions</strong> - if this option is selected instead of displaying the Sessions that are only in that location it will display ALL Sessions for that day.  This would commonly be used for the Registration Screens in the Lobby.</li>
                        <li><strong>Template</strong> - select the Template that you want to use to display the data </li>
                        <li><strong>Slide Deck</strong> - if you select a Deck then the Deck will take over and rotate through the screen</li>
                        <li><strong>Rotate Interval</strong> - this tells the Deck how often to rotate</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		Templates</h2>

                    <p><strong>Description:</strong>	The Template system allows you to take an overlay that you have designed and give it a background and other details.  This is useful when the same layout is used for the entire event but each floor has a different background color / design.</p>

                    <h4>Options:</h4>
                    
                    <ul>
                        <li><strong>Background Image or Video</strong> - must be the same size as the display, usually 1080 x 1920 - 72 dpi </li>
                        <li><strong>Overlay Pattern</strong> - select the overlay layout design</li>
                        <li><strong>Twitter Username</strong> - if you want to have a different twitter username than what the event uses this is where you define it</li>
                        <li><strong>Twitter Hashtag</strong> - if you want to use different hashtags than what is used at the event level this is where you define it</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		Overlays</h2>

                    <p><strong>Description:</strong>	The overlay feature allows you to create / edit / remove overlays that create the layout to be used for the event.  </p>

                    <h4>Options:</h4>

                    <ul>
                        <li><strong>Title</strong> (name your overlay)</li>
                        <li><strong>Width</strong> (select the width)</li>
                        <li><strong>Height</strong> (select the height)</li>
                        <li><strong>Guide Background</strong> (this is the background document you will be using to build the overlay but NOT the final background image, that is defined at the Template level; however, the background document will be used during the Live Preview)</li>
                        <li><strong>Move</strong> - this allows you to MOVE options that you drag onto the overlay</li>
                        <li><strong>Resize</strong> - this allows you to resize the options that you drag onto the overlay</li>
                        <li><strong>Edit</strong> - this allows you to Edit the content including Font, Font Color, background color, font weight and options, alignment, images, videos etc.  It is important that you do NOT delete the outer brackets when making any of these changes anything between { and } can be remove or changed</li>
                        <li><strong>Save</strong> - this button saves the overlay, if you leave the screen before clicking this button you will lose all of your work</li>
                    </ul>

                    <h4>Elements:</h4>

                    <ul>
                        <li><strong>Session Title</strong></li>
                        <li><strong>Session Location</strong></li>
                        <li><strong>Start Time</strong></li>
                        <li><strong>Start Date</strong></li>
                        <li><strong>End Time</strong></li>
                        <li><strong>Session Description</strong></li> 
                        <li><strong>Speaker Name</strong> (not always available from data stream)</li> 
                        <li><strong>Speaker Company</strong> (not always available from data stream)</li> 
                        <li><strong>Speaker Twitter</strong> (not always available from data stream)</li> 
                        <li><strong>Speaker Email</strong> (not always available from data stream)</li> 
                        <li><strong>Server Time</strong> (pulls server time adjusted by the Timezone that is setup in Timewarp)</li> 
                        <li><strong>Chromebox Time</strong> (pulls the local Chromebox time)</li> 
                        <li><strong>Ticker / Announcement Scroller</strong></li>
                        <li><strong>LOGO / Image</strong> - allows you to add a custom image onto the overlay</li> 
                        <li><strong>Repeating Block</strong> - anything inside of this block repeats</li> 
                        <li><strong>Scrolling Block</strong>   - scrolls any content inside of the block</li> 
                        <li><strong>Split View 1</strong></li>
                        <li><strong>Split View 2</strong></li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		Live Preview</h2>

                    <p><strong>Description:</strong>	The Live Preview feature allows you to set a location and event and see what your overlay would look like.</p>

                    <h4>Options:</h4>

                    <ul>
                        <li><strong>Event</strong> (select the event you want to preview)</li>
                        <li><strong>Location</strong> (select the location within the event to preview data for)</li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		User Management</h2>

                    <p><strong>Description:</strong>	Manage Users / add / edit / delete and setup Permissions and Notification Settings</p>

                    <h4>Options:</h4>

                    <ul>
                        <li><strong>First Name</strong></li>
                        <li><strong>Last Name</strong></li>
                        <li><strong>Master Security Level</strong></li>
                        <li><strong>Company</strong></li>
                        <li><strong>Email</strong></li>
                        <li><strong>Password</strong></li>
                        <li><strong>Active</strong></li>
                        <li><strong>Carrier</strong> (select the mobile carrier)</li>
                        <li><strong>Mobile Number</strong></li>
                        <li><strong>SMS</strong> (do you want the notifications in SMS or MMS)</li>
                        <li><strong>MMS</strong></li>
                        <li><strong>Avatar</strong> (picture for your account)</li>
                    </ul>

                    <h4>Permissions:</h4>

                    <p>Allows you to set permissions on an event by event basis</p>

                    <ul>
                        <li>Event - select the event</li>
                        <li>Content Level - select the content level </li>
                    </ul>
                    
                    <hr/>
                    
                    <h2>Feature:		Downtime Notifications</h2>

                    <p><strong>Description:</strong>	This feature checks for displays that are down in between the event start and event end dates / times and notifies the users you have selected using SMS / MMS so the issue can be resolved.</p>

                    <h2>Options:</h2>
                    
                    <ul>
                        <li>Select User and Add to Monitor</li>
                        <li>All Other Options are managed through code and server administration but are on the “Self Sufficient list” to be added to the FNSIGN interface </li>
                    </ul>

                    <h2>Technical Details:</h2>
                    
                    <ul>
                        <li>FNSIGN Notifications Updater runs from the FNSIGN Web Server (172.16.1.75)</li>
                        <li>Runs on a schedule using the Task Scheduler System within Windows Server (screenshot attached)</li>
                    </ul>
                    
                    <img src="http://ovri.de/0O0S360r0A2F/download/Screen%20Shot%202017-03-24%20at%2012.10.54%20PM.png" alt="FNSIGN Notifications" style="width: 90%;"/>
                    
                    <hr/>
                    
                    <h2>Feature:		oculusAPI Updater</h2>

                    <p><strong>Description:</strong>	This application connects to the oculusAPI and pulls data from the updater.  The last time it was touched was for OC3 in 2016 and will require review and updates with the updates they have made to their API before OC4.</p>

                    <h4>Options:</h4>
                    
                    <ul>
                        <li>all options are managed through code but are on the “Self Sufficient List” to be added to the FNSIGN Interface </li>
                    </ul>

                    <h4>Technical Details:</h4>
                    
                    <ul>
                        <li>the oculusAPI updater runs from the FNSIGN Web Server (172.16.1.75)</li>
                        <li>runs using the Task Scheduler (screenshot attached)</li>
                    </ul>
                    
                    <img src="http://ovri.de/34391A0D2E0m/download/Screen%20Shot%202017-03-24%20at%201.42.06%20PM.png" alt="oculusAPI" style="width: 90%;"/>
                    
                    <hr/>
                    
                    <h2>Feature:		openstackAPI </h2>

                    <p><strong>Description:</strong>	The openstackAPI updater connects to the openstackAPI using OAuth 2.0 and pulls ALL summits and converts them to FNSIGN data.  Note this was last updated before Austin and will require updates before Boston as their API has been revamped.</p>

                    <h4>Options:</h4>
                    
                     <ul>
                        <li>all options are managed through code but are on the “Self Sufficient List” to be added to the FNSIGN Interface </li>
                    </ul>

                    <h4>Technical Details:</h4>
                    
                    <ul>
                        <li>openstackAPI updater runs from the FNSIGN Web Server (172.16.1.75)</li>
                        <li>runs using the Task Scheduler (screenshot attached)</li>
                    </ul>
                    
                    <img src="http://ovri.de/2n0u010R2s31/download/Screen%20Shot%202017-03-24%20at%201.46.15%20PM.png" alt="openstackAPI Updater" style="width: 90%;"/>
                    
                    <hr/>
				</div>
			</section>
		<!-- end: page -->
	</section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footer_scripts" runat="server">
</asp:Content>
