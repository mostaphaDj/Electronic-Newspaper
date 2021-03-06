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
    public partial class Decimal_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var metadata = MetadataAttributes.OfType<System.ComponentModel.DataAnnotations.RangeAttribute>().FirstOrDefault();
            if (metadata != null)
            {
                RadNumericTextBox1.MinValue = Convert.ToDouble(metadata.Minimum);
                RadNumericTextBox1.MaxValue = Convert.ToDouble(metadata.Maximum);
            }
            RadNumericTextBox1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
            SetUpValidator(CompareValidator1);
            SetUpValidator(RegularExpressionValidator1);
            SetUpValidator(RangeValidator1);
            SetUpValidator(DynamicValidator1);
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(RadNumericTextBox1.Text);
        }

        public override Control DataControl
        {
            get
            {
                return RadNumericTextBox1;
            }
        }
    }
}