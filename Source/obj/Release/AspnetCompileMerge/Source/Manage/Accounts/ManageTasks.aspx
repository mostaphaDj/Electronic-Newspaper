<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master"
    AutoEventWireup="true" CodeBehind="ManageTasks.aspx.cs" Inherits="ElMestakbal.Manage.Accounts.ManageTasks" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
        <div class="RadGridRoles">
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True"
                AllowSorting="True" CellSpacing="0" DataSourceID="EntityDataSourceManageTasks"
                GridLines="None" ShowStatusBar="True" OnItemDeleted="RadGrid1_ItemDeleted">
                <ClientSettings AllowKeyboardNavigation="True" EnablePostBackOnRowClick="True">
                    <Selecting CellSelectionMode="None" AllowRowSelect="True"></Selecting>
                </ClientSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="UserId" DataSourceID="EntityDataSourceManageTasks">
                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                    <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </RowIndicatorColumn>
                    <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                        <HeaderStyle Width="20px"></HeaderStyle>
                    </ExpandCollapseColumn>
                    <Columns>
                        <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column"
                            HeaderText="اسم الدخول" SortExpression="UserName" UniqueName="UserName" AutoPostBackOnFilter="True"
                            ShowFilterIcon="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column"
                            HeaderText="الإسم" SortExpression="FirstName" UniqueName="FirstName" AutoPostBackOnFilter="True"
                            ShowFilterIcon="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column"
                            HeaderText="اسم العائلة" SortExpression="LastName" UniqueName="LastName" AutoPostBackOnFilter="True"
                            ShowFilterIcon="False">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="UserType" DataType="System.Int32" FilterControlAltText="Filter UserType column"
                            HeaderText="صفة المستخدم" SortExpression="UserType" UniqueName="UserType" AutoPostBackOnFilter="True"
                            ShowFilterIcon="False">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
        </div>
        <div class="Roles">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                <asp:ListItem Selected="True">كاتب</asp:ListItem>
                <asp:ListItem>مدير</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </telerik:RadAjaxPanel>

    <asp:EntityDataSource ID="EntityDataSourceManageTasks" runat="server" ConnectionString="name=NewsDBEntities"
        DefaultContainerName="NewsDBEntities" EnableFlattening="False" EntitySetName="aspnet_Users">
    </asp:EntityDataSource>
    <div class="clear">
    </div>
    </asp:Content>
