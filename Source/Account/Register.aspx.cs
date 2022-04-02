using System;
using System.Linq;
using System.Web.Security;
using System.Web.UI.WebControls;
using ElMestakbal.DataModels;
using Telerik.Web.UI;

namespace ElMestakbal.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            NewsDBEntities newsDBEntities = new NewsDBEntities();
            Guid g = (Guid)Membership.GetUser(RegisterUser.UserName).ProviderUserKey;
            var updateUser = (from c in newsDBEntities.aspnet_Users
                              where c.UserId == g select c).First();
            updateUser.FirstName = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("FirstNameTextBox") as TextBox).Text;
            updateUser.LastName  = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("LastNameTextBox") as TextBox).Text;
            updateUser.Gender = !Convert.ToBoolean((RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("GenderRadComboBox") as RadComboBox).SelectedIndex);
            updateUser.BirthDate = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("BirthDateRadDatePicker") as RadDatePicker).SelectedDate;
            updateUser.Address = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("AddressTextBox") as TextBox).Text;
            updateUser.CountryId = (RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("CountryRadComboBox") as RadComboBox).SelectedIndex+1;
            updateUser.Phone = Convert.ToInt64((RegisterUser.CreateUserStep.ContentTemplateContainer.FindControl("phoneRadNumericTextBox") as RadNumericTextBox).Value,null);
            newsDBEntities.SaveChanges();

            //if (String.IsNullOrEmpty(RegisterUser.ContinueDestinationPageUrl))
            //Response.Redirect("~/");
            //else
            //Response.Redirect(RegisterUser.ContinueDestinationPageUrl);
            //  تسجيل الدخول تلقائيا
            //  FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* تذكرني */);
        }
        
    }
}
