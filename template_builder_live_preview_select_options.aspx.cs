using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class template_builder_live_preview_select_options : System.Web.UI.Page
    {
        private schedInterface.events _events = new schedInterface.events();
        private schedInterface.locations _locations = new schedInterface.locations();
        private schedInterface.overlays _overlays = new schedInterface.overlays();
        private schedInterface.templates _templates = new schedInterface.templates();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddl_events.DataSource = _events.all();
                ddl_events.DataValueField = "id";
                ddl_events.DataTextField = "title";
                ddl_events.DataBind();

                ListItem i = new ListItem("Select Event", "0");

                ddl_events.Items.Insert(0, i);

                ddl_priority_announcement.DataSource = _overlays.all();
                ddl_priority_announcement.DataValueField = "id";
                ddl_priority_announcement.DataTextField = "title";
                ddl_priority_announcement.DataBind();

                ListItem ia = new ListItem("Select Priority Announcement Template", "0");

                ddl_priority_announcement.Items.Insert(0, ia);

                ddl_end_of_day.DataSource = _overlays.all();
                ddl_end_of_day.DataValueField = "id";
                ddl_end_of_day.DataTextField = "title";
                ddl_end_of_day.DataBind();

                ListItem ie = new ListItem("Select End of Day Template", "0");

                ddl_end_of_day.Items.Insert(0, ie);

                schedInterface.Overlay o = _overlays.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                ddl_speed.SelectedValue = o.speed.ToString();
                ck_group_by_start.Checked = o.group_by_start;
                ck_group_by_location.Checked = o.group_by_location;
                ck_allsessions.Checked = o.all_sessions;

                if (o.template_id_announce > 0)
                {
                    ddl_priority_announcement.SelectedValue = o.template_id_announce.ToString();
                }
                else
                {
                    ddl_priority_announcement.SelectedIndex = 0;
                }

                if (o.template_id_end > 0)
                {
                    ddl_end_of_day.SelectedValue = o.template_id_end.ToString();
                }
                else
                {
                    ddl_end_of_day.SelectedIndex = 0;
                }
            }
        }

        protected void get_locations(object sender, EventArgs e)
        {
            ddl_locations.DataSource = _locations.by_event(Convert.ToInt32(ddl_events.SelectedValue));
            ddl_locations.DataValueField = "id";
            ddl_locations.DataTextField = "title";
            ddl_locations.DataBind();

            ListItem i2 = new ListItem("Select Location", "0");

            ddl_locations.Items.Insert(0, i2);
        }

        protected void preview(object sender, EventArgs e)
        {
            schedInterface.Overlay o = _overlays.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            o.speed = Convert.ToInt32(ddl_speed.SelectedValue);
            o.group_by_location = ck_group_by_location.Checked;
            o.group_by_start = ck_group_by_start.Checked;
            o.all_sessions = ck_allsessions.Checked;
            o.template_id_announce = Convert.ToInt32(ddl_priority_announcement.SelectedValue);
            o.template_id_end = Convert.ToInt32(ddl_end_of_day.SelectedValue);

            _overlays.update(o);

            if (o.template_id_announce > 0 && o.template_id_end > 0)
            {
                // we have all the routes
                Response.Redirect("/preview/" + ddl_events.SelectedValue.ToString() + "/" + ddl_locations.SelectedValue.ToString() + "/" + Page.RouteData.Values["id"] as string + "/" + o.template_id_announce.ToString() + "/" + o.template_id_end.ToString() + "/default");
            }
            else if(o.template_id_announce > 0)
            {
                // only main and announcement route
                Response.Redirect("/preview/" + ddl_events.SelectedValue.ToString() + "/" + ddl_locations.SelectedValue.ToString() + "/" + Page.RouteData.Values["id"] as string + "/announce/" + o.template_id_announce.ToString() + "/default");
            }
            else if (o.template_id_end > 0)
            {
                // only main and end of day route
                Response.Redirect("/preview/" + ddl_events.SelectedValue.ToString() + "/" + ddl_locations.SelectedValue.ToString() + "/" + Page.RouteData.Values["id"] as string + "/end-of-day/" + o.template_id_end.ToString() + "/default");
            }
            else
            {
                // only main
                Response.Redirect("/preview/" + ddl_events.SelectedValue.ToString() + "/" + ddl_locations.SelectedValue.ToString() + "/" + Page.RouteData.Values["id"] as string);
            }
        }
    }
}