using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Specialized;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Web.DynamicData;
using System.Xml;
using System.IO;

namespace ElMestakbal.DynamicData.FieldTemplates
{
    public partial class MainImage_EditField : System.Web.DynamicData.FieldTemplateUserControl
    {
        private string NewDirName;

        protected void Page_Load(object sender, EventArgs e)
        {
            RadAsyncUpload1.ToolTip = Column.Description;
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
            System.IO.Directory.CreateDirectory(Dir);
            NewDirName = i.ToString();
            return Dir;
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

        protected override void ExtractValues(IOrderedDictionary dictionary)
        {
            var d = dictionary["DirectoryName"];
            //if (Mode == DataBoundControlMode.Insert)
            //{
                if (RadAsyncUpload1.UploadedFiles.Count > 0)
                {
                    dictionary["DirectoryName"] = NewDirName;
                    dictionary[Column.Name] = ConvertEditedValue("Index.jpg");
                    
                }
            //}
            //else if (Mode == DataBoundControlMode.Edit)
            //{

            //}
        }

        protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
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

                    image.Save(CreateNewDirectory() + "\\Index.jpg", jgpEncoder, myEncoderParameters);
                }
                e.IsValid = false;
        }

        public override Control DataControl
        {
            get
            {
                return RadAsyncUpload1;
            }
        }
    }
}
