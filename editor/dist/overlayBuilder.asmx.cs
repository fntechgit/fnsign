using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using schedInterface;

namespace fnsignManager.editor.dist
{
    /// <summary>
    /// Summary description for overlayBuilder
    /// </summary>
    [WebService(Namespace = "http://fnsign.fntech.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    [System.Web.Script.Services.ScriptService]
    public class overlayBuilder : System.Web.Services.WebService
    {
        private schedInterface.overlays _overlays = new schedInterface.overlays();

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod(EnableSession = true, Description = "Add / Update Overlay")]
        public Overlay addOverlay(string title, string data, string resolution, Int32 id)
        {
            Overlay o = new Overlay();

            o.active = true;
            o.body = data;
            if (resolution == "Desktop")
            {
                o.footer = "1920 x 1080";
            }
            else
            {
                o.footer = "1080 x 1920";
            }

            o.id = id;
            o.title = title;

            return _overlays.addUpdate(o);
        }
    }
}
