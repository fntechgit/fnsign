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
    public partial class clone_overlay : System.Web.UI.Page
    {
        public string user_name = string.Empty;

        public string total_media = "0";
        public string facebook_media = "0";
        public string instagram_media = "0";
        public string twitter_media = "0";
        public string unapproved_media = "0";
        public string all_media = "0";

        private schedInterface.permissions _permissions = new schedInterface.permissions();
        private schedInterface.users _users = new schedInterface.users();
        private schedInterface.events _events = new schedInterface.events();
        private schedInterface.overlays _overlays = new schedInterface.overlays();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            if (!Page.IsPostBack)
            {
                ddl_clone.DataSource = _overlays.all();
                ddl_clone.DataValueField = "id";
                ddl_clone.DataTextField = "title";
                ddl_clone.DataBind();

                ListItem i = new ListItem("Select Overlay to Clone", "0");

                ddl_clone.Items.Insert(0, i);

                if (Page.RouteData.Values["id"] != null)
                {
                    ddl_clone.SelectedValue = Page.RouteData.Values["id"] as string;
                }
            }
        }

        protected void update(object sender, EventArgs e)
        {
            Overlay o = _overlays.single(Convert.ToInt32(ddl_clone.SelectedValue));

            o.title = title.Text;
            o.active = true;

            if (fup_guide.HasFile)
            {
                string path = Server.MapPath("~/uploads/");
                string extension = Path.GetExtension(fup_guide.FileName);
                string filename = Guid.NewGuid().ToString();

                fup_guide.SaveAs(path + filename + extension);

                o.guide = filename + extension;
            }

            o = _overlays.add(o);

            Response.Redirect("/overlays/builder/step-2/" + o.id);

            //pnl_success.Visible = true;
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