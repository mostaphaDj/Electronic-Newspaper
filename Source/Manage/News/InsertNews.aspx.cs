using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ElMestakbal.Manage.News
{
    public partial class InsertNews1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            DetailsView1.EnableDynamicData(typeof(DataModels.News));
        }


        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            if ((e.CommandName == "Cancel") && (DetailsView1.CurrentMode == DetailsViewMode.Insert) && (Session["NewDirectoryName"] != null))
            {
                System.IO.Directory.Delete(Global.ResourcesNewsPath + (string)Session["NewDirectoryName"], true);
                Session["NewDirectoryName"] = null;
            }
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Server.MapPath("~/App_Data/Config.xml"));
            XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/OldDirectory/Name");

            xmlNode.InnerText = "";
            xmlNode.ParentNode.ReplaceChild(xmlNode, xmlNode);
            XmlDoc.Save(Server.MapPath("~/App_Data/Config.xml"));
        }


        protected void DetailsView1_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            if (Session["NewDirectoryName"] != null)
            {
                System.IO.Directory.Delete(Global.ResourcesNewsPath + (string)Session["NewDirectoryName"], true);
                Session["NewDirectoryName"] = null;
            }
        }
    }
}