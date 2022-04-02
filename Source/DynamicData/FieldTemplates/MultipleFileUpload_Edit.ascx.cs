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
using System.Xml;
using System.Xml.Linq;
using System.Web.DynamicData;
using System.Collections.Generic;
using System.IO;
using Telerik.Web.UI;
using System.Drawing.Imaging;

namespace ElMestakbal.DynamicData.FieldTemplates
{
    public partial class MultipleFileUpload_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadAsyncUpload1.ToolTip = Column.Description;
        }

        protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
        {
            if (IsImage(e.File.FileName))
            {
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(e.File.InputStream))//ضغط الصورة Jpeg 
                {
                    //--------------------------------------------ضغط الصورة Jpeg ---------------------------------------------------
                    ImageCodecInfo jgpEncoder = GetEncoder(ImageFormat.Jpeg);

                    //Create an Encoder object based on the GUID
                    //for the Quality parameter category.
                    System.Drawing.Imaging.Encoder myEncoder =
                        System.Drawing.Imaging.Encoder.Quality;

                    //Create an EncoderParameters object.
                    //An EncoderParameters object has an array of EncoderParameter
                    //objects. In this case, there is only one
                    //EncoderParameter object in the array.
                    EncoderParameters myEncoderParameters = new EncoderParameters(1);

                    EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 70L);
                    myEncoderParameters.Param[0] = myEncoderParameter;

                    //-----------------------------------------------------------------------------------------------

                    image.Save(GetDirectoryPath + e.File.FileName, jgpEncoder, myEncoderParameters);
                }
                e.IsValid = false;
            }

            UploadedFileList.Add(new FileInfo(GetDirectoryPath + e.File.FileName));
            RadListView1.DataSource = UploadedFileList;
            RadListView1.DataBind();
            if (RadListView1.Items.Count == 1)
            {
                RadListView1.Items[0].Selected = true;

                mainImage =  (RadListView1.SelectedItems[0].DataItem as FileInfo).Name ;
            }
            else
            {
                mainImage = "";
            }
            SelectMainImage();
        }

        private static ImageCodecInfo GetEncoder(ImageFormat format)
        {
            ImageCodecInfo[] codecs = ImageCodecInfo.GetImageDecoders();
            foreach (ImageCodecInfo codec in codecs)
            {
                if (codec.FormatID == format.Guid)
                {
                    return codec;
                }
            }
            return null;
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            newsEntity = (DataModels.News)Page.GetDataItem();// يمكن قراءة كل الحقول في السجل
            //NewDirectoryName = (string)Eval("DirectoryName"); يمكن استخدام هذا أيضا
            //mainImage = (string)Eval("mainImage");

            if ((newsEntity != null) &&  (newsEntity.DirectoryName != ""))
            {
                FileInfo[] AllfilesInfo = (new DirectoryInfo(GetDirectoryPath)).GetFiles();// تحميل جميع الملفات في المجلد المحدد
                if (AllfilesInfo.Length > 0)
                {
                    UploadedFileList.AddRange(AllfilesInfo);// تحميل الملفات من المجلد
                    RadListView1.DataSource = UploadedFileList;
                    RadListView1.DataBind();
                    SelectMainImage();
                }
            }
            RadAsyncUpload1.TargetFolder = "~" + GetDirectoryURL;
            Session["NewDirectoryName"] = DirectoryName; // من أجل RadEditer و DetailsView1_ItemCommand اذا تلقى الغاء الأمر وهو في حالة جديد 
        }

        private void SelectMainImage()
        {
            if (mainImage != null)
            {
                foreach (var item in RadListView1.Items)
                {
                    if ((item.DataItem as FileInfo).Name == mainImage)
                    {
                        item.Selected = true;
                    }
                    else
                    {
                        item.Selected = false;
                    }
                }
            }
        }

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            RadListView1.DataSource = UploadedFileList;
            RadListView1.DataBind();
            SelectMainImage();
            dictionary[Column.Name] = ConvertEditedValue((RadListView1.SelectedItems.Count > 0) ? (RadListView1.SelectedItems[0].DataItem as FileInfo).Name : "");
            dictionary["DirectoryName"] = DirectoryName;
        }

        public override Control DataControl
        {
            get
            {
                return RadAsyncUpload1;
            }
        }

        public void RegDirInXML(string DirectoryName)
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.Load(Server.MapPath("~/App_Data/Config.xml"));
            XmlNode xmlNode = XmlDoc.SelectSingleNode("/config/OldDirectory/Name");
            if ((xmlNode.InnerText != "") && (System.IO.Directory.Exists(Global.ResourcesNewsPath + xmlNode.InnerText)))
            {
                System.IO.Directory.Delete(Global.ResourcesNewsPath + xmlNode.InnerText, true);
            }
            xmlNode.InnerText = DirectoryName;
            xmlNode.ParentNode.ReplaceChild(xmlNode, xmlNode);
            XmlDoc.Save(Server.MapPath("~/App_Data/Config.xml"));
        }

        private string CreateNewDirectory()
        {
            int i = -1;
            string Dir = "";

            do
            {
                i++;
                Dir = Global.ResourcesNewsPath + i.ToString();
            }
            while (System.IO.Directory.Exists(Dir));
            RegDirInXML(i.ToString());
            System.IO.Directory.CreateDirectory(Dir);
            
            return i.ToString();
        }

        public bool IsImage(string vfilePath)
        {
            switch (Path.GetExtension(vfilePath))
            {
                case ".jpg":
                case ".jepg":
                case ".gif":
                case ".png":
                case ".bmp":
                    return true;
                default:
                    return false;
            }
        }

        public static byte[] ImageSizing(string imageName)
        {
            //radBinaryImage.DataBind(); اذا استدعية من دون ربط بيانتات
            using (System.Drawing.Image image = System.Drawing.Image.FromFile(imageName))
            {
                using (var stream = new System.IO.MemoryStream())
                {
                    image.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
                    return stream.ToArray();
                }
            }
        }

        //--------------------- ViewState[""] ------------------------------

        public List<FileInfo> UploadedFileList
        {
            get
            {
                if (ViewState["UploadedFileList"] == null)
                {
                    List<FileInfo> uploadedFileList = new List<FileInfo>();
                    ViewState["UploadedFileList"] = uploadedFileList;
                    return uploadedFileList;
                }
                else
                {
                    return (List<FileInfo>)ViewState["UploadedFileList"];
                }
            }
            set
            {
                ViewState["UploadedFileList"] = value;
            }
        }

        public DataModels.News newsEntity
        {
            get
            {
                return (DataModels.News)ViewState["newsEntity"];
            }
            set
            {
                ViewState["newsEntity"] = value;
            }
        }

        public string DirectoryName
        {
            get
            {
                if ((newsEntity != null) && (newsEntity.DirectoryName != ""))//  اذا لم يكن الأونتيتي موجود يجلبه من الستات فيو واذا لم يكن متوفر ينشء مشجلد جديد
                {
                    return newsEntity.DirectoryName;
                }
                else if (ViewState["DirectoryName"] != null)
                {
                    return (string)ViewState["DirectoryName"];
                }
                else
                {
                    ViewState["DirectoryName"] = this.CreateNewDirectory();
                    return (string)ViewState["DirectoryName"];
                }
            }
            set
            {
                ViewState["DirectoryName"] = value;
                if (newsEntity != null)
                {
                    newsEntity.DirectoryName = value;
                }
            }
        }

        public string GetDirectoryPath
        {
            get
            {
                return Global.ResourcesNewsPath + DirectoryName + "\\";
            }
        }

        public string GetDirectoryURL
        {
            get
            {
                return Global.ResourcesNewsURL + DirectoryName + "/";
            }
        }

        public string mainImage
        {
            get
            {
                if (newsEntity != null)//  اذا لم يكن الأونتيتي موجود يجلبه من الستات فيو واذا لم يكن متوفر ينشء مشجلد جديد
                {
                    return newsEntity.MainImage;
                }
                else if (ViewState["MainImage"] != null)
                {
                    return (string)ViewState["MainImage"];
                }
                else
                    return null;
            }
            set
            {
                ViewState["MainImage"] = value;
                if (newsEntity != null)
                {
                    newsEntity.MainImage = value;
                }
            }
        }

        public string GetMainImagePath
        {
            get
            {
                return GetDirectoryPath + mainImage;
            }
        }

        public string GetMainImageURL
        {
            get
            {
                return GetDirectoryURL + mainImage;
            }
        }

        protected void RadListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadListView1.DataSource = UploadedFileList;
            RadListView1.DataBind();
            mainImage = (RadListView1.SelectedItems.Count > 0) ? (RadListView1.SelectedItems[0].DataItem as FileInfo).Name : "";
        }

        protected void ButtonRemove_Click(object sender, ImageClickEventArgs e)
        {
            RadListView1.DataSource = UploadedFileList;
            RadListView1.DataBind();
            RadListViewDataItem radListViewDataItem = (RadListViewDataItem)((sender as ImageButton).Parent);
            if (radListViewDataItem is RadListViewDataItem)
            {
                FileInfo fileInfo = (FileInfo)RadListView1.Items[radListViewDataItem.DataItemIndex].DataItem;
                UploadedFileList.Remove(fileInfo);
                fileInfo.Delete();
                RadListView1.Items.Clear();
                RadListView1.DataSource = null;
                RadListView1.DataSource = UploadedFileList;
                RadListView1.DataBind();
                SelectMainImage();
            }
        }
    }
}