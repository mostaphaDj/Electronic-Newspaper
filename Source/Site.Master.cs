using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ElMestakbal
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var host = HttpContext.Current.Request.Url.Host;

                if (!((host.IndexOf("localhost") != -1) || (host.IndexOf("elaane.com") != -1) || (host.IndexOf("elmustakbal.com") != -1) || (host.IndexOf("elmustakbal.net") != -1) || (host.IndexOf("elmustakbal.info") != -1)))
                    Response.Redirect("DefaultError.aspx");
            }
        }
    }
}
