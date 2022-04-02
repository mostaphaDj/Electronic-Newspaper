<%@ Control Language="C#" CodeBehind="MainImage.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.MainImage" %>

<asp:Panel ID="Panel1" Visible='<%# IsImageExists() %>' runat="server">

<div class="ImageMain">
    <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                            Height="300px" 
                            CssClass="abcimh" Width="450px" 
                            ResizeMode="Crop"
                            CropPosition="Center" 
                            DataValue='<%# GetImage()  %>' />
</div>
</asp:Panel>