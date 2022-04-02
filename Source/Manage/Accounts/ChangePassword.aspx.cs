using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.Accounts
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MembershipUser mu = Membership.GetUser(true);
            if (Membership.ValidateUser(mu.UserName,TextBox1.Text))
            {
               bool b = mu.ChangePassword(mu.ResetPassword(),TextBox2.Text);                
            }
        }
    }
}