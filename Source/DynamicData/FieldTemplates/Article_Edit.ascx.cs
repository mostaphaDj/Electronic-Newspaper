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

namespace ElMestakbal.DynamicData.FieldTemplates
{
    public partial class Article_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadEditor1.MaxTextLength = Column.MaxLength;
            RadEditor1.ToolTip = Column.Description;

            SetUpValidator(RequiredFieldValidator1);
        }

        //protected override void OnDataBinding(EventArgs e)
        //{
        //    base.OnDataBinding(e);
            //string[] NewDirectoryURL = { Global.ResourcesNewsURL + (string)Session["NewDirectoryName"] };
            //RadEditor1.ExternalDialogsPath = NewDirectoryURL[0];

            //RadEditor1.ImageManager.ViewPaths = NewDirectoryURL;
            //RadEditor1.ImageManager.UploadPaths = NewDirectoryURL;
            //RadEditor1.ImageManager.DeletePaths = NewDirectoryURL;

            //RadEditor1.MediaManager.ViewPaths = NewDirectoryURL;
            //RadEditor1.MediaManager.UploadPaths = NewDirectoryURL;
            //RadEditor1.MediaManager.DeletePaths = NewDirectoryURL;

            //RadEditor1.FlashManager.ViewPaths = NewDirectoryURL;
            //RadEditor1.FlashManager.UploadPaths = NewDirectoryURL;
            //RadEditor1.FlashManager.DeletePaths = NewDirectoryURL;

            //RadEditor1.TemplateManager.ViewPaths = NewDirectoryURL;
            //RadEditor1.TemplateManager.UploadPaths = NewDirectoryURL;
            //RadEditor1.TemplateManager.DeletePaths = NewDirectoryURL;

            //RadEditor1.DocumentManager.ViewPaths = NewDirectoryURL;
            //RadEditor1.DocumentManager.UploadPaths = NewDirectoryURL;
            //RadEditor1.DocumentManager.DeletePaths = NewDirectoryURL;

            //RadEditor1.SilverlightManager.DeletePaths = NewDirectoryURL;
            //RadEditor1.SilverlightManager.UploadPaths = NewDirectoryURL;
            //RadEditor1.SilverlightManager.ViewPaths = NewDirectoryURL;
        //}

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            dictionary[Column.Name] = ConvertEditedValue(RadEditor1.GetHtml(EditorStripHtmlOptions.None));
        }

        public override Control DataControl
        {
            get
            {
                return RadEditor1;
            }
        }
    }
}