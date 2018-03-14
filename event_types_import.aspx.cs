using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fnsignManager
{
    public partial class event_types_import : System.Web.UI.Page
    {
        public string total_records;
        private schedInterface.event_types _types = new schedInterface.event_types();
        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();
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
                    event_types_link.Visible = true;
                    display_link.Visible = true;
                    user_link.Visible = true;
                    preference_link.Visible = true;
                    break;
                case "event":
                    display_link.Visible = true;
                    preference_link.Visible = true;
                    security_level.Visible = false;
                    break;
                case "content":
                    security_level.Visible = false;
                    break;
            }
        }

        protected void import(object sender, EventArgs e)
        {
            var event_id = Convert.ToInt32(Session["event_id"] as string);
            var event_types = _types.import(url.Text, api_key.Text, event_id);

            if (import_type.SelectedValue == "overwrite")
                _types.delete_by_event(event_id);

            foreach (var item in event_types)
            {
                _types.add(item);
            }

            total_records = event_types.Count().ToString();
            pnl_success.Visible = true;
        }
    }
}