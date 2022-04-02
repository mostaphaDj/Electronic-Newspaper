<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsPaperPDF.ascx.cs" Inherits="ElMestakbal.UserControls.NewsPaperPDF" %>
<div class="NewsPaperPDF">

    <style type="text/css">
        .NewsPaperPDF {
            float: left;
            width: 168px;
            text-align: center;
            position: relative;
        }

            .NewsPaperPDF img {
                border: 1px solid #B9B9B9;
                box-shadow: 0 0 6px #e4e3e3;
            }
    </style>
    <style type="text/css">
        #contentCalendar {
            width: 302px;
            position: absolute;
            left: -80px;
            top: 297px;
            visibility: hidden;
            z-index: 100;
            border: 6px solid #fb940b;
            background-color: #fb940b;
        }

            #contentCalendar h5 {
                padding-bottom: 3px;
                color: #2a2a2a;
            }

        .RadCalendar_Default .rcRow .rcHover {
            border-color: #C4C4C4 #B2B2B2 #9E9E9E;
            background: #C5C5C5 0 -1600px repeat-x url('WebResource.axd?d=G03l0bq1SUkvwG4Bsdmi3PfVT1PqEj0qN5qfqHENs8iQ2DGhNo-MwSRoc8Kyz54us7Wm4R5yqfD61zYVefDDgiQQdMEysHxTfohVG62mEweNecM6csc_BwITCUH3T9XiHhEJZxIBeZkkd-0GGY8qoGqscG7PfjLBF-4x_QBOXjY1&t=634696541680000000');
        }

        .RadCalendar_Default .rcMain .rcRow a, .RadCalendar_Default .rcMain .rcRow span {
            color: Blue;
        }

        .RadCalendar_Default .rcMain .rcOutOfRange span {
            color: #9B9999;
        }
    </style>
    <script type="text/javascript">
        function showHide(id) {
            var el = document.getElementById(id);
            if (el && el.style.visibility == 'visible')
                el.style.visibility = 'hidden';
            else
                el.style.visibility = 'visible';
        }

        function RadCalendar1_OnDateSelected(sender, eventArgs) {
            var date = eventArgs.get_renderDay().get_date();
            var dfi = sender.DateTimeFormatInfo;
            var formattedDate = dfi.FormatDate(date, dfi.ShortDatePattern);

            window.location.href = "/App_DataPublic/PDF/ElMalahik/ElMaana/PDFArchive/ElMaana_" + formattedDate + ".pdf";
        }
    </script>
    <%--<script type="text/javascript">
    $(document).ready(function () {
        $(".NewsPaperPDF img").hover(function () {
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

    <a href="/App_DataPublic/PDF/ElMalahik/ElMaana/ElMaanaNewspaper.aspx">
        <div style="text-align: center;">
            <telerik:RadBinaryImage ID="RadBinaryImagePDF" runat="server" AlternateText="جريدة الآن"
                Height="247px" CssClass="abcimh" Width="162px" ResizeMode="Crop" CropPosition="Center" />
        </div>
    </a>
    <a href="/App_DataPublic/PDF/ElMalahik/ElMaana/files/publication.pdf">
        <div class="PdfButton">
            تحميل
        </div>
    </a>
    <div class="PdfButton" onclick="showHide('contentCalendar')">
        أرشيف
    </div>
    <div id="contentCalendar">
        <h5>أرشيف جريدة الآن
        </h5>
        <telerik:RadCalendar ID="RadCalendar1" runat="server" CultureInfo="ar-DZ" SelectedDate=""
            UseColumnHeadersAsSelectors="false" ShowRowHeaders="false" UseRowHeadersAsSelectors="true"
            EnableMultiSelect="False" ShowOtherMonthsDays="false" OnDayRender="RadCalendar1_DayRender"
            Height="170px" DayNameFormat="Full" Width="300px">
            <ClientEvents OnDateSelected="RadCalendar1_OnDateSelected" />
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
