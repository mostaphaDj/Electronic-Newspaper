<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Down.ascx.cs" Inherits="ElMestakbal.Columns.Down" %>
<div class="down" style="margin-bottom:12px;">
    <h2 style="text-align: center; background-color:#3B3B3B ;margin-bottom:3px; padding:6px;font-size: 15px; font-family: 'GE SS';">
        <asp:HyperLink ID="HyperLinkTitle" runat="server" style="color: White;"></asp:HyperLink>
    </h2>
    <asp:HyperLink ID="HyperLinkLogo" runat="server">
        <img class="downDirection" src="/Columns/Images/Down.png" width="70px" style="position:absolute;" />
    </asp:HyperLink>

    <asp:Panel ID="PanelImage" runat="server">
        <div style="text-align: left;">
            <asp:HyperLink ID="HyperLinkImage" runat="server">
                <telerik:RadBinaryImage ID="RadBinaryImage2" runat="server" AlternateText="" Height="120px"
                    Width="120px" ResizeMode="Crop" CropPosition="Center" CssClass="Img" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="3" ImageUrl="~/Images/Empty.jpg" />
            </asp:HyperLink>
        </div>
    </asp:Panel>
    <%--    <p>
        <asp:Label ID="LabelShortIntroduction" runat="server" Text="Label"></asp:Label>
        <asp:HyperLink ID="HyperLinkMoreURL" runat="server">
        ... المزيد
        </asp:HyperLink>
    </p>--%>
</div>
