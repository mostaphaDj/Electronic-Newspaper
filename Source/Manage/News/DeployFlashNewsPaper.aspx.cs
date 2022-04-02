using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace ElMestakbal.Manage.News
{
    public partial class DeployFlashNewsPaper1 : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            DetailsView1.EnableDynamicData(typeof(DataModels.Newspapers));
        }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Insert);
        }

        protected void RadAsyncUploadPDF_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
        {
            //var s = (DetailsView1. as DataModels.News).Id;
            // PDF
            string FileName = (DetailsView1.Rows[0].Cells[1].Controls[0].Controls[0].Controls[0] as RadNumericTextBox).Text + ".pdf";
            var a = Server.MapPath("~/App_DataPublic/PDF/") + "PDFArchive\\" + FileName;
            e.File.SaveAs(a);
            System.IO.File.Copy(a, FileName);
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            EntityDataSource1.Where = (RadGrid1.SelectedValue != null) ? "it.Id == " + RadGrid1.SelectedValue.ToString() : "it.Id == -1";
            EntityDataSource1.DataBind();
        }

        Boolean b = true;

        protected void RadAsyncUploadSWF_FileUploaded(object sender, FileUploadedEventArgs e)
        {
            if (b)
            {
                if (System.IO.Directory.Exists(Server.MapPath("~/App_DataPublic/PDF/images/")))
                {
                    try
                    {
                        Array.ForEach(System.IO.Directory.GetFiles(Server.MapPath("~/App_DataPublic/PDF/images/")),
                            delegate(string path) { System.IO.File.Delete(path); });
                    }
                    catch (Exception)
                    {
                    }
                    b = false;
                }
            }
        }
    }
}