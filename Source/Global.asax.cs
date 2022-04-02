using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Xml;
using Telerik.Web.UI;
using System.Drawing.Imaging;
using System.Web.Routing;
using System.Text;
using System.IO;


namespace ElMestakbal
{
    public class Global : System.Web.HttpApplication
    {
        public static string ServerMapPath;
        public static string ResourcesNewsPath;
        public static string ResourcesNewsURL = "/App_DataPublic/News/Resources/";
        public static string PDFURL = "";
        public static string PDFElMaanaURL = "";
        //public static string PDFDjelfaURL = "";

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            ServerMapPath = Server.MapPath("~/");
            ResourcesNewsPath = ServerMapPath + "App_DataPublic\\News\\Resources\\";
            PDFURL = ServerMapPath + "App_DataPublic\\PDF\\";
            PDFElMaanaURL = ServerMapPath + "App_DataPublic\\PDF\\ElMalahik\\ElMaana\\";
            //PDFDjelfaURL = Path.GetDirectoryName(Path.GetDirectoryName((ServerMapPath))) + "djelfa.elmustakbal.com\\wwwroot\\App_DataPublic\\PDF\\";
            RegisterRoutes(RouteTable.Routes);
        }

        public static void RegisterRoutes(RouteCollection routes)
        { 
            RouteTable.Routes.MapPageRoute("News",
                "News/{Id}/{Title}",
                "~/NewsView/News.aspx");
            RouteTable.Routes.MapPageRoute("Group",
                "Group/{GroupId}",
                "~/NewsView/NewsViewListByGroups.aspx");

            RouteTable.Routes.MapPageRoute("جريدة الآن",
                "جريدة الآن" , "~/Public/About.aspx");
            RouteTable.Routes.MapPageRoute("Login",
                "Login", "~/Manage/ControlPanel.aspx");
           
        //routes.MapPageRoute("",
            //    "Category/{action}/{categoryName}",
            //    "~/categoriespage.aspx",
            //    true,
            //    new RouteValueDictionary { { "categoryName", "food" }, { "action", "show" } });
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown
        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started

            // اذا تغير اليوم الى يوم جديد يصفر عدد الزوار اليوم
            
            //if (TodayVisitorsDate != DateTime.Now.AddHours(8).Date)
            //{
            //    TodayVisitorsDate = DateTime.Today;
            //    TodayVisitors = NowVisitors + 13;
            //}
            //TodayVisitors++;
            //NowVisitors = NowVisitors + 1;
            //AllVisitors++;            
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            //NowVisitors = NowVisitors - 1;
        }

        //--------------------------------------- Visitors ------------------------------------------

        //private static int _AllVisitors;
        //public static int AllVisitors
        //{
        //    get
        //    {
        //        if (_AllVisitors == 0)
        //        {
        //            XmlDocument XmlDoc = new XmlDocument();
        //            XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //            XmlNode xmlNodeAllVisitors = XmlDoc.SelectSingleNode("/config/Visitors/AllVisitors");
        //            _AllVisitors = (string.IsNullOrEmpty(xmlNodeAllVisitors.InnerText)) ? 0 : Convert.ToInt32(xmlNodeAllVisitors.InnerText);
        //        }
        //        return _AllVisitors;
        //    }
        //    set
        //    {
        //        _AllVisitors = value;
        //        XmlDocument XmlDoc = new XmlDocument();
        //        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //        XmlNode xmlNodeAllVisitors = XmlDoc.SelectSingleNode("/config/Visitors/AllVisitors");
        //        xmlNodeAllVisitors.InnerText = _AllVisitors.ToString();
        //        xmlNodeAllVisitors.ParentNode.ReplaceChild(xmlNodeAllVisitors, xmlNodeAllVisitors);
        //        XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
        //    }
        //}

        //private static int _TodayVisitors;
        //public static int TodayVisitors
        //{
        //    get
        //    {
        //        if (_TodayVisitors == 0)
        //        {
        //            XmlDocument XmlDoc = new XmlDocument();
        //            XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //            XmlNode xmlNodeTodayVisitors = XmlDoc.SelectSingleNode("/config/Visitors/TodayVisitors");
        //            _TodayVisitors = (string.IsNullOrEmpty(xmlNodeTodayVisitors.InnerText)) ? 0 : Convert.ToInt32(xmlNodeTodayVisitors.InnerText);
        //        }
        //        return _TodayVisitors;
        //    }
        //    set
        //    {
        //        _TodayVisitors = value;
        //        XmlDocument XmlDoc = new XmlDocument();
        //        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //        XmlNode xmlNodeTodayVisitors = XmlDoc.SelectSingleNode("/config/Visitors/TodayVisitors");
        //        xmlNodeTodayVisitors.InnerText = _TodayVisitors.ToString();
        //        xmlNodeTodayVisitors.ParentNode.ReplaceChild(xmlNodeTodayVisitors, xmlNodeTodayVisitors);
        //        XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
        //    }
        //}

        //private static int _NowVisitors;
        //public static int NowVisitors
        //{
        //    get
        //    {
        //        if (_NowVisitors == 0)
        //        {
        //            XmlDocument XmlDoc = new XmlDocument();
        //            XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //            XmlNode xmlNodeNowVisitors = XmlDoc.SelectSingleNode("/config/Visitors/NowVisitors");
        //            _NowVisitors = (string.IsNullOrEmpty(xmlNodeNowVisitors.InnerText)) ? 0 : Convert.ToInt32(xmlNodeNowVisitors.InnerText);
        //        }
        //        return _NowVisitors;
        //    }
        //    set
        //    {
        //        _NowVisitors = value;
        //        XmlDocument XmlDoc = new XmlDocument();
        //        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //        XmlNode xmlNodeNowVisitors = XmlDoc.SelectSingleNode("/config/Visitors/NowVisitors");
        //        xmlNodeNowVisitors.InnerText = _NowVisitors.ToString();
        //        xmlNodeNowVisitors.ParentNode.ReplaceChild(xmlNodeNowVisitors, xmlNodeNowVisitors);
        //        XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
        //    }
        //}

        //private static DateTime? _TodayVisitorsDate;
        //// من
        //public static DateTime? TodayVisitorsDate
        //{
        //    get
        //    {
        //        if (AutoPublishing)
        //            return DateTime.Today;
        //        else
        //        {
        //            if (_TodayVisitorsDate == null)
        //            {
        //                XmlDocument XmlDoc = new XmlDocument();
        //                XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //                XmlNode xmlNodeTodayVisitorsDate = XmlDoc.SelectSingleNode("/config/Visitors/TodayVisitorsDate");
        //                _TodayVisitorsDate = (string.IsNullOrEmpty(xmlNodeTodayVisitorsDate.InnerText)) ? null : (DateTime?)DateTime.ParseExact(xmlNodeTodayVisitorsDate.InnerText, "s", new System.Globalization.CultureInfo("en-US"));
        //            }
        //            return _TodayVisitorsDate;
        //        }
        //    }
        //    set
        //    {
        //        _TodayVisitorsDate = value ?? DateTime.Today;
        //        XmlDocument XmlDoc = new XmlDocument();
        //        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

        //        XmlNode xmlNodeTodayVisitorsDate = XmlDoc.SelectSingleNode("/config/Visitors/TodayVisitorsDate");
        //        xmlNodeTodayVisitorsDate.InnerText = (_TodayVisitorsDate.HasValue) ? _TodayVisitorsDate.Value.ToString("s") : string.Empty;
        //        xmlNodeTodayVisitorsDate.ParentNode.ReplaceChild(xmlNodeTodayVisitorsDate, xmlNodeTodayVisitorsDate);
        //        XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
        //    }
        //}

//----------------------------------------------------------------------------------------------------------------------

        public static byte[] ImageSizing(string imageName)
        {
            //radBinaryImage.DataBind(); اذا استدعية من دون ربط بيانتات
            using (System.Drawing.Image image = System.Drawing.Image.FromFile(imageName))
            {
                using (var stream = new System.IO.MemoryStream())
                {
                    image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    return stream.ToArray();
                }
            }
        }

        // ------------------------------------ الفيديو ---------------------------------------------

        private static string _Video;
        public static string Video
        {
            get
            {
                    if (_Video == null)
                    {
                        XmlDocument XmlDoc = new XmlDocument();
                        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                        XmlNode xmlNodeVideo = XmlDoc.SelectSingleNode("/config/Views/Video");
                        _Video = (string.IsNullOrEmpty(xmlNodeVideo.InnerText)) ? "" : xmlNodeVideo.InnerText;
                    }
                    return _Video;
            }
            set
            {
                _Video = value ;
                XmlDocument XmlDoc = new XmlDocument();
                XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                XmlNode xmlNodeVideo = XmlDoc.SelectSingleNode("/config/Views/Video");
                xmlNodeVideo.InnerText = _Video;
                xmlNodeVideo.ParentNode.ReplaceChild(xmlNodeVideo, xmlNodeVideo);
                XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
            }
        }

        private static string _VideoTitle;
        public static string VideoTitle
        {
            get
            {
                if (_VideoTitle == null)
                {
                    XmlDocument XmlDoc = new XmlDocument();
                    XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                    XmlNode xmlNodeVideoTitle = XmlDoc.SelectSingleNode("/config/Views/VideoTitle");
                    _VideoTitle = (string.IsNullOrEmpty(xmlNodeVideoTitle.InnerText)) ? "" : xmlNodeVideoTitle.InnerText;
                }
                return _VideoTitle;
            }
            set
            {
                _VideoTitle = value;
                XmlDocument XmlDoc = new XmlDocument();
                XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                XmlNode xmlNodeVideoTitle = XmlDoc.SelectSingleNode("/config/Views/VideoTitle");
                xmlNodeVideoTitle.InnerText = _VideoTitle;
                xmlNodeVideoTitle.ParentNode.ReplaceChild(xmlNodeVideoTitle, xmlNodeVideoTitle);
                XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
            }
        }

        private static DateTime? _ToDate;
        // الى
        public static DateTime? ToDate
        {
            get
            {
                    if (_ToDate == null)
                    {
                        XmlDocument XmlDoc = new XmlDocument();
                        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                        XmlNode xmlNodeToDate = XmlDoc.SelectSingleNode("/config/PublishingField/ToDate");
                        _ToDate = (string.IsNullOrEmpty(xmlNodeToDate.InnerText)) ? null : (DateTime?)DateTime.ParseExact(xmlNodeToDate.InnerText, "s", new System.Globalization.CultureInfo("en-US"));
                    }
                    return _ToDate;
            }
            set
            {
                _ToDate = value;
                XmlDocument XmlDoc = new XmlDocument();
                XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                XmlNode xmlNodeToDate = XmlDoc.SelectSingleNode("/config/PublishingField/ToDate");
                xmlNodeToDate.InnerText = (_ToDate.HasValue) ? _ToDate.Value.ToString("s") : string.Empty; 
                xmlNodeToDate.ParentNode.ReplaceChild(xmlNodeToDate, xmlNodeToDate);
                XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
            }
        }

        private static DateTime? _EndDate;
        // الى
        public static DateTime? EndDate
        {
            get
            {
                //if (AutoPublishing)
                //    return DateTime.Today.AddDays(1);
                //else
                //{
                    if (_EndDate == null)
                    {
                        XmlDocument XmlDoc = new XmlDocument();
                        XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                        XmlNode xmlNodeEndDate = XmlDoc.SelectSingleNode("/config/PublishingField/EndDate");
                        _EndDate = (string.IsNullOrEmpty(xmlNodeEndDate.InnerText)) ? null : (DateTime?)DateTime.ParseExact(xmlNodeEndDate.InnerText, "s", new System.Globalization.CultureInfo("en-US"));
                    }
                    return _EndDate;
                //}
            }
            set
            {
                _EndDate = value;
                XmlDocument XmlDoc = new XmlDocument();
                XmlDoc.Load(ServerMapPath + "App_Data\\Config.xml");

                XmlNode xmlNodeEndDate = XmlDoc.SelectSingleNode("/config/PublishingField/EndDate");
                xmlNodeEndDate.InnerText = (_EndDate.HasValue) ? _EndDate.Value.ToString("s") : string.Empty;
                xmlNodeEndDate.ParentNode.ReplaceChild(xmlNodeEndDate, xmlNodeEndDate);
                XmlDoc.Save(ServerMapPath + "App_Data\\Config.xml");
            }
        }

        private readonly static string reservedCharacters = " ;:.,\"'#@&$!?%/\\+*=<>()[]";

        private static string TitleToUrl(string value)
        {
          
            if (String.IsNullOrEmpty(value))
                return String.Empty;

            StringBuilder sb = new StringBuilder();

            foreach (char @char in value)
            {
                if (reservedCharacters.IndexOf(@char) == -1)
                    sb.Append(@char);
                else
                    if ((@char == ' ') || (@char == ':') || (@char == '.') || (@char == '"'))
                        sb.Append('_');
                    else
                        sb.AppendFormat("%{0:X2}", (int)@char);
            }
            return sb.ToString();
        }

        // ---------------------------------------------------------------------------------

        public static string StripHTML(string source, int count = 0)
        {
            char[] array = new char[source.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; (i < source.Length) && ((count == 0) || (arrayIndex < count)); i++)
            {
                char let = source[i];
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }

        public static string GetNewsURL(object newsId, object newsTitle)
        {
            return "/News/" + newsId.ToString() + "/" + TitleToUrl((string)newsTitle);
        }

        // عرض المقدمة اذا وجد واذا لم توجد استخراج جزء من المقالة
        public static string GetShortIntroduction(DataModels.News news)
        {
            if ((news.Introduction != null) && (news.Introduction.Length > 20))
            {
                return news.Introduction;
            }
            else
            {
                string article = news.ArticleText;
                if (article.Length > 120)
                {
                    return article.Substring(0, 120);
                }
                else
                    return article;
            }
        }

    }
}