using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.UserControls
{
    public partial class SlideshowImages : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetPhoto();
        }

        public byte[] GetImage()
        {
            string Path = Page.GetDataItem().ToString();
            if (System.IO.File.Exists(Path))
            {
                return Global.ImageSizing(Path);
            }
            return null;
        }

        Boolean b = true;

        private void GetPhoto()
        {
            if (b)
            {
                if (System.IO.Directory.Exists(Server.MapPath("~/AApp_DataPublic/Photo Gallery/")))
                {
                    try
                    {
                        Repeater1.DataSource = System.IO.Directory.GetFiles(Server.MapPath("~/App_DataPublic/Photo Gallery/"), "*.jpg");
                        Repeater1.DataBind();
                    }
                    catch (Exception)
                    {
                    }
                    b = false;
                }
            }
        }
    }
}