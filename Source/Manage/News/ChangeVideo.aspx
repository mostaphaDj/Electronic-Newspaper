<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master"
    AutoEventWireup="true" CodeBehind="ChangeVideo.aspx.cs" Inherits="ElMestakbal.Manage.News.ChangeVideo" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <br />
    <h3>
        تغيير الفيديو</h3>
    <table>
        <tr>
            <td>
            Title
            </td>
            <td>
            <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            URL
            </td>
            <td>
            <asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox>
            </td>
        </tr>
    </table>
<asp:Button  ID="Button1" runat="server" Text="Change" onclick="Button1_Click" />
</asp:Content>
