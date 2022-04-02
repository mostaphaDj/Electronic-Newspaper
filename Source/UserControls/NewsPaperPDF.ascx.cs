using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ElMestakbal.UserControls
{
    public partial class NewsPaperPDF : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadBinaryImagePDF.DataValue = GetPDFImage();
            }
        }

        public byte[] GetPDFImage()
        {
            string Path = Global.ServerMapPath + "App_DataPublic\\PDF\\ElMalahik\\ElMaana\\images\\page1.jpg";
            if (System.IO.File.Exists(Path))
            {
                return Global.ImageSizing(Path);
            }
            return null;
        }

        protected void RadCalendar1_DayRender(object sender, Telerik.Web.UI.Calendar.DayRenderEventArgs e)
        {
            // modify the cell rendered content for the days we want to be disabled (e.g. every Friday)
            if ((e.Day.Date.DayOfWeek == DayOfWeek.Friday) &&
                (e.Day.Date >= e.View.MonthStartDate) &&
                (e.Day.Date <= e.View.MonthEndDate))
            {
                // if you are using the skin bundled as a webresource("Default"), the Skin property returns empty string
                string calendarSkin = RadCalendar1.Skin != "" ? RadCalendar1.Skin : "Default";
                string otherMonthCssClass = "rcOutOfRange";

                // clear the default cell content (anchor tag) as we need to disable the hover effect for this cell
                e.Cell.Text = "";
                e.Cell.CssClass = otherMonthCssClass; //set new CssClass for the disabled calendar day cells (e.g. look like other month days here)

                // render a span element with the processed calendar day number instead of the removed anchor -- necessary for the calendar skinning mechanism
                Label label = new Label();
                label.Text = e.Day.Date.Day.ToString();
                e.Cell.Controls.Add(label);

                // disable the selection for the specific day
                Telerik.Web.UI.RadCalendarDay calendarDay = new Telerik.Web.UI.RadCalendarDay();
                calendarDay.Date = e.Day.Date;
                calendarDay.IsSelectable = false;
                calendarDay.ItemStyle.CssClass = otherMonthCssClass;
                RadCalendar1.SpecialDays.Add(calendarDay);
            }
        }
    }
}