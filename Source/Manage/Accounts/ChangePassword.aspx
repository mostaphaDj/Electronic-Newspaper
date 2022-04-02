<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="ElMestakbal.Manage.Accounts.ChangePassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
<table>
    <h2>تعديل كلمة المرور </h2>
   
    <tr>
        <td>كلمة المرور الحالية :</td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="أدخل كلمة المرور الحالية" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
        </td>
        
    </tr>
    <tr>
        <td>الجديدة :</td>
        <td>
            <asp:TextBox ID="TextBox2" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="أدخل كلمة المرور الجديدة"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>‏إعادة كتابة الجديدة‏:</td>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="أدخل تكرار كلمة المرور" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="الكلمتا المرور غير متطابقة" ControlToCompare="TextBox2" ControlToValidate="TextBox3"></asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td >
            
        </td>
        <td >
           <asp:Button ID="Button1" runat="server" Text="حفظ" style="text-align: center; font-weight: 700;" OnClick="Button1_Click" Width="120px" />
        </td>
    </tr>
</table>
</asp:Content>


