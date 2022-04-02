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
using ElMestakbal.DataModels;

namespace ElMestakbal.DynamicData.FieldTemplates
{
    public partial class Group : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }

        public String GetGroup()
        {
            if (FieldValue != null)
            {
                using (NewsDBEntities newsDBEntities = new NewsDBEntities())
                {
                    Groups group = (from e in newsDBEntities.Groups

                                    where e.Id == (int)FieldValue

                                    select e).First();
                    if (group != null)
                        return group.Name;
                }
            }
            return "";
        }
    }


}
