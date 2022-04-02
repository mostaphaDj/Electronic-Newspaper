<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainNewsPaperPDF.ascx.cs" Inherits="ElMestakbal.UserControls.MainNewsPaperPDF" %>
<div class="MainNewsPaperPDF">
    <style type="text/css">
        .LastNewsV {
            float: left;
            width: 291px;
        }

            /*.LastNewsV h4 {
                background-color: #eee;
                border-bottom: 1px solid #B9B9B9;
                margin-bottom: 3px;
                padding: 3px 12px 4px 0;
                color: #2a2a2a;
                border: 1px solid #B9B9B9;
                box-shadow: 0 0 6px #e4e3e3;
            }*/

            .LastNewsV #Title {
                float: right;
                width: 38px;
                height: 370px;
                background-color: #eee;
                background-image: url("../Images/PDFTitle.png")  ;
                border: 1px solid #B9B9B9;
                box-shadow: 0 0 6px #e4e3e3;
            }

        .MainNewsPaperPDF {
            float: left;
            width: 289x;
            text-align: center;
            position: relative;
        }

            .MainNewsPaperPDF img {
                border: 1px solid #B9B9B9;
                box-shadow: 0 0 6px #e4e3e3;
            }

            .MainNewsPaperPDF .PdfButton {
                width: 44.5%;
            }

        #MainContentCalendar {
            width: 302px;
            position: absolute;
            left: -80px;
            top: 297px;
            visibility: hidden;
            z-index: 100;
            border: 6px solid #fb940b;
            background-color: #fb940b;
        }

            #MainContentCalendar h5 {
                padding-bottom: 3px;
                color: #2a2a2a;
            }
    </style>
    <style type="text/css">
        .MainNewsPaperPDF #MainContentCalendar {
            left: -84px;
            top: 418px;
        }
    </style>
    <script type="text/javascript">
        function showHideMain(id) {
            var el = document.getElementById(id);
            if (el && el.style.visibility == 'visible')
                el.style.visibility = 'hidden';
            else
                el.style.visibility = 'visible';
        }

        function RadCalendar2_OnDateSelected(sender, eventArgs) {
            var date = eventArgs.get_renderDay().get_date();
            var dfi = sender.DateTimeFormatInfo;
            var formattedDate = dfi.FormatDate(date, dfi.ShortDatePattern);

            window.location.href = "App_DataPublic/PDF/PDFArchive/elmustakbalelarabi_" + formattedDate + ".pdf";
        }
    </script>
    <%--<script type="text/javascript">
    $(document).ready(function () {
        $(".MainNewsPaperPDF img").hover(function () {
            // hover in
            $(this).parent().parent().css("z-index", 1);
            $(this).animate({
                height: "203",
                width: "140",
                left: "-=80",
                top: "-=80"
            }, 200, 'easeOutBack');
        }, function () {
            // hover out
            $(this).parent().parent().css("z-index", 0);
            $(this).animate({
                height: "406",
                width: "280",
                left: "+=80",
                top: "+=80"
            }, 200, 'easeOutBack');
        });
    });
</script>--%>

    <div class="LastNewsV">
        <div id="Title">
        </div>

        <a href="App_DataPublic/PDF/Newspaper.aspx">
            <div style="text-align: left;">
                <telerik:RadBinaryImage ID="RadBinaryImagePDF" runat="server" AlternateText="جريدة الآن"
                    Height="370px" CssClass="abcimh" Width="242px" ResizeMode="Crop" CropPosition="Center" />
            </div>
        </a>
        <a href="/App_DataPublic/PDF/files/publication.pdf">
            <div class="PdfButton">
                تحميل
            </div>
        </a>
        <div class="PdfButton" onclick="showHideMain('MainContentCalendar')">
            أرشيف
        </div>
        <div id="MainContentCalendar">
            <h5>أرشيف جريدة الآن
            </h5>
            <telerik:RadCalendar ID="RadCalendar1" runat="server" CultureInfo="ar-DZ" SelectedDate=""
                UseColumnHeadersAsSelectors="false" ShowRowHeaders="false" UseRowHeadersAsSelectors="true"
                EnableMultiSelect="False" ShowOtherMonthsDays="false" OnDayRender="RadCalendar1_DayRender"
                Height="170px" DayNameFormat="Full" Width="300px">
                <ClientEvents OnDateSelected="RadCalendar2_OnDateSelected" />
                <WeekendDayStyle CssClass="rcWeekend"></WeekendDayStyle>
                <CalendarTableStyle CssClass="rcMainTable"></CalendarTableStyle>
                <OtherMonthDayStyle CssClass="rcOtherMonth"></OtherMonthDayStyle>
                <OutOfRangeDayStyle CssClass="rcOutOfRange"></OutOfRangeDayStyle>
                <DisabledDayStyle CssClass="rcDisabled"></DisabledDayStyle>
                <SelectedDayStyle CssClass="rcSelected"></SelectedDayStyle>
                <DayOverStyle CssClass="rcHover"></DayOverStyle>
                <FastNavigationStyle CssClass="RadCalendarMonthView RadCalendarMonthView_Default"></FastNavigationStyle>
                <ViewSelectorStyle CssClass="rcViewSel"></ViewSelectorStyle>
            </telerik:RadCalendar>
        </div>
    </div>
</div>
