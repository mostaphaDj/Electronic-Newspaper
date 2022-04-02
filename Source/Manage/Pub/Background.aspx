<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master" AutoEventWireup="true" CodeBehind="Background.aspx.cs" Inherits="ElMestakbal.Manage.Pub.Background" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder2" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <asp:Panel ID="PanelUpload" runat="server" Width="300px">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">
                    <h2>ادراج خلفية
                    </h2>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="خلفية رمضان" OnClick="Button1_Click1" />

                    <asp:Button ID="Button2" runat="server" Text="خلفية العيد" OnClick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonUpload" runat="server" Text="رفع الملف" Width="204px" OnClick="ButtonUpload_Click" Height="42px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="PanelDelete" runat="server">
        <asp:Image ID="Image2" runat="server" Width="300" ImageUrl="~/App_DataPublic/Background/Background.jpg" />
        <br />
        <asp:Button ID="ButtonDelete" runat="server" Text="حذف الحلفية" OnClick="ButtonDelete_Click" Width="110px" />
    </asp:Panel>
</asp:Content>
