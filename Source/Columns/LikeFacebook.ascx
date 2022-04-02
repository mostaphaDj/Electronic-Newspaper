<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LikeFacebook.ascx.cs" Inherits="ElMestakbal.Columns.LikeFacebook" %>
<div class="Column">
    <asp:HyperLink ID="HyperLinkLogo" runat="server">
        <img src="/Columns/Images/LikeFacebook.png" width="100%" />
    </asp:HyperLink>
    <h2 style="text-align: center">
        <asp:HyperLink ID="HyperLinkTitle" runat="server"></asp:HyperLink>
    </h2>
    <asp:Panel ID="PanelImage" runat="server">
        <div style="text-align: center; margin: 3px 0;">
            <asp:HyperLink ID="HyperLinkImage" runat="server">
                <telerik:RadBinaryImage ID="RadBinaryImage2" runat="server" AlternateText="" Height="100px"
                    Width="147px" ResizeMode="Crop" CropPosition="Center" CssClass="FacebookImg" />
            </asp:HyperLink>
        </div>
    </asp:Panel>
    <br />
    <%--    <p>
        <asp:Label ID="LabelShortIntroduction" runat="server" Text="Label"></asp:Label>
        <asp:HyperLink ID="HyperLinkMoreURL" runat="server">
        ... المزيد
        </asp:HyperLink>
    </p>--%>
</div>