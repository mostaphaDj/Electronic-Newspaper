<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainMenu.ascx.cs" Inherits="ElMestakbal.UserControls.MainMenu" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%--<script src="/Scripts/jquery.spasticNav.js" type="text/javascript"></script>--%>
<style type="text/css">
    .rmRootGroup
    {
        /*background: url('/Images/MaunMemu.jpg') no-repeat;*/
        background-color: #0184d6;
        width: 984px;
        height: 35px;
        margin: 100px;
    }
    
    .NavBar ul.rmRootGroup li a span
    {
        /*border-right: 1px solid #4a4a4a;
        border-left: 1px solid black;*/ /* z-index: 2;
        position: relative;*/
        color: Black;
        font-weight: bold;
        cursor: pointer;
    }
    
    .NavBar ul.rmRootGroup li a
    {
        z-index: 20;
        position: relative;
    }
    
    .NavBar .RadMenu .rmHorizontal .rmText
    {
        padding: 8px 0 9px 16px;
        font-family: "GE SS";
        font-weight: bold;
        font-size: 11pt;
        color: white;
    }
    
    .NavBar .RadMenu .rmHorizontal .rmText:hover
    {
        font-weight: bold;
        color: #FFFFFF;
    }
    
    .NavBar .RadMenu ul.rmHorizontal, .NavBar .RadMenu ul.rmRootScrollGroup, .NavBar .RadMenu_Context ul.rmHorizontal
    {
        float: right;
    }
    
    /*#blob
    {
    background: #8b001a;
    border-top: 1px solid #CC082E;
    border-right: 1px solid #FF1644;
    border-left: 1px solid #FF1644;
    position: absolute;
    z-index: 1;
    top: 0; 

    background: -moz-linear-gradient(top, #7F0119, #e10833);
    background: -webkit-gradient(linear, left top, left bottom, from(#7F0119), to(#e10833));
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-box-shadow: 2px 3px 10px #011331;
    -webkit-box-shadow: 2px 3px 10px #011331;
    list-style: none;
    color: #21DFDF;
    }*/
    
    .rmSlide ul li
    {
        background: #474747;
        border-left: 1px solid #A9A9A9;
        border-right: 1px solid #B6B6B6;
    }

    .NavBar
    {
        padding: 12px 8px;
        background-color: White;
    }
    
    /* style google search box  */
    .gsc-clear-button
    {
        visibility: hidden;
    }
    
    #___gcse_0
    {
        margin: -3px -22px 0px -38px;
    }
 
</style>

<div class="NavBar">
    <telerik:RadMenu ID="RadMenu1" runat="server" Skin="" Style="top: 0px; left: 0px;
        margin-bottom: 0px;" ExpandAnimation-Type="OutElastic" EnableAutoScroll="True">
        <Items>
            <telerik:RadMenuItem runat="server" Text="  الرئيسية" NavigateUrl="http://www.elaane.com/"
                ImageUrl="/Images/Home.png">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="الحدث" NavigateUrl="~/NewsView/TheEvent.aspx">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="محليات" NavigateUrl="~/NewsView/NationalNews.aspx">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="أخبار دولية" NavigateUrl="~/NewsView/InternationalNews.aspx">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="اقتصاد" NavigateUrl="~/Group/4">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="ثقافة" NavigateUrl="~/Group/5">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" NavigateUrl="~/Group/3" Text="رياضة">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="منوعات" NavigateUrl="~/Group/7">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="مقالات">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="اتصل بنا" Owner="RadMenu1" NavigateUrl="~/Public/ContactUs.aspx">
            </telerik:RadMenuItem>
            <telerik:RadMenuItem runat="server" Text="من نحن" Owner="RadMenu1" NavigateUrl="~/جريدة الآن">
            </telerik:RadMenuItem>
        </Items>
        <ExpandAnimation Type="OutQuad" />
    </telerik:RadMenu>
    <%--    <script type="text/javascript">
    $('#<%= RadMenu1.ClientID %> ul').first().spasticNav();
    </script>--%>
    <div class="clear">
    </div>
</div>
