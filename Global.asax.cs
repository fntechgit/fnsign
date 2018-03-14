using System;
using System.Web.Routing;

namespace fnsignManager
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // this is the routing engine
            RegisterRoutes(RouteTable.Routes);
        }

        void RegisterRoutes(RouteCollection routes)
        {
            // ######################## LOGIN SECTION ################################### //
            routes.MapPageRoute("login-route", "login", "~/login.aspx");
            routes.MapPageRoute("no-events-route", "login/{noevents}", "~/login.aspx");
            routes.MapPageRoute("logout-route", "logout", "~/logout.aspx");
            routes.MapPageRoute("forgot-password", "forgot-password", "~/forgot.aspx");

            // ######################## DASHBOARD SECTION ################################### //
            routes.MapPageRoute("dashboard-route", "dashboard", "~/dashboard.aspx");

            // ########################## USERS SECTION ################################# //
            routes.MapPageRoute("users-route", "users", "~/users.aspx");
            routes.MapPageRoute("users-add-route", "users/add", "~/add_user.aspx");
            routes.MapPageRoute("users-edit-route", "users/edit/{id}", "~/add_user.aspx");
            routes.MapPageRoute("users-delete-route", "users/delete/{id}", "~/delete_user.aspx");

            // ######################## PERMISSIONS SECTION ################################### //
            routes.MapPageRoute("permissions-by-user-route", "permissions/{id}", "~/permissions.aspx");
            routes.MapPageRoute("permissions-add-route", "permissions/add/{id}", "~/add_permission.aspx");
            routes.MapPageRoute("permissions-edit-route", "permissions/edit/{id}/{permission_id}", "~/add_permission.aspx");
            routes.MapPageRoute("permissions-delete-route", "permissions/delete/{user_id}/{id}", "~/delete_permission.aspx");

            // ######################## EVENTS SECTION ################################### //
            routes.MapPageRoute("events-manage-route", "events", "~/events.aspx");
            routes.MapPageRoute("events-add-route", "events/add", "~/add_event.aspx");
            routes.MapPageRoute("events-edit-rotue", "events/edit/{id}", "~/add_event.aspx");
            routes.MapPageRoute("events-delete-route", "events/delete/{id}", "~/delete_event.aspx");
            routes.MapPageRoute("events-managers-route", "events/{id}/monitors", "~/event_monitors.aspx");

            routes.MapPageRoute("event-types-manage-route", "eventtypes", "~/event_types.aspx");
            routes.MapPageRoute("event-types-add-route", "eventtypes/add", "~/add_event_type.aspx");
            routes.MapPageRoute("event-types-edit-route", "eventtypes/edit/{id}", "~/add_event_type.aspx");
            routes.MapPageRoute("event-types-delete-route", "eventtypes/remove/{id}", "~/delete_event_type.aspx");
            routes.MapPageRoute("event-types-import-route", "eventtypes/import", "~/event_types_import.aspx");

            // ####################### SESSIONS SECTION ########################### //
            routes.MapPageRoute("sessions-route", "sessions", "~/sessions.aspx");
            routes.MapPageRoute("sessions-add-route", "sessions/add", "~/add_session.aspx");
            routes.MapPageRoute("sessions-edit-route", "sessions/edit/{id}", "~/add_session.aspx");
            routes.MapPageRoute("sessions-delete-route", "sessions/remove/{id}", "~/session_delete.aspx");
            routes.MapPageRoute("sessions-import-route", "sessions/import", "~/sessions_import.aspx");
            routes.MapPageRoute("sessions-toggle-full-route", "sessions/toggle-full/{id}", "~/toggle_session_full.aspx");

            // ####################### LOCATIONS ROUTE ##########################//
            routes.MapPageRoute("locations-route", "locations", "~/locations.aspx");
            routes.MapPageRoute("locations-add-route", "locations/add", "~/add_location.aspx");
            routes.MapPageRoute("locations-edit-route", "locations/edit/{id}", "~/add_location.aspx");
            routes.MapPageRoute("locations-delete-route", "locations/delete/{id}", "~/delete_location.aspx");
            routes.MapPageRoute("sublocations-route", "sublocations/{id}", "~/sublocations.aspx");
            routes.MapPageRoute("sublocations-delete-route", "sublocations/delete/{id}", "~/sublocations_delete.aspx");

            // #######################  ASSIGNMENTS ############################## //
            routes.MapPageRoute("assignments-route", "assignments", "~/assignments.aspx");
            routes.MapPageRoute("assignments-edit-route", "assignments/edit/{id}", "~/edit_assignment.aspx");
            routes.MapPageRoute("assignments-delete-route", "assignments/delete/{id}", "~/delete_assignment.aspx");

            // ####################### TEMPLATES ROUTE ############################ //
            routes.MapPageRoute("templates-add-route", "templates/add", "~/template_add.aspx");
            routes.MapPageRoute("templates-update-route", "templates/edit/{id}", "~/template_add.aspx");
            routes.MapPageRoute("templates-route", "templates", "~/templates.aspx");
            routes.MapPageRoute("templates-delete-route", "templates/delete/{id}", "~/delete_template.aspx");

            // ####################### ANNOUNCEMENTS ROUTE ######################## //
            routes.MapPageRoute("announcements-route", "announcements", "~/messages.aspx");
            routes.MapPageRoute("announcements-add-route", "announcements/add", "~/add_message.aspx");
            routes.MapPageRoute("announcements-edit-route", "announcements/edit/{id}", "~/add_message.aspx");
            routes.MapPageRoute("announcements-delete-route", "announcements/delete/{id}", "~/delete_message.aspx");

            // ####################### DECKS ROUTE ########################### //
            routes.MapPageRoute("decks-route", "decks", "~/decks.aspx");
            routes.MapPageRoute("decks-add-route", "decks/add", "~/decks_add.aspx");
            routes.MapPageRoute("decks-edit-route", "decks/edit/{id}", "~/decks_add.aspx");
            routes.MapPageRoute("decks-delete-route", "decks/delete/{id}", "~/decks_delete.aspx");

            // ####################### SLIDES ROUTE ############################## //
            routes.MapPageRoute("slides-by-deck-route", "decks/slides/{id}", "~/slides.aspx");
            routes.MapPageRoute("slides-add-route", "slides/add/{id}", "~/slides_add.aspx");
            routes.MapPageRoute("slides-delete-route", "slides/delete/{id}", "~/slides_delete.aspx");

            // ####################### EDITOR ROUTE ################################ //
            routes.MapPageRoute("editor-route", "overlay-editor", "~/editor/dist/editor.aspx");

            // ####################### OVERLAY BUILDER ROUTE ################################ //
            routes.MapPageRoute("overlay-builder-step-1-route", "overlays/builder/step-1", "~/template_builder_step1.aspx");
            routes.MapPageRoute("overlay-builder-step-2-route", "overlays/builder/step-2/{id}", "~/template_builder_step2.aspx");
            routes.MapPageRoute("overlays-route", "overlays", "~/overlays.aspx");
            routes.MapPageRoute("overlays-delete-route", "overlays/delete/{id}", "~/overlays_delete.aspx");
            routes.MapPageRoute("overlays-clone-route", "overlays/clone", "~/clone_overlay.aspx");
            routes.MapPageRoute("overlays-clone-preselected-route", "overlays/clone/{id}", "~/clone_overlay.aspx");

            // ####################### PREVIEW ROUTE ################################ //
            routes.MapPageRoute("preview-select-options-route", "preview-options/{id}", "~/template_builder_live_preview_select_options.aspx");
            routes.MapPageRoute("preview-route", "preview/{event_id}/{location_id}/{overlay_id}", "~/template_builder_live_preview.aspx");
            routes.MapPageRoute("preview-with-announcement-route", "preview/{event_id}/{location_id}/{overlay_id}/announce/{announcement_id}/{type}", "~/template_builder_live_preview.aspx");
            routes.MapPageRoute("preview-with-end-of-day-route", "preview/{event_id}/{location_id}/{overlay_id}/end-of-day/{end_id}/{type}", "~/template_builder_live_preview.aspx");
            routes.MapPageRoute("preview-with-announcement-and-end-of-day-route", "preview/{event_id}/{location_id}/{overlay_id}/{announcement_id}/{end_id}/{type}", "~/template_builder_live_preview.aspx");

            // ####################### VERSIONS ############################ //
            routes.MapPageRoute("version-route", "versions", "~/versions.aspx");

            // this has to be last!!!!
            //routes.MapPageRoute("page-by-url-route", "{url}", "~/page.aspx");
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}