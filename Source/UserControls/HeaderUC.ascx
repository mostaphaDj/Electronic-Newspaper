<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderUC.ascx.cs" Inherits="ElMestakbal.UserControls.HeaderUC" %>
<%@ Register Src="jqDockFollowUs.ascx" TagName="jqDockFollowUs" TagPrefix="uc1" %>
<%@ Register Src="MainMenu.ascx" TagName="MainMenu" TagPrefix="uc2" %>
<div class="header">
    <div>
        <div class="loginDisplay">
            <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                <AnonymousTemplate>
                    <a href="~/Account/Login.aspx" id="HeadLoginStatus" runat="server">الدخول</a> |
                    <a href="~/Account/Register.aspx" id="HeadRegisteStatus" runat="server">اشترك</a>
                </AnonymousTemplate>
                <LoggedInTemplate>
                    مرحبا <span class="bold">
                        <asp:LoginName ID="HeadLoginName" runat="server" />
                    </span>! |
                    <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="خروج"
                        LogoutPageUrl="~/" />
                </LoggedInTemplate>
            </asp:LoginView>
        </div>
        <!-- Put the following javascript before the closing </head> tag. -->
        <div class="googleSearch">
            <script>
                (function () {
                    var cx = '004098565942993940775:zwo5wyf_rmy';
                    var gcse = document.createElement('script'); gcse.type = 'text/javascript'; gcse.async = true;
                    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
                    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(gcse, s);
                })();
            </script>

            <!-- Place this tag where you want the search box to render -->
            <gcse:searchbox-only></gcse:searchbox-only>
        </div>
        <uc1:jqDockFollowUs ID="jqDockFollowUs1" runat="server" />
        <!--<img alt="" src="/Images/Earth.gif" style="float:right;padding:5px;" />-->
        <h1 class="wolcome">&nbsp;</h1>
    </div>
    <div style="float: right; width: 200px; padding-right:6px;">
        <a id="wA1" href="http://www.elaane.com" title="جريدة الآن الصفحة الرئيسية">
            <img src="/Images/Logo.png" height="80px" width="200px" alt="جريدة الآن" class="logo" />
        </a>
        <div class="clear">
        </div>
        <p class="DateNow">
            <%= GetDateNow()%>
        </p>
    </div>
    <% IsExist(); %>

    <asp:Panel ID="PanelPub" runat="server">
        <iframe
            class="HeaderPub BannerPub BannerPubH" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"
            src='<%=GetPub() %>'></iframe>
    </asp:Panel>

    <div id="publicityHeader" style="float: left; width: 820px;">
        <telerik:RadBinaryImage ID="RadBinaryImagePublicityHeader" runat="server" Width="100%"
            Height="100px" ImageUrl="~/PublicData/Publicities/publicityHeaderTest.jpg" Visible="False" />
    </div>
    <div class="clear">
    </div>
    <uc2:MainMenu ID="MainMenu1" runat="server" />
</div>
