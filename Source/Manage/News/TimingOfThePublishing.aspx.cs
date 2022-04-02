using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ElMestakbal.Manage.News
{
    public partial class TimingOfThePublishing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsUserControlPostBack)
            {
                ViewState["IsUserControlPostBack"] = true;
                RadDateTimePicker2.SelectedDate = Global.ToDate;
            }
        }

        protected bool IsUserControlPostBack
        {
            get
            {
                return this.ViewState["IsUserControlPostBack"] != null;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            RadDateTimePicker2.SelectedDate = DateTime.Today.AddDays(1).AddMinutes(-1);
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            RadDateTimePicker2.SelectedDate = DateTime.Today.AddDays(2).AddMinutes(-1);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            RadDateTimePicker2.SelectedDate = null;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Global.ToDate = RadDateTimePicker2.SelectedDate;
        }
    }
}