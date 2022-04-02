<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ElMestakbal.Public.ContactUs" %>

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
   
    <asp:DetailsView ID="DetailsView1" runat="server" GridLines="None"
        AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource1"
        DefaultMode="Insert">
        <Fields>
            <asp:DynamicField DataField="Name" />
            <asp:DynamicField DataField="Email" />
            <asp:DynamicField DataField="Message" />
            <asp:CommandField ShowInsertButton="True" ButtonType="Button" CancelText="الغاء" InsertText=" ارسال " ShowCancelButton="False" />
        </Fields>
    </asp:DetailsView>
    <br />
     <div>
        <h3>الهاتف</h3>
        <ul>
            <li>ا<strong>لادارة&nbsp;&nbsp;&nbsp; :</strong> 021.64.51.62 / 021.64.51.72</li>
            <li>ا<strong>لتحرير&nbsp;&nbsp; :</strong> 021.64.51.77</li>
            <br />
            <li><strong>الفاكس :</strong> 021.64.51.91</li>
        </ul>
    </div>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server"
        ConnectionString="name=NewsDBEntities" DefaultContainerName="NewsDBEntities"
        EnableFlattening="False" EnableInsert="True" EntitySetName="ContactUs">
    </asp:EntityDataSource>
</asp:Content>
