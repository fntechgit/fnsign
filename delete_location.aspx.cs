using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class delete_location : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            Int32 location_id = Convert.ToInt32(Page.RouteData.Values["id"] as string);

            schedInterface.locations _locations = new schedInterface.locations();

            _locations.delete(location_id);

            Response.Redirect("/locations");
        }
    }
}