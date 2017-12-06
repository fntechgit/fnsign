using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class sessions : System.Web.UI.Page
    {
        public string total_media = "0";
        public string facebook_media = "0";
        public string instagram_media = "0";
        public string twitter_media = "0";
        public string unapproved_media = "0";
        public string all_media = "0";

        private schedInterface.sessions _sessions = new schedInterface.sessions();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            string start = "N/A";
            string end = "N/A";

            string full_icon = "fa-battery-empty";

            foreach (Session t in _sessions.by_event(Convert.ToInt32(Session["event_id"].ToString())))
            {
                start = t.start < DateTime.Now.AddYears(-50) ? "NOT SET" : Convert.ToDateTime(t.start).ToShortDateString() + " " + Convert.ToDateTime(t.start).ToShortTimeString();
                end = t.end < DateTime.Now.AddYears(-50) ? "NOT SET" : Convert.ToDateTime(t.end).ToShortDateString() + " " + Convert.ToDateTime(t.end).ToShortTimeString();

                full_icon = t.full ? "fa-battery-full" : "fa-battery-empty";

                ph_tags.Controls.Add(new LiteralControl("<tr><td data-title=\"Title\">" + t.name + "</td><td data-title=\"Venue\" class=\"hidden-xs hidden-sm\">" + t.venue + "</td><td data-title=\"Attendees\" class=\"hidden-xs hidden-sm\">" + t.goers + "</td><td data-title=\"Speakers\" class=\"hidden-xs hidden-sm\">" + t.speakers + "</td><td data-title=\"Type\">" + t.event_type + "</td><td data-title=\"Start\" class=\"text-right\">" + start + "</td><td data-title=\"End\" class=\"text-right\">" + end + "</td><td><a href=\"/sessions/edit/" + t.internal_id + "\" class=\"fa fa-edit\"></a> <a href=\"/sessions/remove/" + t.internal_id + "\" class=\"fa fa-trash-o\"></a> <a href=\"/sessions/toggle-full/" + t.internal_id + "\" class=\"fa " + full_icon + "\"></a></td></tr>"));
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
    }
}