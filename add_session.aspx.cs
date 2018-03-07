using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;
using System.IO;

namespace fnsignManager
{
    public partial class add_session : System.Web.UI.Page
    {
        private schedInterface.sessions _sessions = new schedInterface.sessions();
        public string add_edit = "Add";

        public string total_media = "0";
        public string facebook_media = "0";
        public string instagram_media = "0";
        public string twitter_media = "0";
        public string unapproved_media = "0";
        public string all_media = "0";

        private schedInterface.messages _messages = new schedInterface.messages();
        private schedInterface.terminals _terminals = new terminals();
        private schedInterface.locations _locations = new schedInterface.locations();
        private schedInterface.templates _templates = new schedInterface.templates();


        public Int32 event_id = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            if (Page.RouteData.Values["id"] != null)
            {
                add_edit = "Update";
                btn_process.Text = "Update";
            }
            else
            {
                btn_process.Text = "Add";
            }

            event_id = Convert.ToInt32(Session["event_id"]);

            if (!Page.IsPostBack)
            {
                ddl_location.DataSource = _locations.by_event(event_id);
                ddl_location.DataValueField = "sched_id";
                ddl_location.DataTextField = "title";
                ddl_location.DataBind();

                ListItem locationItem = new ListItem("Select Location", "0");

                ddl_location.Items.Insert(0, locationItem);

                if (Page.RouteData.Values["id"] != null)
                {
                    Session s = _sessions.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                    title.Text = s.name;
                    start.Text = s.start.ToShortDateString();
                    start_time.Text = s.start.ToShortTimeString();
                    end.Text = s.end.ToShortDateString();
                    end_time.Text = s.end.ToShortTimeString();
                    type.Text = s.event_type;
                    ddl_location.SelectedValue = s.venue_id.ToString();
                    //speakers.Text = s.speakers;
                    //speaker_companies.Text = s.speaker_companies;

                    //showImages(s);
                }
            }
        }

        protected void update(object sender, EventArgs e)
        {
            Session s = new Session();

            Boolean is_update = false;

            if (Page.RouteData.Values["id"] != null)
            {
                s = _sessions.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                is_update = true;
            }

            s.name = title.Text;
            s.start = Convert.ToDateTime(start.Text + " " + start_time.Text);
            s.end = Convert.ToDateTime(end.Text + " " + end_time.Text);
            s.event_type = type.Text;
            s.venue_id = ddl_location.SelectedValue;
            s.venue = ddl_location.SelectedItem.Text;
            //s.speakers = speakers.Text;
            //s.speaker_companies = speaker_companies.Text;

            //if (fup_speaker_image.HasFile)
            //{
            //    // add a new image
            //    string path = Server.MapPath("~/uploads/");
            //    string unique = Guid.NewGuid().ToString();
            //    string extension = Path.GetExtension(fup_speaker_image.FileName);

            //    fup_speaker_image.SaveAs(path + unique + extension);

            //    if (string.IsNullOrEmpty(s.speaker_images))
            //    {
            //        s.speaker_images = unique + extension;
            //    }
            //    else
            //    {
            //        s.speaker_images += ":" + unique + extension;
            //    }
            //}

            if (is_update)
            {
                s = _sessions.add(s, event_id);
            }
            else
            {
                s.event_key = "MANUAL_" + Guid.NewGuid().ToString();
                s.event_id = event_id;
                _sessions.add(s, event_id);
            }

            //showImages(s);

            pnl_success.Visible = true;
        }

        //private void showImages(Session s)
        //{
        //    ph_current_images.Controls.Clear();

        //    List<string> images = s.speaker_images.Split(':').ToList();

        //    foreach(string i in images)
        //    {
        //        ph_current_images.Controls.Add(new LiteralControl("<img src=\"/uploads/" + i + "\" />"));
        //    }
        //}

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
    }
}