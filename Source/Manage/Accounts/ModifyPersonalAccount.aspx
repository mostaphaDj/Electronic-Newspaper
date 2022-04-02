<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.Master" AutoEventWireup="true" CodeBehind="ModifyPersonalAccount.aspx.cs" Inherits="ElMestakbal.Manage.Accounts.ModifyPersonalAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <br />
    <h2>تعديل المعلومات الشخصية</h2>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="UserId" DataSourceID="EntityDataSource1" ForeColor="#333333" GridLines="None" Height="50px" Width="350px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="UserName" HeaderText="اسم الدخول" SortExpression="UserName" />
            <asp:BoundField DataField="FirstName" HeaderText="الاسم" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="اللقب" SortExpression="LastName" />
            <asp:BoundField DataField="BirthDate" HeaderText="تاريخ الميلاد" SortExpression="BirthDate" />
            <asp:BoundField DataField="Address" HeaderText="العنوان" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="رقم الهاتف" SortExpression="Phone" />
            <asp:CommandField CancelText="الغاء الأمر" EditText="تعديل" ShowEditButton="True" UpdateText="حفظ" ButtonType="Button" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities" DefaultContainerName="NewsDBEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="aspnet_Users" Where="it.UserId = @userId" EntityTypeFilter="" Select="">
                <WhereParameters>
                <asp:SessionParameter Name="userId" SessionField="UserID" DbType="Guid" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
