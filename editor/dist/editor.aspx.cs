using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager.editor.dist
{
    public partial class editor : System.Web.UI.Page
    {
        private schedInterface.overlays _overlays = new schedInterface.overlays();

        protected void Page_Load(object sender, EventArgs e)
        {
            //renderOverlays();
        }

        private void renderOverlays()
        {
            foreach (Overlay o in _overlays.active())
            {
                ph_current_overlays.Controls.Add(new LiteralControl("<li class id=\"" + o.id + "\"><a href=\"#page" + o.id + "\" class=\"menuItemLink\" style=\"display:block;\">" + o.title + "</a><span class=\"pageButtons\"><a href class=\"fileEdit fui-new\"></a><a href class=\"fileDel fui-cross\"></a><a class=\"btn btn-xs btn-primary btn-embossed fileSave fui-check href=\"#\"></a></span></li>"));
            }
        }
    }
}