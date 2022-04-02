using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;

namespace ElMestakbal.DynamicData.FieldTemplates
{
    public partial class AuthorString_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadTextBox1.MaxLength = Column.MaxLength;
            if (Column.MaxLength < 20)
                RadTextBox1.Columns = Column.MaxLength;
            RadTextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(RadTextBox1.Text);
            if (Mode == DataBoundControlMode.Insert && HttpContext.Current.User.IsInRole("develop") && (Request.Url.AbsolutePath == "/Manage/News/insertNews.aspx"))
            {
                Session["AuthorString_EditField"] = RadTextBox1.Text;
            }
        }

        public override Control DataControl
        {
            get
            {
                return RadTextBox1;
            }
        }

        protected void RadTextBox1_DataBinding(object sender, EventArgs e)
        {
            if ((!string.IsNullOrEmpty((string)Session["AuthorString_EditField"])) && (Mode == DataBoundControlMode.Insert) && (HttpContext.Current.User.IsInRole("develop")) && (Request.Url.AbsolutePath == "/Manage/News/insertNews.aspx"))
            {
                RadTextBox1.Text = Session["AuthorString_EditField"].ToString();
            }
        }
    }
}