using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Columns
{
    public partial class Tell : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ElMestakbal.DataModels.NewsDBEntities newsDBEntities = new ElMestakbal.DataModels.NewsDBEntities())
                {
                    var news = (from e1 in newsDBEntities.News
                                where e1.PlaceId == 12 // قلها وتوكل
                                orderby e1.PublishDate descending
                                select e1).First();

                    HyperLinkTitle.Text = news.Title;
                    HyperLinkTitle.NavigateUrl = news.URL;
                    //HyperLinkImage.NavigateUrl = news.URL;
                    //HyperLinkMoreURL.NavigateUrl = news.URL;
                    //LabelShortIntroduction.Text = Global.GetShortIntroduction(news);

                    //string Path = Global.ResourcesDirectoryPath + news.DirectoryName + "/" + news.MainImage;
                    //if (System.IO.File.Exists(Path))
                    //    RadBinaryImage2.DataValue = Global.ImageSizing(Path);
                    //else
                    //    PanelImage.Visible = false;
                }
            }
        }
    }
}