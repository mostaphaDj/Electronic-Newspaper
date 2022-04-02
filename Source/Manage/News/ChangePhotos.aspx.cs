using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.News
{
    public partial class ChangePhotos : System.Web.UI.Page
    {

        public string[] paths = new string[] { "~/App_DataPublic/Photo Gallery" };

        protected void Page_Load(object sender, EventArgs e)
        {
            ConfigureFileExplorer(paths);
        }

        private void ConfigureFileExplorer(string[] paths)
        {
            RadFileExplorer1.Configuration.ViewPaths = paths;
            RadFileExplorer1.Configuration.DeletePaths = paths;
            RadFileExplorer1.Configuration.UploadPaths = paths;
            RadFileExplorer1.Configuration.MaxUploadFileSize = 2 * 1024 * 1024;
            RadFileExplorer1.Configuration.SearchPatterns = new string[] { "*.jpg", "*.jpeg" };
            RadFileExplorer1.EnableOpenFile = false;
        }
    }
}