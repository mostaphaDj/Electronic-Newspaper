using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ElMestakbal.DataModels;
using Telerik.Web.UI;

namespace ElMestakbal.Manage.Accounts
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //public static void ClearForm(System.Web.UI.Control parent)
        //{
        //    foreach (System.Web.UI.Control ctrControl in parent.Controls)
        //    {
        //        //Loop through all controls 
        //        if (object.ReferenceEquals(ctrControl.GetType(), typeof(IEditableTextControl)))
        //        {
        //            //Kyk of dit textbox is
        //            //as dit is maak die textbox empty
        //            ((IEditableTextControl)ctrControl).Text = string.Empty;
        //        }
        //    }
        //}

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            using (NewsDBEntities newsDBEntities = new NewsDBEntities())
            {
                Guid g = (Guid)Membership.GetUser(RegisterUser.UserName).ProviderUserKey;
                var updateUser = (from c in newsDBEntities.aspnet_Users
                                  where c.UserId == g
                                  select c).First();
                updateUser.FirstName = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox") as TextBox).Text;
                updateUser.LastName = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox") as TextBox).Text;
                //updateUser.Gender = !Convert.ToBoolean((RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("GenderRadComboBox") as RadComboBox).SelectedIndex);
                //updateUser.BirthDate = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("BirthDateRadDatePicker") as RadDatePicker).SelectedDate;
                //updateUser.Address = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox") as TextBox).Text;
                //updateUser.CountryId = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("CountryRadComboBox") as RadComboBox).SelectedIndex + 1;
                //updateUser.Phone = Convert.ToInt64((RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("phoneRadNumericTextBox") as RadNumericTextBox).Value, null);
                newsDBEntities.SaveChanges();
            }
            Boolean b = Roles.IsUserInRole(RegisterUser.UserName, "Author");
            if (!Roles.IsUserInRole(RegisterUser.UserName,"Author"))
            {
                Roles.AddUserToRole(RegisterUser.UserName,"Author");
            }
        }
    }
}