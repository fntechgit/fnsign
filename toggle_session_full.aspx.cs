using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class toggle_session_full : System.Web.UI.Page
    {
        private schedInterface.sessions _sessions = new schedInterface.sessions();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            _sessions.toggle_full(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            Response.Redirect("/sessions");
        }
    }
}