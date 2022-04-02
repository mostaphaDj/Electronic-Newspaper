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
    public partial class Type : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }

        public string GetTypeNews()
        {
            if (FieldValue == null)
                return "";
            else
                if ((Boolean)FieldValue == true)
                    return "أخبار وطنية";
                else
                    return "أخبار دولية";
        }
    }
}
