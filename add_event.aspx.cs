using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using schedInterface;
using System.IO;

namespace fnsignManager
{
    public partial class add_event : System.Web.UI.Page
    {
        public string add_edit = "Add";

        public string total_media = "0";
        public string facebook_media = "0";
        public string instagram_media = "0";
        public string twitter_media = "0";
        public string unapproved_media = "0";
        public string all_media = "0";

        private schedInterface.events _events = new schedInterface.events();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            // check for edit
            if (Page.RouteData.Values["id"] != null)
            {
                btn_process.Text = "Update";
                add_edit = "Update";
            }
            else
            {
                btn_process.Text = "Add";
            }

            if (!Page.IsPostBack)
            {
                if (Page.RouteData.Values["id"] != null)
                {
                    Event ev = _events.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                    title.Text = ev.title;
                    start_date.Text = Convert.ToDateTime(ev.event_start).ToShortDateString();
                    start_time.Text = Convert.ToDateTime(ev.event_start).ToShortTimeString();
                    end_date.Text = Convert.ToDateTime(ev.event_end).ToShortDateString();
                    end_time.Text = Convert.ToDateTime(ev.event_end).ToShortTimeString();
                    listenSlider.Value = ev.interval.ToString();
                    url.Text = ev.url;
                    api_key.Text = ev.api_key;
                    username.Text = ev.t_username;
                    hashtags.Text = ev.t_hashtag;
                    eod_description.Text = ev.eod_description;
                    eod_category.Text = ev.eod_category;
                    eod_time.Text = ev.eod_time;
                    eod_title.Text = ev.eod_title;
                    ck_display.Checked = ev.overridedisplay;
                    ck_fnsign.Checked = ev.overridetime;
                    ck_runtime.Checked = ev.timerun;
                    ddl_timezone.SelectedValue = ev.timezone.ToString();
                    ddl_apitype.SelectedValue = ev.api_type.ToString();

                    if (ev.timewarp != null)
                    {
                        timewarp_date.Text = Convert.ToDateTime(ev.timewarp).ToShortDateString();
                        timewarp_time.Text = Convert.ToDateTime(ev.timewarp).ToShortTimeString();
                    }

                    if (!string.IsNullOrEmpty(ev.full_session))
                    {
                        current_image.ImageUrl = "/uploads/" + ev.full_session;

                        pnl_current_image.Visible = true;
                    }
                }
            }

        }

        private void permissions()
        {
            if (string.IsNullOrEmpty(Session["event_id"] as string))
            {
                Response.Redirect("/login");
            }

            if (string.IsNullOrEmpty(Session["user_access"] as string))
            {
                Response.Redirect("/login");
            }
            else
            {
                check_levels(Session["user_access"] as string);
            }
        }

        private void check_levels(string user_level)
        {
            switch (user_level)
            {
                case "system":
                    event_link.Visible = true;
                    display_link.Visible = true;
                    user_link.Visible = true;
                    preference_link.Visible = true;
                    break;
                case "event":
                    display_link.Visible = true;
                    preference_link.Visible = true;
                    break;
                case "content":
                    break;
            }
        }

        protected void update(object sender, EventArgs e)
        {
            Event ev = new Event();

            Boolean is_update = false;

            if (Page.RouteData.Values["id"] != null)
            {
                is_update = true;

                ev = _events.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));
            }

            ev.title = title.Text.ToString();
            ev.interval = Convert.ToInt32(listenSlider.Value);
            ev.api_key = api_key.Text;
            ev.url = url.Text;
            ev.t_username = username.Text;
            ev.t_hashtag = hashtags.Text;
            ev.eod_category = eod_category.Text;
            ev.eod_description = eod_description.Text;
            ev.eod_time = eod_time.Text;
            ev.eod_title = eod_title.Text;

            if (!string.IsNullOrEmpty(start_date.Text.ToString()) && !string.IsNullOrEmpty(start_time.Text.ToString()))
            {
                ev.event_start = ((DateTime)Convert.ToDateTime(start_date.Text.ToString())).Date.Add(((DateTime)Convert.ToDateTime(start_time.Text.ToString())).TimeOfDay);
            }

            if (!string.IsNullOrEmpty(end_date.Text.ToString()) && !string.IsNullOrEmpty(end_time.Text.ToString()))
            {
                ev.event_end = ((DateTime)Convert.ToDateTime(end_date.Text.ToString())).Date.Add(((DateTime)Convert.ToDateTime(end_time.Text.ToString())).TimeOfDay);
            }

            if (!string.IsNullOrEmpty(timewarp_date.Text.ToString()) &&
                !string.IsNullOrEmpty(timewarp_time.Text.ToString()))
            {
                ev.timewarp =
                    ((DateTime) Convert.ToDateTime(timewarp_date.Text.ToString())).Date.Add(
                        ((DateTime) Convert.ToDateTime(timewarp_time.Text.ToString())).TimeOfDay);
            }
            else
            {
                ev.timewarp = null;
            }

            ev.overridedisplay = ck_display.Checked;
            ev.overridetime = ck_fnsign.Checked;
            ev.timerun = ck_runtime.Checked;
            ev.timezone = Convert.ToInt32(ddl_timezone.SelectedValue);
            ev.api_type = Convert.ToInt32(ddl_apitype.SelectedValue);

            if (is_update)
            {
                if (image.HasFile)
                {
                    string path = Server.MapPath("~/uploads/");
                    string extension = Path.GetExtension(image.FileName.ToString());
                    string unique = Guid.NewGuid().ToString();

                    image.SaveAs(path + unique + extension);

                    ev.full_session = unique + extension;
                }

                ev = _events.fullupdate(ev);

                if (!string.IsNullOrEmpty(ev.full_session))
                {
                    current_image.ImageUrl = "/uploads/" + ev.full_session;

                    pnl_current_image.Visible = true;
                }
            }
            else
            {
                ev = _events.add(ev);
            }

            pnl_success.Visible = true;
        }
    }
}