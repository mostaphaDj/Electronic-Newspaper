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
    public partial class MultipleFileUpload : System.Web.DynamicData.FieldTemplateUserControl
    {
        public byte[] GetImage()
        {
            string Path = Global.ResourcesNewsPath + (Page.GetDataItem() as DataModels.News).DirectoryName + "\\" + FieldValueString ;
            if (System.IO.File.Exists(Path))
            {
                return Global.ImageSizing(Path);
            }
            return null;
        }

        public bool IsImageExists()
        {
            string Path = Global.ResourcesNewsPath + (Page.GetDataItem() as DataModels.News).DirectoryName + "\\" + FieldValueString;
            return System.IO.File.Exists(Path);
        }

        public override Control DataControl
        {
            get
            {
                return RadBinaryImage1;
            }
        }
    }
}