using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class event_monitors : System.Web.UI.Page
    {
        private schedInterface.users _users = new schedInterface.users();
        private schedInterface.events _events = new schedInterface.events();
        private schedInterface.notify _notify = new schedInterface.notify();

        public Event ev = new Event();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddl_users.DataSource = _users.get_all();
                ddl_users.DataValueField = "id";
                ddl_users.DataTextField = "ddl_value";
                ddl_users.DataBind();

                ListItem iu = new ListItem("Select User to Make a Monitor", "0");

                ddl_users.Items.Insert(0, iu);

                
            }

            ev = _events.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            permissions();


            string is_active = "ACTIVE";

            foreach (User u in _notify.users_notify_for_event(ev.id))
            {
                is_active = u.active ? "ACTIVE" : "INACTIVE";

                ph_users.Controls.Add(new LiteralControl("<tr><td data-title=\"Avatar\"><figure class=\"profile-picture\"><img src=\"/uploads/" + u.picture + "\" alt=\"" + u.first_name + " " + u.last_name + "\" class=\"img-circle\" width=\"35\" /></figure></td><td data-title=\"Full Name\">" + u.first_name + " " + u.last_name + "</td><td data-title=\"Email\">" + u.email + "</td><td data-title=\"Company\">" + u.company + "</td><td data-title=\"Active\" class=\"hidden-xs hidden-sm\">" + is_active + "</td><td data-title=\"Created\" class=\"hidden-xs hidden-sm\">" + u.created.ToShortDateString() + " @ " + u.created.ToShortTimeString() + "</td><td data-title=\"Phone\" class=\"hidden-xs hidden-sm\">" + u.mobile + " mins</td><td data-title=\"Actions\"><a href=\"/users/edit/" + u.id + "\"><i class=\"fa fa-edit\"></i></a> <a href=\"/events/" + ev.id + "/monitors/delete/" + u.id + "\"><i class=\"fa fa-trash-o\"></i></a></td></tr>"));
            }



        }

        private void permissions()
        {
            if (string.IsNullOrEmpty(Session["event_id"] as string))
            {
                Response.Redirect("/login");
            }

            if (string.IsNullOrEmpty(Session["user_access"] as string))
            {
                Response.Redirect("/login");
            }
            else
            {
                check_levels(Session["user_access"] as string);
            }
        }

        protected void add_monitor(object sender, EventArgs e)
        {
            if (ddl_users.SelectedIndex > 0)
            {
                EventNotifyUser enu = new EventNotifyUser();

                enu.after = 10;
                enu.event_Id = ev.id;
                enu.user_id = Convert.ToInt32(ddl_users.SelectedValue);

                _notify.add_notify_user(enu);
            }

            ph_users.Controls.Clear();

            string is_active = "ACTIVE";

            foreach (User u in _notify.users_notify_for_event(ev.id))
            {
                is_active = u.active ? "ACTIVE" : "INACTIVE";

                ph_users.Controls.Add(new LiteralControl("<tr><td data-title=\"Avatar\"><figure class=\"profile-picture\"><img src=\"/uploads/" + u.picture + "\" alt=\"" + u.first_name + " " + u.last_name + "\" class=\"img-circle\" width=\"35\" /></figure></td><td data-title=\"Full Name\">" + u.first_name + " " + u.last_name + "</td><td data-title=\"Email\">" + u.email + "</td><td data-title=\"Company\">" + u.company + "</td><td data-title=\"Active\" class=\"hidden-xs hidden-sm\">" + is_active + "</td><td data-title=\"Created\" class=\"hidden-xs hidden-sm\">" + u.created.ToShortDateString() + " @ " + u.created.ToShortTimeString() + "</td><td data-title=\"Mobile\" class=\"hidden-xs hidden-sm\">" + u.mobile + "</td><td data-title=\"Actions\"><a href=\"/users/edit/" + u.id + "\"><i class=\"fa fa-edit\"></i></a> <a href=\"/events/" + ev.id + "/monitors/delete/" + u.id + "\"><i class=\"fa fa-trash-o\"></i></a></td></tr>"));
            }
        }

        private void check_levels(string user_level)
        {
            switch (user_level)
            {
                case "system":
                    event_link.Visible = true;
                    display_link.Visible = true;
                    user_link.Visible = true;
                    preference_link.Visible = true;
                    break;
                case "event":
                    display_link.Visible = true;
                    preference_link.Visible = true;
                    break;
                case "content":
                    break;
            }
        }
    }
}