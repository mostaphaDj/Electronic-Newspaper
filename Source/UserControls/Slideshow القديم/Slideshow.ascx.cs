using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.UserControls
{
    public partial class Slideshow : System.Web.UI.UserControl
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
                if (article.Length > 200)
                {
                    return article.Substring(0, 200);
                }
                else
                    return article;
            }
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

        //public string Getaaa()
        //{
        //    return "(it.PlaceId == 3) && " + Global.GetLinq();
        //    // النتيجة النهائية بهذا الشكل
        //    // (it.GroupId == 1) && (it.PlaceId == 1) && (it.Active == true)  
        //    // && (((it.PublishDate >= DATETIME '2012-05-19 00:00') && (it.EndPublishDate IS NULL)) 
        //    // || ((it.PublishDate >= DATETIME '2012-05-19 00:00') && (it.EndPublishDate <= DATETIME '2012-05-24 00:00')))
        //}


    }
}