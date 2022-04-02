using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.News
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            //    var s = Page.RouteData.Values["Title"];
            //    if (!string.IsNullOrEmpty((string)Page.RouteData.Values["Title"]))
            //    {
            //        EntityDataSource1.Where = "it.[Title] == \"" + Global.URLToTitle((string)Page.RouteData.Values["Title"]) + "\"";
            //        EntityDataSource1.DataBind();
            //    }
            //    else
            //    {
            //        EntityDataSource1.Where = "(it.[Title] == \"aaa\" )";
            //    }
            //}
            
            if (!Page.IsPostBack)
            {
                var s = Page.RouteData.Values["Id"];
                if (!string.IsNullOrEmpty((string)Page.RouteData.Values["Id"]))
                {
                    EntityDataSource1.Where = "it.[Id] == " + (string)Page.RouteData.Values["Id"];
                    EntityDataSource1.DataBind();
                }
                else
                {
                    EntityDataSource1.Where = "(it.[Id] == -1 )";
                }

                
               RadSocialShare1.UrlToShare =  GetURL() ;
            }
        }

        public System.Web.UI.WebControls.FormViewMode DefaultMode
        {
            get
            {
                return this.FormView1.DefaultMode;
            }
            set
            {
                this.FormView1.DefaultMode = value;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            FormView1.EnableDynamicData(typeof(DataModels.News));
            
        }

        public string GetURL()
        {
            return Page.Request.Url.OriginalString;
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            FormView1.DeleteItem();
            Response.Redirect("http://elaane.com/");
        }
    }
}