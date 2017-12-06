using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class sublocations_delete : System.Web.UI.Page
    {
        private schedInterface.sublocations _sublocations = new schedInterface.sublocations();

        protected void Page_PreInit(object sender, EventArgs e)
        {
            _sublocations.delete(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            if (Page.Request.UrlReferrer != null)
            {
                Response.Redirect(Page.Request.UrlReferrer.ToString());
            }
            else
            {
                Response.Redirect("/locations");
            }
        }
    }
}