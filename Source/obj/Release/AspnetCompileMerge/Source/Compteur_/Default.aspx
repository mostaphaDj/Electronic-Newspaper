<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="ElMestakbal.Compteur.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SlideshowContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="rightColuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="leftColuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="leftColuContentPlaceHolde2" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="stats">
<%--        <h3>
            عدد المستخدمين حاليا :
            <%= GetNowVisitors() %>
        </h3>
        <h3>
            عدد الزائرين نهار اليوم :
            <%= GetTodayVisitors() %>
        </h3>
        <h3>
            العدد الكلي لزوار الموقع : 
            <%= GetAllVisitors()%>
        </h3>--%>
    </div>
</asp:Content>
