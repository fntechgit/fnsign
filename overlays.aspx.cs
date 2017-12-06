using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class overlays : System.Web.UI.Page
    {
        private schedInterface.overlays _overlays = new schedInterface.overlays();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            foreach (Overlay o in _overlays.all())
            {
                ph_tags.Controls.Add(new LiteralControl("<tr><td data-title=\"Title\">" + o.title.ToUpper() + "</td><td data-title=\"Width\" class=\"hidden-xs hidden-sm\">" + o.width + "px</td><td data-title=\"Height\" class=\"hidden-xs hidden-sm\">" + o.height + "px</td><td data-title=\"Actions\"><a href=\"/overlays/builder/step-2/" + o.id + "\"><i class=\"fa fa-edit\"></i></a> <a href=\"/overlays/clone/" + o.id + "\"><i class=\"fa fa-clone\"></i></a> <a href=\"/overlays/delete/" + o.id + "\"><i class=\"fa fa-trash-o\"></i></a></td></tr>"));
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