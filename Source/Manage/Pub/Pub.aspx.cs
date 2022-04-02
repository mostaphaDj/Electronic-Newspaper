using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace ElMestakbal.Manage.Pub
{
    public partial class Pub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                XmlDocument XmlDoc = new XmlDocument();
                XmlDoc.Load(Global.ServerMapPath + "App_DataPublic\\Publicities\\Config.xml");

                XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/Pub/Header");
                TextBox1.Text = (string.IsNullOrEmpty(xmlNode.InnerText)) ? "" : xmlNode.InnerText;

                xmlNode = XmlDoc.SelectSingleNode("/config/Pub/leftColuRibbon");
                TextBox2.Text = (string.IsNullOrEmpty(xmlNode.InnerText)) ? "" : xmlNode.InnerText;

                xmlNode = XmlDoc.SelectSingleNode("/config/Pub/leftColu");
                TextBox3.Text = (string.IsNullOrEmpty(xmlNode.InnerText)) ? "" : xmlNode.InnerText;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1Changed)
            {
                SaveInPupXML("/config/Pub/Header", TextBox1.Text);
            }
            if (TextBox2Changed)
            {
                SaveInPupXML("/config/Pub/leftColuRibbon", TextBox2.Text);
            }
            if (TextBox3Changed)
            {
                SaveInPupXML("/config/Pub/leftColu", TextBox3.Text);
            }
        }

        private void SaveInPupXML(string node,string val)
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Global.ServerMapPath + "App_DataPublic\\Publicities\\Config.xml");
            XmlNode xmlNode = XmlDoc.SelectSingleNode(node);
            xmlNode.InnerText = val;
            xmlNode.ParentNode.ReplaceChild(xmlNode, xmlNode);
            XmlDoc.Save(Global.ServerMapPath + "App_DataPublic\\Publicities\\Config.xml");
        }

        bool TextBox1Changed, TextBox2Changed, TextBox3Changed;

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox1Changed = true;
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            TextBox2Changed = true;
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            TextBox3Changed = true;
        }
    }
}