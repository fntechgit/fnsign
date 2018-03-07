using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace fnsignManager
{
    public partial class delete_event_type : System.Web.UI.Page
    {
        private schedInterface.event_types _eventtypes = new schedInterface.event_types();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            _eventtypes.delete(Convert.ToInt32(Page.RouteData.Values["id"]));

            Response.Redirect("/eventtypes");
        }
    }
}