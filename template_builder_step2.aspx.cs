using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class template_builder_step2 : System.Web.UI.Page
    {
        private schedInterface.overlays _overlays = new schedInterface.overlays();

        public string temp_height;
        public Overlay o;

        protected void Page_Load(object sender, EventArgs e)
        {
            o = _overlays.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            Page.Title = o.title;
            Page.MetaDescription = o.title;

            template.Controls.Add(new LiteralControl(o.layout));

            overlay_id.Value = o.id.ToString();
            template_bg.Value = o.guide;
            template_height.Value = o.height.ToString();
            template_width.Value = o.width.ToString();

            temp_height = o.height.ToString();
        }
    }
}