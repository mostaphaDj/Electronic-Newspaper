<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master" AutoEventWireup="true" CodeBehind="ChangePhotos.aspx.cs" Inherits="ElMestakbal.Manage.News.ChangePhotos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <telerik:RadFileExplorer ID="RadFileExplorer1" runat="server"  Width="540px" 
        Height="300px" ExplorerMode="Thumbnails" EnableAsyncUpload="True" 
        EnableCreateNewFolder="False" 
    VisibleControls="Toolbar, ContextMenus, FileList">
        <Configuration ViewPaths="~/App_DataPublic/Photo Gallery" UploadPaths="~/App_DataPublic/Photo Gallery"
            DeletePaths="~/App_DataPublic/Photo Gallery" MaxUploadFileSize="1048576" 
            SearchPatterns="*.*" />
    </telerik:RadFileExplorer>
</asp:Content>