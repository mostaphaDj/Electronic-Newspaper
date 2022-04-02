using System;
using System.Linq;


namespace ElMestakbal.Columns
{
    public partial class Down : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (ElMestakbal.DataModels.NewsDBEntities newsDBEntities = new ElMestakbal.DataModels.NewsDBEntities())
                {
                    var news = (from e1 in newsDBEntities.News
                                where e1.PlaceId == 8 // هابط
                                orderby e1.InsertDate descending
                                select e1).First();

                    HyperLinkTitle.Text = news.Title;
                    HyperLinkLogo.NavigateUrl = news.URL;
                    HyperLinkTitle.NavigateUrl = news.URL;
                    HyperLinkImage.NavigateUrl = news.URL;
                    //HyperLinkMoreURL.NavigateUrl = news.URL;
                    //LabelShortIntroduction.Text = Global.GetShortIntroduction(news);

                    string Path = Global.ResourcesNewsPath + news.DirectoryName + "/" + news.MainImage;
                    if (System.IO.File.Exists(Path))
                        RadBinaryImage2.DataValue = Global.ImageSizing(Path);
                }
            }
        }
    }
}