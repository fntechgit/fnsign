using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class add_event_type : System.Web.UI.Page
    {

        private schedInterface.event_types _types = new schedInterface.event_types();
        public string add_edit = "Add";

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

            if (!Page.IsPostBack)
            {

                if (Page.RouteData.Values["id"] != null)
                {
                    EventType t = _types.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

                    title.Text = t.title;
                    bgcolor.Text = t.bgcolor;
                    event_type_id.Text = t.event_type_id.ToString();

                }
            }
        }

        protected void update(object sender, EventArgs e)
        {
            EventType t = new EventType();

            if (Page.RouteData.Values["id"] != null)
                t = _types.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));
            
            t.event_id = Convert.ToInt32(Session["event_id"]);
            t.title = title.Text;
            t.bgcolor = bgcolor.Text;
            t.event_type_id = int.Parse(event_type_id.Text);

            if (Page.RouteData.Values["id"] != null)
                _types.update(t);
            else
                _types.add(t);

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
                    event_type_link.Visible = true;
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