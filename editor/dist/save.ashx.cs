using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using RestSharp.Serializers;
using schedInterface;

namespace fnsignManager.editor.dist
{
    /// <summary>
    /// Summary description for save
    /// </summary>
    public class save : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            JsonSerializer jsonSerializer = new JsonSerializer();

                // save it   
                var data = context.Request;

                var sr = new StreamReader(data.InputStream);
                var stream = sr.ReadToEnd();
                var javascriptSerializer = new JavaScriptSerializer();
                var PostedData = javascriptSerializer.Deserialize<OverlayJSON>(stream);

                Overlay o = new Overlay();

                o.active = true;
                o.body = PostedData.pages;
                o.footer = PostedData.responsiveMode;

                schedInterface.overlays _overlays = new schedInterface.overlays();

                o = _overlays.addUpdate(o);

                context.Response.Write(jsonSerializer.Serialize(new
                {
                    responseCode = 1,
                    responseHTML = "<h5>Success</h5><p>The overlay was saved successfully</p>"
                }));

                context.Response.ContentType = "application/json";
            
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}