using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class template_builder_live_preview : System.Web.UI.Page
    {
        private schedInterface.terminals _terminals = new terminals();
        private schedInterface.templates _templates = new schedInterface.templates();
        private schedInterface.overlays _overlays = new schedInterface.overlays();
        private schedInterface.sessions _sessions = new schedInterface.sessions();
        private schedInterface.locations _locations = new schedInterface.locations();
        private schedInterface.settings _settings = new settings();
        private schedInterface.events _events = new schedInterface.events();
        private schedInterface.timewarp _timewarp = new timewarp();

        public string bgcolor;
        public string font;
        public string font_color;
        public string bgimage;
        public string session_type;
        public string session_title_val;
        public string start_time;
        public string end_time;
        public string next_session;
        public string fnsignUrl;
        public string video;
        public Boolean multiple = false;

        public Overlay o;

        protected void Page_Load(object sender, EventArgs e)
        {
            fnsignUrl = _settings.site_url();

            Event ev = _events.single(Convert.ToInt32(Page.RouteData.Values["event_id"]));

            full_session_graphic.Value = ev.full_session;

            Location l = _locations.single(Convert.ToInt32(Page.RouteData.Values["location_id"]));

            location_id.Value = l.id.ToString();

            string mode = "default";

            if (Page.RouteData.Values["type"] != null)
            {
                is_announcement_template.Value = "no";
                is_end_of_day_template.Value = "no";

                mode = Page.RouteData.Values["type"] as string;
            }

            switch (mode)
            {
                case "announcement":
                    is_announcement_template.Value = "yes";
                    is_end_of_day_template.Value = "no";

                    schedInterface.messages _messages = new schedInterface.messages();

                    // get announcement and render it
                    Message m = _messages.preview(ev.id, 0, 0, true);

                    announcement_description.Value = m.message;
                    announcement_image.Value = m.pic;
                    announcement_title.Value = m.title;

                    o = _overlays.single(Convert.ToInt32(Page.RouteData.Values["announcement_id"]));

                    break;

                case "end":
                    is_announcement_template.Value = "no";
                    is_end_of_day_template.Value = "yes";

                    // get end of day content and render it
                    end_of_day_category.Value = ev.eod_category;
                    end_of_day_description.Value = ev.eod_description;
                    end_of_day_time.Value = ev.eod_time;
                    end_of_day_title.Value = ev.eod_time;

                    o = _overlays.single(Convert.ToInt32(Page.RouteData.Values["end_id"]));

                    break;

                default:
                    is_announcement_template.Value = "no";
                    is_end_of_day_template.Value = "no";

                    o = _overlays.single(Convert.ToInt32(Page.RouteData.Values["overlay_id"]));

                    break;
            }

            

            hdn_group_by_location.Value = o.group_by_location.ToString().ToLower();
            hdn_group_by_start.Value = o.group_by_start.ToString().ToLower();

            scroll_speed.Value = (o.speed * 1000).ToString();

            bgimage = o.guide;

            event_id.Value = ev.id.ToString();
            location_sched.Value = l.sched_id;
            //terminal_id.Value = Page.RouteData.Values["id"].ToString();

            current_date.Value = DateTime.Now.Date.ToShortDateString();

            DateTime dt = DateTime.Now.AddDays(-1);

            Int32 i = 0;

            Session s = _sessions.current(ev.id, l.sched_id, _timewarp.display(ev.id));

            Session next = new Session();

            if (s.internal_id > 0)
            {
                next = _sessions.next(ev.id, l.sched_id, s.end);
            }
            else
            {
                next.internal_id = 0;
            }

            List<Session> sess = new List<Session>();

            if (o.all_sessions)
            {
                sess = _sessions.by_event(ev.id);
            }
            else
            {
                sess = _sessions.future_by_event_by_location_by_day(ev.id, l.sched_id, _timewarp.display(ev.id));
            }

            if (o.group_by_location)
            {
                sess = sess.OrderBy(x => x.venue).ToList();
            }

            hdn_session_title.Value = s.name;
            hdn_session_description.Value = s.description;
            hdn_session_start.Value = s.start.ToShortDateString();
            hdn_session_start_time.Value = s.start.ToShortTimeString();
            hdn_session_end_time.Value = s.end.ToShortTimeString();
            hdn_session_location.Value = s.venue;
            hdn_speaker_name.Value = s.speakers;
            hdn_current_server_time.Value = DateTime.Now.ToShortTimeString();
            hdn_session_category.Value = s.event_type;

            hdn_next_session_title.Value = next.name;
            hdn_next_session_start_time.Value = next.start.ToShortTimeString();

            o.layout = o.layout.Replace("{REPEATING BLOCK}", "");

            if (o.layout.Contains("repeating_block"))
            {
                multiple = true;

                hdn_multiple.Value = multiple.ToString();

                hdn_multiple_session_title.Value = string.Join(",;", sess.Select(x => x.name).ToList());
                hdn_multiple_session_description.Value = string.Join(",;", sess.Select(x => x.description).ToList());
                hdn_multiple_session_start.Value = string.Join(",;", sess.Select(x => x.start.ToShortDateString()).ToList());
                hdn_multiple_session_start_time.Value = string.Join(",;", sess.Select(x => x.start.ToShortTimeString()).ToList());
                hdn_multiple_session_end_time.Value = string.Join(",;", sess.Select(x => x.end.ToShortTimeString()).ToList());
                hdn_multiple_session_location.Value = string.Join(",;", sess.Select(x => x.venue).ToList());
                hdn_multiple_speaker_name.Value = string.Join(":;", sess.Select(x => x.speakers).ToList());
            }

            regular_overlay.Value = Page.RouteData.Values["overlay_id"] as string;

            if (Page.RouteData.Values["announcement_id"] != null)
            {
                announcement_overlay.Value = Page.RouteData.Values["announcement_id"] as string;
            }

            if (Page.RouteData.Values["end_id"] != null)
            {
                end_of_day_template.Value = Page.RouteData.Values["end_id"] as string;
            }

            ph_content.Controls.Add(new LiteralControl(o.layout));
        }
    }
}