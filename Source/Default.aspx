<%@ Page Title="جريدة الآن" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ElMestakbal.Default" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Src="UserControls/Slideshow.ascx" TagName="Slideshow" TagPrefix="uc1" %>
<%@ Register Src="UserControls/ListNews.ascx" TagName="ListNews" TagPrefix="uc2" %>
<%@ Register Src="UserControls/LastNewsV.ascx" TagName="LastNewsV" TagPrefix="uc3" %>
<%@ Register Src="UserControls/leftColuRibbon.ascx" TagName="leftColuRibbon" TagPrefix="uc4" %>
<%@ Register Src="UserControls/leftColu.ascx" TagName="leftColu" TagPrefix="uc5" %>
<%@ Register Src="~/UserControls/TopContentPlace.ascx" TagPrefix="uc1" TagName="TopContentPlace" %>
<%@ Register Src="~/UserControls/LastNewsH.ascx" TagPrefix="uc1" TagName="LastNewsH" %>
<%@ Register Src="~/UserControls/MainNewsPaperPDF.ascx" TagPrefix="uc1" TagName="MainNewsPaperPDF" %>




<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <title>جريدة الآن</title>
    <meta name="description" content="جريدة الآن يومية وطنية اخبارية جزائرية" />
    <meta name="keywords" content="Elaane,Elmustakbal , جريدة جريدة الآن , جريدة الآن الجزائر , أخبار الجلفة , أخبار الجزائر, أخبار, news, جريدة الآن" />
    <meta name="author" content="الشولي نور الدين" />
    <%--<meta http-equiv="content-type" content="text/html;charset=UTF-8" />--%>
    <%--<meta name="robots" ... يجب قراءة دروس عن  SEO--%>
</asp:Content>

<asp:Content ID="TopContentPlaceID" runat="server" ContentPlaceHolderID="TopContentPlaceHolder">
    <uc1:TopContentPlace runat="server" id="TopContentPlace" />
</asp:Content>

<asp:Content ID="ContentSlideshow" runat="server" ContentPlaceHolderID="SlideshowContentPlaceHolder">
    <div id="publicityHeader" style="margin-bottom: 8px;">
        <telerik:RadBinaryImage ID="RadBinaryImagePublicityHeader" runat="server" Width="100%"
            ImageUrl="~/PublicData/Publicities/publicityHeader.jpg" Visible="False" />
    </div>
    <%--<uc3:LastNewsV ID="LastNewsV1" runat="server" />--%>
    <uc1:LastNewsH runat="server" ID="LastNewsH" />
    <uc1:MainNewsPaperPDF runat="server" ID="MainNewsPaperPDF" />
    <uc1:Slideshow ID="Slideshow2" runat="server" />
</asp:Content>
<asp:Content ID="leftColuContent" ContentPlaceHolderID="leftColuContentPlaceHolder"
    runat="server">
    <uc5:leftColu ID="leftColu1" runat="server" />
</asp:Content>
<asp:Content ID="leftColuConten2" ContentPlaceHolderID="leftColuContentPlaceHolde2"
    runat="server">
    <uc4:leftColuRibbon ID="leftColuRibbon1" runat="server" />
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc2:ListNews ID="ListNews1" runat="server" />
    <%--google analytics--%>
    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-33877441-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();

    </script>
</asp:Content>
