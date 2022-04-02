using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.Accounts
{
    public partial class ModifyPersonalAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserID"] = Membership.GetUser().ProviderUserKey;
        }
    }
}