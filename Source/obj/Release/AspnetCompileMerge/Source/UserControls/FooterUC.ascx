<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FooterUC.ascx.cs" Inherits="ElMestakbal.UserControls.FooterUC" %>
<div id="footer" class="clear large">
    <div class="container">
        <div class="left vert_sprite">
            <%--            <ul class="switcher">
                <li class="activeden"><a href="http://google.com" title=" لبابا"><span></span></a></li>
                <li class="audiojungle"><a href="" title="شسيشسي"><span></span></a></li>
                <li class="themeforest"><a href="" title="يبلبل"><span></span></a></li>
                <li class="videohive"><a href="" title="بلالا"><span></span></a></li>
            </ul>--%>
        </div>
        <div class="middle vert_sprite">
            <div class="top">
                <div class="content-left">
                    <div class="newsletter">
                        <h3>
                            النشرة البريدية</h3>
                        <form action="" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form"
                        class="validate" target="_blank">
                        <input type="text" value="الاسم" name="FNAME" id="mce-FNAME" class="fname">
                        <input type="text" value="اللقب" name="LNAME" id="mce-LNAME" class="lname">
                        <input type="text" value="الاميل" name="EMAIL" class="required email" id="mce-EMAIL">
                        <button type="submit" name="subscribe" id="mc-embedded-subscribe" class="btn-icon submit">
                            اشتراك</button>
                        <br>
                        <a href="" class="prominent" target="_new">من الأرشيف</a>
                        </form>
                    </div>
                </div>
                <div class="content-right">
                    <div class="help-and-support">
                        <h3>
                            دعم ومساعدة</h3>
                        <%--<a href="">غع</a>--%>
                        <a href="/support">اتصال</a>
                        <br>
                        <a href="">من نحن</a>
                    </div>
                    <br />
                    <div class="follow-us">
                        <h3>
                            تابعونا على</h3>
                        <a href="https://plus.google.com/" class="icon blog">+ google</a>
                        <br>
                        <a href="http://twitter.com/" class="icon twitter">Twitter</a>
                        <br>
                        <a href="https://www.facebook.com/pages/جريدة-الآن/1025888534088927?ref=bookmarks&__mref=message"
                            class="icon facebook">facebook</a>
                        <%--  <br>
                        <a href="/page/file_updates/#rss" class="icon rss">RSS Feed</a>--%>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
            <div>
                <%--                <div class="content-left">

                </div>
                <div class="content-right">

                    <div class="stats">
                        عدد المستخدمين حاليا
                        <p class="file-count">
                            <%= Global.NowVisitors.ToString()%>
                        </p>
                        عدد الزائرين نهار اليوم
                        <p class="file-count">
                            <%= Global.TodayVisitors.ToString()%>
                        </p>
                    </div>
                </div>--%>
                <div class="clear">
                </div>
            </div>
            <%--   </div>--%>
            <%--<div class="right">
            <div class="top">
                <div class="external-site">
                    <a href="" target="_new">
                        <img alt="Nettuts" src="">
                    </a>
                    <div>
                        </div>
                    <a href="" class="prominent" target="_new"></a>
                </div>
            </div>
            <div class="bottom">
                <div class="external-site">
                    <a href="" target="_new">
                        <img alt="Wptuts" src="">
                    </a>
                    <div>
                        </div>
                   <%-- <a href="" class="prominent" target="_new">سيبيب</a>
                </div>
            </div>
        </div>--%>
        </div>
        <div class="clear">
            <!-- -->
        </div>
    </div>
    <div id="copyright">
        <div class="container">
            <%--        <div class="powered-by-envato">
            <a href=""></a>
        </div>--%>
            <div class="copyright">
                <p>
                    <span>جميع الحقوق محفوظة لشركة الصباح العربي ©  2012-2013 </span>| <span><a href="/legal/user">
                        شروط الإستخدام</a></span>| <span><a href="/support">من نحن</a></span>| <span><a href="">
                            إلى جريدة الآن</a></span> <span><a href="/support">مركز المساعدة</a></span>|
                    <span><a href="">تواصل معنا</a></span>
                   <%-- <a href="http://www.alexa.com/siteinfo/elaane.com"><script type='text/javascript' src='http://xslt.alexa.com/site_stats/js/t/a?url=elaane.com'></script></a>--%>
                </p>
                <p class="trademarks">
                </p>
            </div>
        </div>
    </div> 

</div>
