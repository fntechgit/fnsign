using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using schedInterface;

namespace fnsignManager
{
    public partial class forgot : System.Web.UI.Page
    {
        #region declarations

        private schedInterface.users _users = new schedInterface.users();
        private schedInterface.permissions _permissions = new schedInterface.permissions();
        private schedInterface.email _email = new schedInterface.email();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin(object sender, EventArgs e)
        {
            User u = _users.by_email(email.Text);

            if (u.id > 0)
            {
                // you got it right
                _email.forgot_password(u);

                pnl_success.Visible = true;
            }
            else
            {
                pnl_failure.Visible = true;
            }
        }
    }
}