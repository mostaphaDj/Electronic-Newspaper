using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.UserControls
{
    public partial class TopContentPlace : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetIntroduction()
        {
            if ((Eval("Introduction") != null) && (Eval("Introduction") as string).Length > 20)
            {
                return (string)Eval("Introduction");
            }
            else
            {
                string article = (string)Eval("ArticleText");
                if (article.Length > 230)
                {
                    return article.Substring(0, 230);
                }
                else
                    return article;
            }
        }

        public Boolean IsExist()
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

        public int _NumberItem = 0;

        public int GetNumberItem()
        {
            _NumberItem++;
            return _NumberItem;
        }
    }
}