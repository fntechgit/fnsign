﻿<%@ Page Title="FNSIGN > Add Announcement" Language="C#" MasterPageFile="~/fnsign.master" AutoEventWireup="true" CodeBehind="add_message.aspx.cs" Inherits="fnsignManager.add_message" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Specific Page Vendor CSS -->
	<link rel="stylesheet" href="/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
	<link rel="stylesheet" href="/assets/vendor/select2/select2.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-colorpicker/css/bootstrap-colorpicker.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-timepicker/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="/assets/vendor/dropzone/css/basic.css" />
	<link rel="stylesheet" href="/assets/vendor/dropzone/css/dropzone.css" />
	<link rel="stylesheet" href="/assets/vendor/bootstrap-markdown/css/bootstrap-markdown.min.css" />
	<link rel="stylesheet" href="/assets/vendor/summernote/summernote.css" />
	<link rel="stylesheet" href="/assets/vendor/summernote/summernote-bs3.css" />
	<link rel="stylesheet" href="/assets/vendor/codemirror/lib/codemirror.css" />
	<link rel="stylesheet" href="/assets/vendor/codemirror/theme/monokai.css" />
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
                        <li>
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
		                <li class="nav-active">
		                    <a href="/announcements">
		                        <i class="fa fa-bullhorn" aria-hidden="true"></i>
		                        Announcements
		                    </a> 
		                </li>
                        <li>
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
                        <li id="versions_link">
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
						<h2><%= add_edit.ToUpper() %> AN ANNOUNCEMENT</h2>
					
						<div class="right-wrapper pull-right">
							<ol class="breadcrumbs">
								<li>
									<a href="/dashboard">
										<i class="fa fa-tachometer"></i> <span>Dashboard</span>
									</a>
								</li>
                                <li>
                                    <a href="/announcements"><i class="fa fa-bullhorn"></i> Announcements</a>
                                </li>
								<li><i class="fa fa-plus"></i> <span><%= add_edit %> an Announcement</span></li>
							</ol>
					
							<a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
						</div>
					</header>
                    
                    <asp:Panel runat="server" ID="pnl_success" Visible="false">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <strong>Success!</strong> You have successfully performed an <%= add_edit %> operation for this announcement!
                        </div>
                    </asp:Panel>

					<!-- start: page -->
						<div class="row">
							<div class="col-lg-12">
								<section class="panel">
									<header class="panel-heading">
										<div class="panel-actions">
											<a href="#" class="fa fa-caret-down"></a>
											<a href="#" class="fa fa-times"></a>
										</div>
						
										<h2 class="panel-title"><%= add_edit %> an Announcement</h2>
									</header>
									<div class="panel-body">
										<div class="form-horizontal form-bordered">
											<div class="form-group">
												<label class="col-md-3 control-label" for="search_text">Title</label>
												<div class="col-md-6">
												    <asp:TextBox runat="server" ID="title" CssClass="form-control" ClientIDMode="Static" />
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label" for="search_text">Message</label>
												<div class="col-md-6">
												    <asp:TextBox runat="server" ID="message" CssClass="form-control" TextMode="MultiLine" style="height:100px;" ClientIDMode="Static" />
												</div>
											</div>
                                            
                                            <div class="form-group" id="template_group" runat="server">
												<label class="col-md-3 control-label">Template (not required)</label>
												<div class="col-md-6">
												    <asp:DropDownList runat="server" ID="ddl_template" data-plugin-multiselect>
                                                        
                                                    </asp:DropDownList>
												</div>
											</div>
                                            
                                            <div class="form-group" id="terminal_group" runat="server">
												<label class="col-md-3 control-label">Terminal (not required)</label>
												<div class="col-md-6">
												    <asp:DropDownList runat="server" ID="ddl_terminal" data-plugin-multiselect>
                                                        
                                                    </asp:DropDownList>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label">Start</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
													    <asp:TextBox runat="server" ID="start" ClientIDMode="Static" data-plugin-datepicker CssClass="form-control" />
													</div>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label">Start Time</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-clock-o"></i>
														</span>
													    <asp:TextBox runat="server" ID="start_time" data-plugin-timepicker CssClass="form-control" />
													</div>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label">End</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-calendar"></i>
														</span>
													    <asp:TextBox runat="server" ID="end" ClientIDMode="Static" data-plugin-datepicker CssClass="form-control" />
													</div>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label">End Time</label>
												<div class="col-md-6">
													<div class="input-group">
														<span class="input-group-addon">
															<i class="fa fa-clock-o"></i>
														</span>
													    <asp:TextBox runat="server" ID="end_time" data-plugin-timepicker CssClass="form-control" />
													</div>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="control-label col-md-3">Until Deleted</label>
												<div class="col-md-9">
													<div class="switch switch-sm switch-primary">
													    <asp:CheckBox runat="server" ID="active" ClientIDMode="Static" />
													</div>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="control-label col-md-3">Test Announcement (only shows in LIVE PREVIEW)</label>
												<div class="col-md-9">
													<div class="switch switch-sm switch-primary">
													    <asp:CheckBox runat="server" ID="ck_test" ClientIDMode="Static" />
													</div>
												</div>
											</div>
                                            
                                            <div class="form-group">
												<label class="col-md-3 control-label">Image</label>
												<div class="col-md-6">
													<div class="fileupload fileupload-new" data-provides="fileupload">
														<asp:FileUpload runat="server" ID="image" ClientIDMode="Static" />
													</div>
												</div>
											</div>
                                            
                                            <asp:Panel runat="server" ID="pnl_current_image" Visible="false">
                                                <div class="form-group">
												<label class="control-label col-md-3"></label>
												<div class="col-md-9">
													<asp:Image runat="server" ID="current_image"/>
												</div>
											</div>
                                            </asp:Panel>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">
                                                    Priority
                                                </label>
                                                <div class="col-md-9">
													<div class="switch switch-sm switch-primary">
													    <asp:CheckBox runat="server" ID="ck_priority" ClientIDMode="Static" />
													</div>
												</div>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">
                                                    Session Full
                                                </label>
                                                <div class="col-md-9">
													<div class="switch switch-sm switch-primary">
													    <asp:CheckBox runat="server" ID="ck_full" ClientIDMode="Static" />
													</div>
												</div>
                                            </div>
                                            
                                            <div class="form-group">
												<label class="control-label col-md-3"></label>
												<div class="col-md-9">
													<asp:Button runat="server" ID="btn_process" CssClass="mb-xs mt-xs mr-xs btn btn-primary" Text="Submit" OnClick="update" />
												</div>
											</div>
                                            
                                            

										</div>
									</div>
								</section>
							</div>
						</div>
					<!-- end: page -->
				</section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="footer_scripts" runat="server">
    
    <!-- Specific Page Vendor -->
	<script src="/assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
	<script src="/assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
	<script src="/assets/vendor/select2/select2.js"></script>
	<script src="/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
	<script src="/assets/vendor/jquery-maskedinput/jquery.maskedinput.js"></script>
	<script src="/assets/vendor/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
	<script src="/assets/vendor/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script src="/assets/vendor/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
	<script src="/assets/vendor/fuelux/js/spinner.js"></script>
	<script src="/assets/vendor/dropzone/dropzone.js"></script>
	<script src="/assets/vendor/bootstrap-markdown/js/markdown.js"></script>
	<script src="/assets/vendor/bootstrap-markdown/js/to-markdown.js"></script>
	<script src="/assets/vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script src="/assets/vendor/codemirror/lib/codemirror.js"></script>
	<script src="/assets/vendor/codemirror/addon/selection/active-line.js"></script>
	<script src="/assets/vendor/codemirror/addon/edit/matchbrackets.js"></script>
	<script src="/assets/vendor/codemirror/mode/javascript/javascript.js"></script>
	<script src="/assets/vendor/codemirror/mode/xml/xml.js"></script>
	<script src="/assets/vendor/codemirror/mode/htmlmixed/htmlmixed.js"></script>
	<script src="/assets/vendor/codemirror/mode/css/css.js"></script>
	<script src="/assets/vendor/summernote/summernote.js"></script>
	<script src="/assets/vendor/bootstrap-maxlength/bootstrap-maxlength.js"></script>
	<script src="/assets/vendor/ios7-switch/ios7-switch.js"></script>
    
    <script src="/assets/javascripts/forms/examples.advanced.form.js" /></script>

</asp:Content>