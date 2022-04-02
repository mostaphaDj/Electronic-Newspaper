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
    public partial class Author : System.Web.DynamicData.FieldTemplateUserControl
    {
        public override Control DataControl
        {
            get
            {
                return Literal1;
            }
        }

        public string GetAuthor()
        {
            if (FieldValue != null)
            {
                using (NewsDBEntities newsDBEntities = new NewsDBEntities())
                {
                    //Get the specific employee from Database

                    ViewAuthors author = (from e in newsDBEntities.ViewAuthors

                                          where e.UserId == (Guid)FieldValue

                                          select e).First();
                    if (author != null)
                         return author.Name;
                }

            }
            return "";
        }
    }
}
