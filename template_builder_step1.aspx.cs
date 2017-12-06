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
    public partial class template_builder_step1 : System.Web.UI.Page
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
                
            }
        }

        protected void update(object sender, EventArgs e)
        {
            Overlay o = new Overlay();

            o.title = title.Text;
            o.width = Convert.ToInt32(ddl_width.SelectedValue);
            o.height = Convert.ToInt32(ddl_height.SelectedValue);
            o.active = true;
            o.speed = 0;
            o.group_by_location = false;
            o.group_by_start = false;

            Int32 test_bottom_height = 0;

            Int32.TryParse(bottom_height.Text, out test_bottom_height);

            o.bottom_height = test_bottom_height;

            if (fup_bottom_overlay.HasFile)
            {
                string path = Server.MapPath("~/uploads/");
                string extension = Path.GetExtension(fup_bottom_overlay.FileName);
                string filename = Guid.NewGuid().ToString();

                fup_bottom_overlay.SaveAs(path + filename + extension);

                o.bottom_overlay = filename + extension;
            }

            if (fup_guide.HasFile)
            {
                string path = Server.MapPath("~/uploads/");
                string extension = Path.GetExtension(fup_guide.FileName);
                string filename = Guid.NewGuid().ToString();

                fup_guide.SaveAs(path + filename + extension);

                o.guide = filename + extension;
            }

            o =_overlays.add(o);

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