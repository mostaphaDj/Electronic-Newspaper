using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.News
{
    public partial class BreakingNews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = (string)Application["BreakingNews"];
                RadTimePicker1.SelectedDate = (DateTime)(Application["BreakingNewsRemove"] ?? DateTime.Now);

                Panel1.Visible = TextBox1.Text == "";
                Button2.Visible = !Panel1.Visible;

                RadTimePicker1.MinDate = DateTime.Now;
                RadTimePicker1.MaxDate = DateTime.Now.AddDays(1);
                RadTimePicker1.SelectedDate = DateTime.Now.AddHours(1);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Application["BreakingNews"] = TextBox1.Text;
            Application["BreakingNewsRemove"] = RadTimePicker1.SelectedDate;
            Panel1.Visible = false;
            Button2.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Text = (string)Application["BreakingNews"];
            RadTimePicker1.SelectedDate = (DateTime)(Application["BreakingNewsRemove"]?? DateTime.Now);

            Application["BreakingNewsRemove"] = null;
            Application["BreakingNews"] = null;
            Panel1.Visible = true;
            Button2.Visible = false;
        }
    }
}