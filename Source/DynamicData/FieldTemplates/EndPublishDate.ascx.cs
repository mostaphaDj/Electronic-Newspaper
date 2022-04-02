using System;
using System.Collections.Specialized;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal
{
    public partial class EndPublishDateField : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }

        public string GetDateTime()
        {
            if (FieldValue != null)
            {
                return FieldValueString;
            }
            else
            {
                return "غير محدد (يجب حذف الخبر يدويا)";
            }
        }
    }
}
