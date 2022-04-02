using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;
using System.Xml.Serialization;
using System.Web.UI;

//[ScaffoldTable(true)] اخفاء أو إظهار جدول
//[ScaffoldColumn(true)] اخفاء أو إظهار حقل
//[Editable(false)] قابلية الحقل للتعديل
//[DisplayName("اسم الجدول أو الحقل يمكن كتابة جملة بالفراغات")]
//اسماء  وترتيب الحقول
//[Display(Name = "اسم الحقل", Order = 1)]

//شكل العرض للحقول Display Format
//[DisplayFormat(DataFormatString="{0:C}", NullDisplayText="حقل فارغ", ApplyFormatInEditMode=true)]
//[DisplayFormat(DataFormatString="{0:MMM d,yyyy}",NullDisplayText="حقل فارغ",ApplyFormatInEditMode=true)]
//NullDisplayText النص الذي يوضع عندما تكون القيمة فارغة
//ApplyFormatInEditMode تطبيق شكل العرض عند التعديل 
//[Required] حقل مطلوب
//[Required(ErrorMessage="هذا الحقل مطلوب")]
//[Range(minimum,maximum)] تحديد نطاق القيمة للحقل 
//[StringLength(maximumLength)] أقصى طول النص
//[DataType(DataType.MultilineText)] لتحديد نوع الحقل للتصحيح ولتعيين كنترول مناسب حسب النوع المحدد

//قواعد ضبط شكل البيانات
//[RegularExpression("^[A-Z]{2}?$",ErrorMessage="Product Number must be a valid format")]
//ValidationExpression ="[ء-ضط-غف-كلم-وى-ي ][ء-ضط-غف-كلم-وى-ي ][ء-ضط-غف-كلم-وى-ي ]+"   عربية
//ValidationExpression ="[a-zA-ZÀ-ÿ ][a-zA-ZÀ-ÿ ][a-zA-ZÀ-ÿ ]+"   
//[UIHint("DateCalendar")]


namespace ElMestakbal.DataModels
{
    //public partial class NewsDBEntities
    //{  
        //public virtual int SaveChanges()
        //{
        //    var deletedEntities = ChangeTracker.Entries().Where(entry => entry.State == EntityState.Deleted);

        //    foreach (var deletedEntity in deletedEntities)
        //    {
        //        if (deletedEntity.Entity is MyEntity)
        //        {
        //            //delete the file
        //        }
        //    }

        //    return base.SaveChanges();
        //}
    //}

    [ScaffoldTable(true)]
    public partial class ViewLastNews
    {
        string _URL;
        public string URL
        {
            get
            {
                if (string.IsNullOrEmpty(_URL))
                {
                    _URL = Global.GetNewsURL(Id, Title);
                }
                return _URL;
            }
        }

        string _ArticleText;
        public string ArticleText
        {
            get
            {
                if (string.IsNullOrEmpty(_ArticleText))
                {
                    _ArticleText = Global.StripHTML(Article);
                }
                return _ArticleText;
            }
        }
    }

    [ScaffoldTable(true)]
    [MetadataType(typeof(NewsMetadata))]
    public partial class News
    {
        string _URL;
        public string URL
        {
            get
            {
                if (string.IsNullOrEmpty(_URL))
                {
                    _URL = Global.GetNewsURL(Id, Title);
                }
                return _URL;
            }
        }

        string _ArticleText;
        public string ArticleText
        {
            get
            {
                if (string.IsNullOrEmpty(_ArticleText))
                {
                    _ArticleText = Global.StripHTML(Article);
                }
                return _ArticleText;
            }
        }
    }

    public class NewsMetadata
    {
        [Display(Name = "الرقم", Order = 1)]
        [Required(ErrorMessage = "هذا الحقل مطلوب")]
        [Editable(false)]
        [ScaffoldColumn(false)]
        public Int32 Id;

        [Display(Name = "الكاتب", Order = 2)]
        [UIHint("Author")]
        public Nullable<Guid> Author;

        [Display(Name = "الكاتب", Order = 2)]
        [UIHint("AuthorString")]
        public Nullable<Guid> AuthorString;

        [Display(Name = "العنوان الرئيسي", Order = 3)]
        [Required(ErrorMessage = "لم تكتب العنوان الرئيسي")]
        [UIHint("Title")]
        public String Title;

        [Display(Name = "العنوان الفرعي", Order = 4)]
        public String Subtitle;

        [DataType(DataType.MultilineText)]
        [Display(Name = "تقديم", Order = 5)]
        [StringLength(290)] 
        public String Introduction;

        [DataType(DataType.MultilineText)]
        [Display(Name = "ملخص", Order = 6)]
        public String Summary;

        [Display(Name = "عدد القراء", Order = 7)]
        [Editable(false)]
        public Nullable<Int32> VisitsNumber;

        [Editable(false)]
        [Display(Name = "عدد المعجبين", Order = 8)]
        public Nullable<Int32> Likes;

        [Display(Name = "لم يعجب", Order = 9)]
        [Editable(false)]
        public Nullable<Int32> Dislikes;

        [Display(Name = "تاريخ الإضافة", Order = 10)]
        [Editable(false)]
        public Nullable<DateTime> InsertDate;

        [Required(ErrorMessage = "أدخل تاريخ النشر")]
        [Display(Name = "تاريخ النشر", Order = 11)]
        [UIHint("PublishDate")]
        public Nullable<DateTime> PublishDate;

        [Display(Name = "تاريخ انهاء النشر", Order = 12)]
        [UIHint("EndPublishDate")]
        public Nullable<DateTime> EndPublishDate;

        [Display(Name = "مفعل", Order = 13)]
        [UIHint("Active")]
        public Nullable<Boolean> Active;

        [Display(Name = "مكان العرض", Order = 14)]
        [UIHint("Place")]
        [Required(ErrorMessage = "حدد مكان عرض الخبر")]
        public Nullable<Int32> PlaceId;

        [Display(Name = "القسم", Order = 15)]
        [UIHint("Group")]
        public Nullable<Int32> GroupId;

        [UIHint("OrderInGroup")]
        [Display(Name = "التريب", Order = 16)]
        [Required(ErrorMessage = "لم تحدد الترتيب !!!")]
        public Nullable<Byte> OrderInGroup;

        [Display(Name = "المجال/الصعيد/الميدان", Order = 17)]
        [UIHint("Sphere")]
        public Nullable<Int32> SphereId;

        [Display(Name = "النوع", Order = 18)]
        [UIHint("Type")]
        public Nullable<Boolean> Type;

        [UIHint("MainImage")]
        [Display(Name = "الصورة", Order = 19)]
        public String MainImage;

        [UIHint("DirectoryName")]
        [Display(Name = "اسم المجل", Order = 20)]
        [Editable(false)]
        public String DirectoryName;

        [UIHint("Article")]
        [Display(Name = "المقالة", Order = 21)]
        [Required(ErrorMessage = "يرجى كتابة المقالة !!!")]
        public String Article;
    }

    public partial class ViewKammash
    {
        string _URL;
        public string URL
        {
            get
            {
                if (string.IsNullOrEmpty(_URL))
                {
                    _URL = Global.GetNewsURL(Id, Title);
                }
                return _URL;
            }
        }

        string _ArticleText;
        public string ArticleText
        {
            get
            {
                if (string.IsNullOrEmpty(_ArticleText))
                {
                    _ArticleText = Global.StripHTML(Article);
                }
                return _ArticleText;
            }
        }
    }

    public partial class GetNews_Result
    {
        string _URL;
        public string URL
        {
            get
            {
                if (string.IsNullOrEmpty(_URL))
                {
                    _URL = Global.GetNewsURL(Id, Title);
                }
                return _URL;
            }
        }

        string _ArticleText;
        public string ArticleText
        {
            get
            {
                if (string.IsNullOrEmpty(_ArticleText))
                {
                    _ArticleText = Global.StripHTML(Article);
                }
                return _ArticleText;
            }
        }
    }



    public partial class ViewSlideshow
    {
        string _URL;
        public string URL
        {
            get
            {
                if (string.IsNullOrEmpty(_URL))
                {
                    _URL = Global.GetNewsURL(Id, Title);
                }
                return _URL;
            }
        }

        string _ArticleText;
        public string ArticleText
        {
            get
            {
                if (string.IsNullOrEmpty(_ArticleText))
                {
                    _ArticleText = Global.StripHTML(Article);
                }
                return _ArticleText;
            }
        }
    }

    public partial class ViewCarousel
    {
        string _URL;
        public string URL
        {
            get
            {
                if (string.IsNullOrEmpty(_URL))
                {
                    _URL = Global.GetNewsURL(Id, Title);
                }
                return _URL;
            }
        }

        string _ArticleText;
        public string ArticleText
        {
            get
            {
                if (string.IsNullOrEmpty(_ArticleText))
                {
                    _ArticleText = Global.StripHTML(Article);
                }
                return _ArticleText;
            }
        }
    }

    [ScaffoldTable(true)]
    [MetadataType(typeof(ContactUsMetadata))]
    public partial class ContactUs
    {
    }

    public class ContactUsMetadata
    {
        [Display(Name = "الرقم", Order = 1)]
        [Required(ErrorMessage = "هذا الحقل مطلوب")]
        [Editable(false)]
        [ScaffoldColumn(false)]
        public Int32 Id { get; set; }

        //[UIHint("Article")]
        [Display(Name = "الاسم", Order = 2)]
        [Required(ErrorMessage = "أكتب الاسم !!!")]
        public String Name { get; set; }

        //[UIHint("Article")]
        [Display(Name = "البريد الإلكتروني", Order = 3)]
        [Required(ErrorMessage = "يرجى كتابة عنوان بريدك الإلكتروني !!!")]
        public String Email { get; set; }

        [DataType(DataType.MultilineText)]
        [Display(Name = "الرسالة", Order = 4)]
        [Required(ErrorMessage = "لم تكتب نص الرسالة !!!")]
        public String Message { get; set; }
    }
}