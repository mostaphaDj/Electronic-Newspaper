using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ElMestakbal.UserControls
{
    public partial class leftColu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public string  GetVideo()
        {
            return Global.Video;
        }

        public void IsExist()
        {
            PanelPub.Visible = !string.IsNullOrEmpty(GetPub());
        }

        public string GetPub()
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Global.ServerMapPath + "App_DataPublic\\Publicities\\Config.xml");
            XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/Pub/leftColu");
            PanelPub.Visible = !string.IsNullOrEmpty(xmlNode.InnerText);
            return xmlNode.InnerText;
        }
    }
}