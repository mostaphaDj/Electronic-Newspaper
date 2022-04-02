using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.UserControls
{
    public partial class LastNewsV : System.Web.UI.UserControl
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
                if (article.Length > 290)
                {
                    return article.Substring(0, 290);
                }
                else
                    return article;
            }
        }

        public string GetInsertTime()
        {
            return (Eval("InsertDate") as DateTime?).Value.ToShortTimeString();
        }
    }
}