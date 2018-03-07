using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class event_types : System.Web.UI.Page
    {
        private schedInterface.event_types _types = new schedInterface.event_types();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();


            foreach (EventType t in _types.by_event(Convert.ToInt32(Session["event_id"].ToString())))
            {
                ph_tags.Controls.Add(new LiteralControl("<tr><td data-title=\"Title\">" + t.title + "</td><td data-title=\"Id\">" + t.event_type_id + "</td><td data-title=\"BgColor\" class=\"hidden-xs hidden-sm\">" + t.bgcolor + "</td><td><a href=\"/eventtypes/edit/" + t.id + "\" class=\"fa fa-edit\"></a> <a href=\"/eventtypes/remove/" + t.id + "\" class=\"fa fa-trash-o\"></a> </td></tr>"));
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