<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelMasterPage.Master" AutoEventWireup="true" CodeBehind="InsertNews.aspx.cs" Inherits="ElMestakbal.Manage.News.InsertNews1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
        <div>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="DDControl DDValidator" />
            <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" FieldHeaderStyle-Width="150px"
                AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource1"
                CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DetailsView1_ItemCommand"
                OnItemInserted="DetailsView1_ItemInserted" OnItemDeleted="DetailsView1_ItemDeleted" DefaultMode="Insert">
                <AlternatingRowStyle BackColor="#e8e8e8" />
                <CommandRowStyle BackColor="#cccbcb" Font-Bold="True" />
                <EditRowStyle BackColor="#e8e8e8" />
                <FieldHeaderStyle BackColor="#dadada" Font-Bold="True" />
                <Fields>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Update"
                                Text="حفظ" />
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="الغاء الأمر" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="إضافة" />
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="الغاء الأمر" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="تعديل" />
                            &nbsp;
                            <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="New"
                                Text="جديد" />
                            &nbsp;
                            <asp:Button ID="Button3" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="حذف" OnClientClick="return confirm('هل تريذ حذف هذا السجل');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:DynamicField DataField="MainImage" />
                    <asp:DynamicField DataField="Subtitle" />
                    <asp:DynamicField DataField="Title" />
                    <asp:DynamicField DataField="PlaceId" />
                    <asp:DynamicField DataField="GroupId" />
                    <asp:DynamicField DataField="OrderInGroup" />
                    <asp:DynamicField DataField="SphereId" />
                    <asp:DynamicField DataField="Type" />
                    <asp:DynamicField DataField="AuthorString" />
                    <asp:DynamicField DataField="Article" ShowHeader="False" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Update"
                                Text="حفظ" />
                            &nbsp;
                            <asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="الغاء الأمر" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Button ID="Button3" runat="server" CausesValidation="True" CommandName="Insert"
                                Text="إضافة" />
                            &nbsp;
                            <asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Cancel"
                                Text="الغاء الأمر" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button4" runat="server" CausesValidation="False" CommandName="Edit"
                                Text="تعديل" />
                            &nbsp;
                            <asp:Button ID="Button5" runat="server" CausesValidation="False" CommandName="New"
                                Text="جديد" />
                            &nbsp;
                            <asp:Button ID="Button6" runat="server" CausesValidation="False" CommandName="Delete"
                                Text="حذف" OnClientClick="return confirm('هل تريذ حذف هذا السجل');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#e0e0e0" />
            </asp:DetailsView>
            <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
            <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
                DefaultContainerName="NewsDBEntities" EnableDelete="True" EnableFlattening="False"
                EnableInsert="True" EnableUpdate="True" EntitySetName="News">
            </asp:EntityDataSource>
        </div>
</asp:Content>
