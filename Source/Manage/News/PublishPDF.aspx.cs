using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.Manage.News
{
    public partial class PublishPDF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadDatePicker1.SelectedDate = DateTime.Today.AddDays(1);
            //RadDatePicker2.SelectedDate = DateTime.Today.AddDays(1);
            DataBind();
        }

        protected void RadAsyncUpload1_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
        {

            e.File.SaveAs(Global.PDFURL + "\\files\\publication.pdf");
            File.Copy(Global.PDFURL + "\\files\\publication.pdf", string.Format("{0}{1}{2}{3}", Global.PDFURL, "PDFArchive\\elmustakbalelarabi_", RadDatePicker1.SelectedDate.Value.ToString("dd-MM-yyyy"), ".pdf"), true);
            ConvertPDFToImages(Global.PDFURL + "\\files\\publication.pdf", Global.PDFURL + "\\images\\");
            Image1.Visible = true;

            e.IsValid = false;
        }

        protected void RadAsyncUpload2_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
        {
            //e.File.SaveAs(Global.PDFDjelfaURL + "\\files\\publication.pdf");
            //File.Copy(Global.PDFDjelfaURL + "\\files\\publication.pdf", string.Format("{0}{1}{2}{3}", Global.PDFDjelfaURL, "PDFArchive\\ElmustakbalElArabiDjelfa_", RadDatePicker1.SelectedDate.Value.ToString("dd-MM-yyyy"), ".pdf"), true);
            //ConvertPDFToImages(Global.PDFDjelfaURL + "\\files\\publication.pdf", Global.PDFDjelfaURL + "\\images\\");
            //Image1.Visible = true;

            e.IsValid = false;
        }

        protected void RadAsyncUpload3_FileUploaded(object sender, Telerik.Web.UI.FileUploadedEventArgs e)
        {
            e.File.SaveAs(Global.PDFElMaanaURL + "\\files\\publication.pdf");
            File.Copy(Global.PDFElMaanaURL + "\\files\\publication.pdf", string.Format("{0}{1}{2}{3}", Global.PDFElMaanaURL, "PDFArchive\\ElMaana_", RadDatePicker1.SelectedDate.Value.ToString("dd-MM-yyyy"), ".pdf"), true);
            ConvertPDFToImages(Global.PDFElMaanaURL + "\\files\\publication.pdf", Global.PDFElMaanaURL + "\\images\\");
            Image1.Visible = true;

            e.IsValid = false;
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

        private void ConvertPDFToImages(string filename, string output)
        {
            bool Converted = false;
            //Setup the converter
            PDFConvert converter = new PDFConvert();
            converter.RenderingThreads = 8; // Threads عدد
            converter.TextAlphaBit = 4;// تحسين حواف النص
            converter.GraphicsAlphaBit = 4; // تحسين حواف الرسومات
            converter.OutputToMultipleFile = true; // استخراج كل صفجة الى ملف مختلف;
            converter.FirstPageToConvert = -1;// الصفحة الأولى
            converter.LastPageToConvert = -1;// الصحة الاخيرة -1 نعني كل الصفحات
            converter.OutputFormat = "jpeg";
            converter.JPEGQuality = 30;// الجودة

            converter.Height = 2009;
            converter.Width = 1300;
            converter.FitPage = true;// تناسب الصفحة



            FileInfo input = new FileInfo(filename);


            Array.ForEach(Directory.GetFiles(output),
                           delegate(string path) { File.Delete(path); });

            Converted = converter.Convert(input.FullName, output + "\\page.jpg");

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

            EncoderParameter myEncoderParameter = new EncoderParameter(myEncoder, 30L);
            myEncoderParameters.Param[0] = myEncoderParameter;
            //-----------------------------------------------------------------------------------------------

            for (int i = 0; i <= 24; i++)
            {
                string ImgPath = string.Format("{0}\\{1}{2}{3}", output, "page", i.ToString(), ".jpg");
                if (File.Exists(ImgPath))
                {
                    string ImgZoomPath = ImgPath.Replace(".jpg", "_zoom.jpg");
                    File.Move(ImgPath, ImgZoomPath);

                    using (System.Drawing.Image image = System.Drawing.Image.FromFile(ImgZoomPath))
                    {
                        using (System.Drawing.Image thumbnailImage = image.GetThumbnailImage(110, 170, null, IntPtr.Zero))
                        {
                            thumbnailImage.Save(ImgPath.Replace(".jpg", "_thumbnail.jpg"), jgpEncoder, myEncoderParameters);
                        }

                        using (System.Drawing.Image thumbnailImage = image.GetThumbnailImage(792, 1224, null, IntPtr.Zero))
                        {
                            thumbnailImage.Save(ImgPath, jgpEncoder, myEncoderParameters);
                        }
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }
    }
}