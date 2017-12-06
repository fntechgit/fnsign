using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class session_delete : System.Web.UI.Page
    {
        private schedInterface.sessions _sessions = new schedInterface.sessions();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            _sessions.delete(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            Response.Redirect("/sessions");
        }
    }
}