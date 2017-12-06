using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class add_location : System.Web.UI.Page
    {
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

                if (Page.RouteData.Values["id"] != null)
                {
                    Location l = _locations.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                    hdn_sched_id.Value = l.sched_id;
                    title.Text = l.title;
                }
            }
        }

        protected void update(object sender, EventArgs e)
        {
            Location l = new Location();

            Boolean is_update = false;

            if (Page.RouteData.Values["id"] != null)
            {
                l = _locations.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                is_update = true;
            }

            l.title = title.Text;

            if (is_update)
            {
                _locations.add(l);
            }
            else
            {
                l.sched_id = "MANUAL_" + Guid.NewGuid().ToString();
                l.event_id = Convert.ToInt32(Session["event_id"]);
                _locations.add(l);
            }

            pnl_success.Visible = true;
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