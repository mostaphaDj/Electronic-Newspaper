using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.News
{
    public partial class ChangeVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox1.Text = Global.VideoTitle;
                TextBox2.Text = Global.Video;
            }
        }

        public static string GetStringInBetween(string strBegin, string strEnd, string strSource, bool includeBegin = false, bool includeEnd = false)
        {
            string[] result = { string.Empty, string.Empty };
            int iIndexOfBegin = strSource.IndexOf(strBegin);

            if (iIndexOfBegin != -1)
            {
                // include the Begin string if desired 
                if (includeBegin)
                    iIndexOfBegin -= strBegin.Length;

                strSource = strSource.Substring(iIndexOfBegin + strBegin.Length);

                int iEnd = strSource.IndexOf(strEnd);
                if (iEnd != -1)
                {
                    // include the End string if desired 
                    if (includeEnd)
                        iEnd += strEnd.Length;
                    result[0] = strSource.Substring(0, iEnd);
                    // advance beyond this segment 
                    if (iEnd + strEnd.Length < strSource.Length)
                        result[1] = strSource.Substring(iEnd + strEnd.Length);
                }
                else
                {
                    result[0] = strSource;
                }
            }
            else
                // stay where we are 
                result[1] = strSource;
            return result[0];
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Global.VideoTitle = TextBox1.Text;
            Global.Video = "//www.youtube.com/embed/"+ GetStringInBetween(@"/watch?v=", "&", TextBox2.Text);
        }
    }
}