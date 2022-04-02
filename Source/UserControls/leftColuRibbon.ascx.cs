using System;
using System.Linq;
using System.Xml;

namespace ElMestakbal.UserControls
{
    public partial class leftColuRibbon : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

        // عرض المقدمة اذا وجد واذا لم توجد استخراج جزء من المقالة
        public string GetIntroduction()
        {
            if ((Eval("Introduction") != null) && (Eval("Introduction") as string).Length > 20)
            {
                return (string)Eval("Introduction");
            }
            else
            {
                string article = (string)Eval("ArticleText");
                if (article.Length > 280)
                {
                    return article.Substring(0, 280);
                }
                else
                    return article;
            }
        }

        // عرض المقدمة اذا وجد واذا لم توجد استخراج جزء من المقالة
        public string GetShortIntroduction()
        {
            if ((Eval("Introduction") != null) && (Eval("Introduction") as string).Length > 20)
            {
                return (string)Eval("Introduction");
            }
            else
            {
                string article = (string)Eval("ArticleText");
                if (article.Length > 120)
                {
                    return article.Substring(0, 120);
                }
                else
                    return article;
            }
        }

        public bool IsImageExists()
        {
            string Path = Global.ResourcesNewsPath + (string)Eval("DirectoryName") + "/" + (string)Eval("MainImage");
            return System.IO.File.Exists(Path);
        }

        public byte[] GetImage()
        {
            string Path = Global.ResourcesNewsPath + (string)Eval("DirectoryName") + "/" + (string)Eval("MainImage");
            if (System.IO.File.Exists(Path))
            {
                return Global.ImageSizing(Path);
            }
            return null;
        }

        public void IsExist()
        {
            PanelPub.Visible = !string.IsNullOrEmpty(GetPub());
        }

        public string GetPub()
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Global.ServerMapPath + "App_DataPublic\\Publicities\\Config.xml");
            XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/Pub/leftColuRibbon");
            return xmlNode.InnerText;
        }

    }
}