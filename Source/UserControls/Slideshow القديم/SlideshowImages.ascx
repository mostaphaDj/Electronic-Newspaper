<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SlideshowImages.ascx.cs"
    Inherits="ElMestakbal.UserControls.SlideshowImages" %>
<script src="/Scripts/jquery.slideViewerPro.1.5.js" type="text/javascript"></script>
<link href="/Styles/svwp_style.css" rel="stylesheet" type="text/css" />
<div dir="ltr" style="text-align: left; margin: 6px 0 12px;">
    <div id="basic" class="svwp">
        <ul>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <li><a href="#">
                        <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='' Height="222px"
                            Width="289px" ResizeMode="Crop" CropPosition="Center" DataValue='<%# GetImage()  %>' />
                    </a></li>
                </ItemTemplate>
            </asp:Repeater>
            <%--            <li>
                <img width="269" height="205" alt="Empathy - K. McDonald" src="Photos/4.jpg" /></li>
            <li>
                <img width="269" height="205" alt="DIY 3D Scanner - K. McDonald" src="Photos/5.jpg" /></li>
            <li>
                <img width="269" height="205" alt="Coronal Loops - G.C. Mingati" src="Photos/6.jpg" /></li>--%>
            <!-- eccetera -->
        </ul>
    </div>
</div>
<script type="text/javascript">
        $(window).bind("load", function () {
            $("div#basic").slideViewerPro({
                asTimer: 3500,
               
                galBorderWidth: 3,

                buttonsWidth: 40,
                shuffle: true,
galBorderColor: "#575757", // the border color around the main images
thumbsBorderColor: "#575757", // the border color of the thumbnails but not the current one
thumbsActiveBorderColor: "#000", // the border color of the current thumbnail
buttonsTextColor: "#ff0000" //the color of the optional text in leftButtonInner/rightButtonInner
            });
        });
</script>
