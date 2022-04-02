<%@ Control Language="C#" CodeBehind="MainImage_Edit.ascx.cs" Inherits="ElMestakbal.DynamicData.FieldTemplates.MainImage_EditField" %>

<%-- Text='<%# FieldValueEditString %>'--%>

<telerik:RadAsyncUpload ID="RadAsyncUpload1" runat="server" MaxFileInputsCount="1"
    MaxFileSize="1048576" AllowedFileExtensions="jpg,jpeg,jpe,bmp,rle,dib,gif,png,tif,tiff" 
    TargetFolder='<%# ElMestakbal.Global.ResourcesNewsPath %>'
    TemporaryFolder='<%# ElMestakbal.Global.ResourcesNewsPath + "/RadUploadTemp" %>'
    onfileuploaded="RadAsyncUpload1_FileUploaded">
</telerik:RadAsyncUpload>