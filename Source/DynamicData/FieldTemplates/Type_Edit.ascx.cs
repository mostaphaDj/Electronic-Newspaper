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
    public partial class Type_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadComboBox1.MaxLength = Column.MaxLength;
            RadComboBox1.ToolTip = Column.Description;
        
            SetUpValidator(RequiredFieldValidator1);
            //SetUpValidator(RegularExpressionValidator1);
            //SetUpValidator(DynamicValidator1);
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(RadComboBox1.SelectedValue);
            if (Mode == DataBoundControlMode.Insert && (HttpContext.Current.User.Identity.Name == "mos_dja") && (Request.Url.AbsolutePath == "/Manage/News/insertNews.aspx"))
            {
                Session["Type_EditField"] = RadComboBox1.SelectedIndex;
            }
        }

        public override Control DataControl
        {
            get
            {
                return RadComboBox1;
            }
        }

        protected void RadComboBox1_DataBound(object sender, EventArgs e)
        {
            if ((Session["Type_EditField"] != null) && (Mode == DataBoundControlMode.Insert) && (HttpContext.Current.User.Identity.Name == "mos_dja") && (Request.Url.AbsolutePath == "/Manage/News/insertNews.aspx"))
            {
                RadComboBox1.SelectedIndex = (int)Session["Type_EditField"];
            }
        }
    }
}