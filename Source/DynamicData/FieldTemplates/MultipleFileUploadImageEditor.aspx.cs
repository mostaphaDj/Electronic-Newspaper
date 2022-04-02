using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace ElMestakbal.DynamicData.FieldTemplates
{
    public partial class MultipleFileUploadImageEditor : System.Web.UI.Page
    {
        public string pathToImage = "/Images/Tulips.jpg";//initially loaded image
        public string[] paths = new string[] { "~/Images" };

        protected void Page_Load(object sender, EventArgs args)
        {
            if (!IsPostBack)
            {
                ConfigureFileExplorer(paths);
                ConfigureImageEditor(paths);
            }
        }

        protected void RadAjaxManager1_AjaxRequest(object sender, AjaxRequestEventArgs e)
        {
            RadImageEditor1.ResetChanges();
            RadImageEditor1.ImageUrl = e.Argument;
        }

        private void ConfigureFileExplorer(string[] paths)
        {
            RadFileExplorer1.Configuration.ViewPaths = paths;
            RadFileExplorer1.Configuration.DeletePaths = paths;
            RadFileExplorer1.Configuration.UploadPaths = paths;
            RadFileExplorer1.Configuration.MaxUploadFileSize = 2 * 1024 * 1024;
            RadFileExplorer1.Configuration.SearchPatterns = new string[] { "*.jpg", "*.jpeg", "*.gif", "*.png", "*.bmp" };
            RadFileExplorer1.EnableOpenFile = false;

            RadFileExplorer1.InitialPath = pathToImage;

            //remove all buttons from the toolbar except Upload and Delete
            foreach (RadToolBarButton item in RadFileExplorer1.ToolBar.Items)
            {
                if (item.Value != "Upload" && item.Value != "Delete")
                    item.Visible = false;
            }
        }

        private void ConfigureImageEditor(string[] paths)
        {
            RadImageEditor1.ImageManager.EnableContentProvider = true;
            RadImageEditor1.ImageManager.ViewPaths = paths;
            RadImageEditor1.ImageManager.DeletePaths = paths;
            RadImageEditor1.ImageManager.UploadPaths = paths;
            RadImageEditor1.ImageManager.SearchPatterns = new string[] { "*.jpg", "*.JPG", "*.JPEG", "*.jpeg", "*.gif", "*.png", "*.bmp" };
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var s = RadImageEditor1.SaveEditableImage(string.Empty, true);
        }
    }
}