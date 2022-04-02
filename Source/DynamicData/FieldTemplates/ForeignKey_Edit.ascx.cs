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
using Telerik.Web.UI;

namespace ElMestakbal
{
    public partial class ForeignKey_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RadComboBox1.Items.Count > 0)
                return;
            DropDownList dropDownList = new DropDownList();
            if (!Column.IsRequired)
            {
                dropDownList.Items.Add(new ListItem("[Not Set]", ""));
            }

            PopulateListControl(dropDownList);

            foreach (ListItem listItem in dropDownList.Items)
            {
                RadComboBoxItem comboBoxItem = new RadComboBoxItem();
                comboBoxItem.Text = listItem.Text;
                comboBoxItem.Value = listItem.Value;
                RadComboBox1.Items.Add(comboBoxItem);
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            if (Mode == DataBoundControlMode.Edit)
            {
                RadComboBox1.SelectedValue = ForeignKeyColumn.GetForeignKeyString(Row);
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            // If it's an empty string, change it to null
            string val = RadComboBox1.SelectedValue;
            if (val == String.Empty)
                val = null;

            ExtractForeignKey(dictionary, val);
        }

        public override Control DataControl
        {
            get
            {
                return RadComboBox1;
            }
        }
    }
}