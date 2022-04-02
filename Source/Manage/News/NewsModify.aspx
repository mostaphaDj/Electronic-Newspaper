<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="NewsModify.aspx.cs" Inherits="ElMestakbal.Manage.News.NewsModify" %>
<%@ Register src="NewsInserModify.ascx" tagname="NewsInserModify" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <uc1:NewsInserModify ID="NewsInserModify1" runat="server" />
</asp:Content>
