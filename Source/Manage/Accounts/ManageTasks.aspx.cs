using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.Accounts
{
    public partial class ManageTasks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //CheckBoxList1.Items[0].Selected = !CheckBoxList1.Items[0].Selected;
            //CheckBoxList1.Items[1].Selected = !CheckBoxList1.Items[1].Selected;    
        }

        protected void RadGrid1_ItemDeleted(object sender, Telerik.Web.UI.GridDeletedEventArgs e)
        {

        }
    }
}