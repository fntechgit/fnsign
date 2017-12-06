using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class overlays_delete : System.Web.UI.Page
    {
        private schedInterface.overlays _overlays = new schedInterface.overlays();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Page.RouteData.Values["id"] != null)
            {
                _overlays.delete(Convert.ToInt32(Page.RouteData.Values["id"] as string));
            }

            Response.Redirect("/overlays");
        }
    }
}