using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using schedInterface;

namespace fnsignManager.services
{
    /// <summary>
    /// Summary description for preview
    /// </summary>
    [WebService(Namespace = "https://fnsign.fntech.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    
    [System.Web.Script.Services.ScriptService]
    public class preview : System.Web.Services.WebService
    {
        private schedInterface.sessions _sessions = new schedInterface.sessions();
        private schedInterface.terminals _terminals = new terminals();
        private schedInterface.templates _templates = new schedInterface.templates();
        private schedInterface.overlays _overlays = new schedInterface.overlays();
        private schedInterface.settings _settings = new settings();
        private schedInterface.messages _messages = new schedInterface.messages();
        private schedInterface.events _events = new schedInterface.events();
        schedInterface.mediaManager _media = new mediaManager();
        private schedInterface.timewarp _timewarp = new timewarp();

        [WebMethod(Description = "Return Server Time")]
        public string server_time()
        {
            return DateTime.Now.ToShortTimeString();
        }

        [WebMethod(Description = "Check for Announcement", EnableSession = true)]
        public Message get_message(Int32 template_id, Int32 terminal_id, Boolean priority)
        {
            Int32 event_id = Convert.ToInt32(Context.Session["event_id"]);

            return _messages.preview(event_id, template_id, terminal_id, priority);
        }

        [WebMethod(Description = "Is Session Full", EnableSession = true)]
        public Message session_full(Int32 terminal_id)
        {
            return _messages.session_full(terminal_id);
        }

        [WebMethod(Description = "Login From Cookie", EnableSession = true)]
        public Boolean loginAgain(string event_id)
        {
            Context.Session["event_id"] = event_id;

            return true;
        }

        [WebMethod(Description = "Get Random Media", EnableSession = true)]
        public Media random()
        {
            return _media.random_by_event(Convert.ToInt32(Context.Session["event_id"]));
        }

        [WebMethod(Description = "Get Event FUll Session Graphic", EnableSession = true)]
        public string full_graphic()
        {
            return _events.single(Convert.ToInt32(Context.Session["event_id"])).full_session;
        }

        [WebMethod(Description = "Get Current Session", EnableSession = true)]
        public Session current(string location)
        {
            Int32 event_id = Convert.ToInt32(Context.Session["event_id"]);

            Event ev = _events.single(event_id);

            Session s = _sessions.current(event_id, location, _timewarp.display(event_id));

            if (s.internal_id == 0)
            {
                // check for next session date
                Session next = _sessions.next(event_id, location, DateTime.Now);

                if (next.start.Date > DateTime.Today.Date || next.internal_id == 0)
                {
                    s.name = ev.eod_title;
                    s.event_type = ev.eod_category;
                    s.event_start = ev.eod_time;
                    s.event_end = "";
                    s.description = ev.eod_description;
                    s.event_id = event_id;
                    s.id = "NO SESSION";
                }
                else
                {
                    // Make this Dynamic
                    s.name = "Another great session coming up! See schedule below.";
                    s.event_type = "No Official Session";
                    s.event_start = "";
                    s.event_end = "";
                    s.event_id = event_id;
                    s.id = "NO SESSION";
                }
            }
            else
            {
                s.event_start = s.start.ToShortTimeString();
                s.event_end = s.end.ToShortTimeString();

                //s.speakersList = s.speakers.Split(':').ToList();
                //s.speakerCompaniesList = s.speaker_companies.Split(':').ToList();
                //s.speakerImagesList = s.speaker_images.Split(':').ToList();
            }

            if (Context.Session["event_id"] == null)
            {
                s.event_id = 0;
            }

            return s;
        }
    }
}
