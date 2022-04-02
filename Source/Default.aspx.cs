using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ElMestakbal
{
    public partial class Default : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                

                if (System.IO.File.Exists(Global.ServerMapPath + "PublicData/Publicities/publicityHeader.jpg"))
                {

                    RadBinaryImagePublicityHeader.Visible = true;
                }
            }
        }

 
    }
}