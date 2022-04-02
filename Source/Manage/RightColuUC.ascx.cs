using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage
{
    public partial class RightColuUC : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //Roles.IsUserInRole("Account management");
                var RadPanelItemPersonalAccounts = RadPanelBar1.FindItemByValue("RadPanelItemPersonalAccounts");
                RadPanelItemPersonalAccounts.Visible = HttpContext.Current.User.IsInRole("Manage");
            }
        }
    }
}