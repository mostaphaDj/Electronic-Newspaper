using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.NewsView
{
    public partial class NewsViewListByGroups : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int i;
                if ((!string.IsNullOrEmpty((string)Page.RouteData.Values["GroupId"])) && (int.TryParse((string)Page.RouteData.Values["GroupId"], out i)))
                {
                    EntityDataSource1.Where = "(it.GroupId == " + Page.RouteData.Values["groupId"] + ") && " + "(it.PlaceId == 1) && (it.Active == true)" ;
                    // النتيجة النهائية بهذا الشكل
                    // (it.GroupId == 1) && (it.PlaceId == 1) && (it.Active == true)  
                    // && (((it.PublishDate >= DATETIME '2012-05-19 00:00') && (it.EndPublishDate IS NULL)) 
                    // || ((it.PublishDate >= DATETIME '2012-05-19 00:00') && (it.EndPublishDate <= DATETIME '2012-05-24 00:00')))                    
                }
                else
                {
                    EntityDataSource1.Where = "(it.[GroupId] == -1)";
                }
            }
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
                if (article.Length > 290)
                {
                    return article.Substring(0, 290);
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

        protected void EntityDataSource1_Selecting(object sender, EntityDataSourceSelectingEventArgs e)
        {
            e.SelectArguments.MaximumRows = 20;
        }
    }
}