using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class sublocations : System.Web.UI.Page
    {
        private schedInterface.locations _locations = new schedInterface.locations();
        private schedInterface.sublocations _sublocations = new schedInterface.sublocations();

        public Location l;

        protected void Page_Load(object sender, EventArgs e)
        {
            l = _locations.single(Convert.ToInt32(Page.RouteData.Values["id"] as string));

            if (!Page.IsPostBack)
            {
                ddl_users.DataSource = _locations.by_event(Convert.ToInt32(Session["event_id"] as string));
                ddl_users.DataValueField = "id";
                ddl_users.DataTextField = "title";
                ddl_users.DataBind();

                ListItem i = new ListItem("Select Location to Add", "0");

                ddl_users.Items.Insert(0, i);

                render_sublocations(l.id);
            }
        }

        protected void add_sublocation(object sender, EventArgs e)
        {
            SubLocation sub = new SubLocation();

            sub.child = Convert.ToInt32(ddl_users.SelectedValue);
            sub.parent = l.id;

            _sublocations.add(sub);

            render_sublocations(l.id);
        }

        private void render_sublocations(Int32 id)
        {
            foreach (SubLocation s in _sublocations.children_display(id))
            {
                ph_users.Controls.Add(new LiteralControl("<tr><td data-title=\"Location\">" + s.child_title + "</td><td data-title=\"Actions\"><a href=\"/sublocations/delete/" + s.id + "\"><i class=\"fa fa-trash-o\"></i></a></td></tr>"));
            }
        }
    }
}