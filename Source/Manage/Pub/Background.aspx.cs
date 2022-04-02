using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.Pub
{
    public partial class Background : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelDelete.Visible = File.Exists(Global.ServerMapPath + "App_DataPublic\\Background\\Background.jpg");
            PanelUpload.Visible = !PanelDelete.Visible;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
        }

        protected void ButtonUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                FileUpload1.PostedFile.SaveAs(Global.ServerMapPath + "App_DataPublic\\Background\\Background.jpg");

            }
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            File.Delete(Global.ServerMapPath + "App_DataPublic\\Background\\Background.jpg");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            File.Copy(Global.ServerMapPath + "App_DataPublic\\Background\\Background_Ramadan.jpg", Global.ServerMapPath + "App_DataPublic\\Background\\Background.jpg", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            File.Copy(Global.ServerMapPath + "App_DataPublic\\Background\\Background_Aiid.jpg", Global.ServerMapPath + "App_DataPublic\\Background\\Background.jpg", true);
        }
    }
}