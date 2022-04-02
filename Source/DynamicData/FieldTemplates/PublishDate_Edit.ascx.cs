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
using System.ComponentModel.DataAnnotations;

namespace ElMestakbal
{
    public partial class PublishDate_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private static DataTypeAttribute DefaultDateAttribute = new DataTypeAttribute(DataType.DateTime);
        protected void Page_Load(object sender, EventArgs e)
        {
            RadDateTimePicker1.ToolTip = Column.Description;
            
            SetUpValidator(RequiredFieldValidator1);
            //SetUpValidator(RegularExpressionValidator1);
            //SetUpValidator(DynamicValidator1);
            //SetUpCustomValidator(DateValidator);
            //string s = (string)ViewState["sss"];
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            if (Mode == DataBoundControlMode.Insert)
            {
                RadDateTimePicker1.MinDate = DateTime.Now;
                RadDateTimePicker1.DbSelectedDate = DateTime.Today.AddDays(1);
            }
            else
                RadDateTimePicker1.DbSelectedDate = FieldValue;                
        }

        //private void SetUpCustomValidator(CustomValidator validator)
        //{
        //    if (Column.DataTypeAttribute != null)
        //    {
        //        switch (Column.DataTypeAttribute.DataType)
        //        {
        //            case DataType.Date:
        //            case DataType.DateTime:
        //            case DataType.Time:
        //                validator.Enabled = true;
        //                DateValidator.ErrorMessage = HttpUtility.HtmlEncode(Column.DataTypeAttribute.FormatErrorMessage(Column.DisplayName));
        //                break;
        //        }
        //    }
        //    else if (Column.ColumnType.Equals(typeof(DateTime)))
        //    {
        //        validator.Enabled = true;
        //        DateValidator.ErrorMessage = HttpUtility.HtmlEncode(DefaultDateAttribute.FormatErrorMessage(Column.DisplayName));
        //    }
        //}

        //protected void DateValidator_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    DateTime dummyResult;
        //    args.IsValid = DateTime.TryParse(args.Value, out dummyResult);
        //}

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            if (!RadDateTimePicker1.IsEmpty)
            {
                dictionary[Column.Name] = ConvertEditedValue(RadDateTimePicker1.DbSelectedDate.ToString());
            }
            else
            {
                dictionary[Column.Name] = null;
            }

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
                return RadDateTimePicker1;
            }
        }

        protected void ButtonBegin_Click(object sender, EventArgs e)
        {
            RadDateTimePicker1.SelectedDate = DateTime.Now;
        }

        protected void ButtonEnd_Click(object sender, EventArgs e)
        {
            RadDateTimePicker1.SelectedDate = DateTime.Today.AddDays(1);
        }
    }
}