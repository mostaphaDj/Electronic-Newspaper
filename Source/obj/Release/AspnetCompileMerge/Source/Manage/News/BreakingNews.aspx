<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master"
    AutoEventWireup="true" CodeBehind="BreakingNews.aspx.cs" Inherits="ElMestakbal.Manage.News.BreakingNews" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1" 
        Font-Bold="True" ForeColor="Red">لايوجد نص</asp:RequiredFieldValidator>
<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <br />
            <asp:Panel ID="Panel1" runat="server">
                الخبر:&nbsp;<br />
                <asp:TextBox ID="TextBox1" runat="server" Width="350px"
                    TextMode="MultiLine" MaxLength="200" Rows="4"></asp:TextBox><br /><br />
                يحذف على الساعة:&nbsp;<br />
                <telerik:RadTimePicker ID="RadTimePicker1" runat="server" Culture="ar-DZ">
                    <TimeView CellSpacing="-1" Columns="4" Culture="ar-DZ" RenderDirection="Vertical">
                    </TimeView>
                    <TimePopupButton HoverImageUrl="" ImageUrl="" />
                    <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                    </Calendar>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadTimePicker>
                <br /><br />
                <asp:Button ID="Button1" runat="server" Text="عرض" OnClick="Button1_Click" />
            </asp:Panel>
            <asp:Button ID="Button2" runat="server" Text="حذف الخبر العاجل" OnClick="Button2_Click"
                CausesValidation="False" />
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
