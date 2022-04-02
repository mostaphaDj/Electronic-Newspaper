<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StickySidePanel.ascx.cs"
    Inherits="ElMestakbal.UserControls.StickySidePanel" %>
<link href="/Styles/jquery-sticklr-dark-color.css" rel="stylesheet" type="text/css" />
<script src="/Scripts/jquery-sticklr.min.js" type="text/javascript"></script>
<script type="text/javascript">
    // القائمة الصغيرة الجانبية
    $(document).ready(function () {
        $('#example-3').sticklr({
            animate: true,
            /*relativeTo  : 'top',*/
            showOn: 'hover',
            stickTo: 'right',
            size: 29
        });
        // سكرول الداخلي
        $.localScroll({ easing: 'easeOutElastic' });
    });

    $(document).ready(function () {

        // hide #backTop first
        $("#backTop").hide();


        $(function () {
            // اخفاء واضهار زر الى الأعلى
            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('#backTop').fadeIn();
                } else {
                    $('#backTop').fadeOut();
                }
            });


            // اخفاء واضهار الى زر الى الأسفل
            $(window).scroll(function () {
                if ($(this).scrollTop() > ($(document).height() / 2)) {
                    $('#ScrollToBottom').fadeOut();
                } else {
                    $('#ScrollToBottom').fadeIn();
                }
            });

            // الى الأعلى
            $('#backTop').click(function () {
                $('body,html').animate({
                    scrollTop: 0
                }, 800, 'easeInOutExpo');
                return false;
            });

            // الى الأسفل
            $('#ScrollToBottom').click(function () {
                $('body,html').animate({
                    scrollTop: ($(document).height() / 2) + 200
                }, 800, 'easeOutBounce');
                return false;
            });
        });
    });
</script>
<div id="sticky">
    <ul id="example-3" class="sticklr">
        <li id="backTop"><a href="#top" class="icon-BackToTop" title="الى الأعلى"></a>
           <%-- <ul>
                <li class="sticklr-title"><a href="#top">الى الأعلى</a></li>
            </ul>--%>
        </li>
        <li><a href="#aa" class="icon-ScrollTo" title="Site switcher"></a>
<%--            <ul>
                <li class="sticklr-title"><a href="#">Right-side panel</a> </li>
            </ul>--%>
        </li>
        <li id="ScrollToBottom"><a href="#aaa" class="icon-ScrollToBottom" title="الى الأسفل">
        </a>
<%--            <ul>
                <li class="sticklr-title"><a href="#aa">الى الأسفل</a> </li>
            </ul>--%>
        </li>
    </ul>
</div>
