using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using schedInterface;

namespace fnsignManager.services
{
    /// <summary>
    /// Summary description for editor
    /// </summary>
    [WebService(Namespace = "http://fnsign.fntech.com")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    [System.Web.Script.Services.ScriptService]
    public class editor : System.Web.Services.WebService
    {
        public schedInterface.overlays _overlays = new schedInterface.overlays();

        [WebMethod(EnableSession = true, Description = "Save Overlay Layout")]
        public Boolean save(Int32 id, string layout)
        {
            Overlay o = _overlays.single(id);

            o.layout = HttpUtility.UrlDecode(layout);

            _overlays.update(o);

            return true;
        }
    }
}
