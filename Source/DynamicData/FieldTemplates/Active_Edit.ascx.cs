using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal
{
    public partial class Active_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckBox1.ToolTip = Column.Description;          
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            if (Mode == DataBoundControlMode.Insert)
            {
                CheckBox1.Checked = true;
            }
            else
            {
                object val = FieldValue;
                if (val != null)
                    CheckBox1.Checked = (bool)val;
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = CheckBox1.Checked;
        }

        public override Control DataControl
        {
            get
            {
                return CheckBox1;
            }
        }

    }
}
