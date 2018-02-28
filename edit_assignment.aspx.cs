using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class edit_assignment : System.Web.UI.Page
    {
        private schedInterface.terminals _terminals = new terminals();
        private schedInterface.templates _templates = new schedInterface.templates();
        private schedInterface.decks _decks = new schedInterface.decks();

        protected void Page_Load(object sender, EventArgs e)
        {
            permissions();

            if (!Page.IsPostBack)
            {
                ddl_template.DataSource = _templates.by_event(Convert.ToInt32(Session["event_id"].ToString()));
                ddl_template.DataValueField = "id";
                ddl_template.DataTextField = "title";
                ddl_template.DataBind();

                ListItem i = new ListItem("Select Template", "0");

                ddl_template.Items.Insert(0, i);

                ddl_template_announce.DataSource = _templates.by_event(Convert.ToInt32(Session["event_id"].ToString()));
                ddl_template_announce.DataValueField = "id";
                ddl_template_announce.DataTextField = "title";
                ddl_template_announce.DataBind();

                ListItem ia = new ListItem("Select Priority Announcement Template", "0");

                ddl_template_announce.Items.Insert(0, ia);

                ddl_template_end.DataSource = _templates.by_event(Convert.ToInt32(Session["event_id"].ToString()));
                ddl_template_end.DataValueField = "id";
                ddl_template_end.DataTextField = "title";
                ddl_template_end.DataBind();

                ListItem ie = new ListItem("Select End of Day Template", "0");

                ddl_template_end.Items.Insert(0, ie);

                ddl_deck.DataSource = _decks.by_event(Convert.ToInt32(Session["event_id"]));
                ddl_deck.DataValueField = "id";
                ddl_deck.DataTextField = "title";
                ddl_deck.DataBind();

                ListItem i2 = new ListItem("Select Slide Deck", "");

                ddl_deck.Items.Insert(0, i2);

                Terminal t = _terminals.single(Convert.ToInt32(Session["event_id"].ToString()), Convert.ToInt32(Page.RouteData.Values["id"] as string));

                title.Text = t.title;

                if (t.template_id > 0)
                {
                    ddl_template.SelectedValue = t.template_id.ToString();
                }
                else
                {
                    ddl_template.SelectedIndex = 0;
                }

                if (t.template_id_announce > 0)
                {
                    ddl_template_announce.SelectedValue = t.template_id_announce.ToString();
                }
                else
                {
                    ddl_template_announce.SelectedIndex = 0;
                }

                if (t.template_id_end > 0)
                {
                    ddl_template_end.SelectedValue = t.template_id_end.ToString();
                }
                else
                {
                    ddl_template_end.SelectedIndex = 0;
                }

                if (t.deck != null)
                {
                    ddl_deck.SelectedValue = t.deck.ToString();
                }

                if (t.rotate != null)
                {
                    ddl_rotate.SelectedValue = t.rotate.ToString();
                }

                ck_all_sessions.Checked = t.all_sessions;
                ck_group_by_location.Checked = t.group_by_location;
                ck_group_by_start.Checked = t.group_by_start;
            }
        }

        protected void update(object sender, EventArgs e)
        {
            Terminal t = _terminals.single(Convert.ToInt32(Session["event_id"].ToString()), Convert.ToInt32(Page.RouteData.Values["id"] as string));

            t.title = title.Text;

            t.template_id = ddl_template.SelectedIndex > 0 ? (int?) Convert.ToInt32(ddl_template.SelectedValue) : null;

            t.deck = ddl_deck.SelectedIndex > 0 ? (int?) Convert.ToInt32(ddl_deck.SelectedValue) : null;

            t.rotate = ddl_rotate.SelectedIndex > 0 ? (int?) Convert.ToInt32(ddl_rotate.SelectedValue) : null;

            t.all_sessions = ck_all_sessions.Checked;
            t.group_by_location = ck_group_by_location.Checked;
            t.group_by_start = ck_group_by_start.Checked;

            if (ddl_template_announce.SelectedIndex > 0)
            {
                t.template_id_announce = Convert.ToInt32(ddl_template_announce.SelectedValue);
            }

            if (ddl_template_end.SelectedIndex > 0)
            {
                t.template_id_end = Convert.ToInt32(ddl_template_end.SelectedValue);
            }

            _terminals.update(t);

            pnl_success.Visible = true;
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
                    security_level.Visible = false;
                    break;
                case "content":
                    security_level.Visible = false;
                    break;
            }
        }
    }
}