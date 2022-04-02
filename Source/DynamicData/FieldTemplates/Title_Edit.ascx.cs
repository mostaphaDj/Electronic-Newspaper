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

namespace ElMestakbal
{
    public partial class Title_EditField : System.Web.DynamicData.FieldTemplateUserControl
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
            dictionary[Column.Name] = ConvertEditedValue(RadTextBox1.Text.Trim());
            // بديل مؤقت عن GetDAte()
            if (Mode == DataBoundControlMode.Insert)
            {
                dictionary["InsertDate"] = ConvertEditedValue(DateTime.Now.ToString());
            }
        }

        public override Control DataControl
        {
            get
            {
                return RadTextBox1;
            }
        }
    }
}