using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace ElMestakbal.Manage.Accounts
{
    public partial class ModifyUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "_Delete_User_")
            {
                GridDataItem gridDataItem = (GridDataItem)e.Item;
                TableCell cell_data = gridDataItem["UserName"];
                System.Web.Security.Membership.DeleteUser(cell_data.Text);
                RadGrid1.Rebind();
            }

            //TextBox Textbox_Item = cell_data.FindControl("Textbox_Item") as TextBox;

            //int dataid =
            // (int)RadGrid1.MasterTableView.Items[(e.Item.DataSetIndex % RadGrid1.PageSize)].GetDataKeyValue("DataID");

        }

        protected void RadGrid1_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            GridEditFormItem gridEditFormItem = (GridEditFormItem)e.Item;
            
            TextBox passwordTextBox = (TextBox)(gridEditFormItem["TemplateColumnPassword"].FindControl("passwordTextBox"));
            if (passwordTextBox.Text != string.Empty)
            {
                MembershipUser mu = Membership.GetUser(((TextBox)gridEditFormItem["UserName"].Controls[0]).Text);
                mu.ChangePassword(mu.ResetPassword(), passwordTextBox.Text);
            }
        }
    }
}