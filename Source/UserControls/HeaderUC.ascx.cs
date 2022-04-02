using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Xml;

namespace ElMestakbal.UserControls
{
    public partial class HeaderUC : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HeadLoginView.Visible = HttpContext.Current.User.Identity.IsAuthenticated;
                if (System.IO.File.Exists(Global.ServerMapPath + "PublicData/Publicities/publicityHeaderTest.jpg"))
                {
                    RadBinaryImagePublicityHeader.Visible = true;
                }
            }
        }

        public string GetDateNow()
        {
            DateTimeFormatInfo dTFormat = new System.Globalization.CultureInfo("ar-DZ", false).DateTimeFormat;
            dTFormat.Calendar = new System.Globalization.HijriCalendar();
            dTFormat.ShortDatePattern = @"dd MMMM yyyy";
            return DateTime.Now.AddHours(8).ToString("dddd dd MMMM yyyy")/* + " م - الموافق لـ " + DateTime.Now.AddHours(8).ToString("d", dTFormat) + " هجري"*/;
        }

        public void IsExist()
        {
            PanelPub.Visible = !string.IsNullOrEmpty(GetPub());
        }

        public string GetPub()
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Global.ServerMapPath + "App_DataPublic\\Publicities\\Config.xml");
            XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/Pub/Header");

            PanelPub.Visible = !string.IsNullOrEmpty(xmlNode.InnerText);
            return xmlNode.InnerText;
        }
    }
}