<%@ Control Language="C#" CodeBehind="MultipleFileUpload.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.MultipleFileUpload" %>

<style type="text/css">
    .ImageMain
    {
        text-align: center;
    }

    .ImageMain img
    {
        box-shadow: 0 0 12px 
        black;
        -webkit-box-shadow: 0 0 12px 
        black;
        -moz-box-shadow: 0 0 12px #000000;
        border: 
        white solid 8px;
    }

</style>

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