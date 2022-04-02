<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master" AutoEventWireup="true" CodeBehind="Pub.aspx.cs" Inherits="ElMestakbal.Manage.Pub.Pub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <table>
        <tr>
            <td><strong>Pub 1</strong></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="350px" OnTextChanged="TextBox1_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td><strong>Pub 2</strong></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"  Width="350px" OnTextChanged="TextBox2_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td><strong>Pub 3</strong></td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"  Width="350px" OnTextChanged="TextBox3_TextChanged"></asp:TextBox></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
