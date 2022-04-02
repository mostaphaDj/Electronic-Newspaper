<%@ Page Title="" Language="C#" MasterPageFile="~/Manage/CPanelNestedMasterPage.master"
    AutoEventWireup="true" CodeBehind="ModifyUsers.aspx.cs" Inherits="ElMestakbal.Manage.Accounts.ModifyUsers" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder2" runat="server">


    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowPaging="True"
        AllowSorting="True" CellSpacing="0" DataSourceID="EntityDataSourceModifyUsers"
        GridLines="None" OnItemCommand="RadGrid1_ItemCommand" ShowStatusBar="True" AutoGenerateColumns="False" AutoGenerateEditColumn="True" OnItemUpdated="RadGrid1_ItemUpdated">
        <ExportSettings>
            <Pdf>
                <PageHeader>
                    <LeftCell Text=""></LeftCell>

                    <MiddleCell Text=""></MiddleCell>

                    <RightCell Text=""></RightCell>
                </PageHeader>

                <PageFooter>
                    <LeftCell Text=""></LeftCell>

                    <MiddleCell Text=""></MiddleCell>

                    <RightCell Text=""></RightCell>
                </PageFooter>
            </Pdf>
        </ExportSettings>

        <ClientSettings AllowKeyboardNavigation="True">
            <Selecting CellSelectionMode="None" AllowRowSelect="True"></Selecting>
        </ClientSettings>
        <MasterTableView DataKeyNames="UserId"
            DataSourceID="EntityDataSourceModifyUsers" AllowAutomaticDeletes="True"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" ShowFooter="True">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
                <HeaderStyle Width="20px"></HeaderStyle>
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
                <HeaderStyle Width="20px"></HeaderStyle>
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="اسم الدخول" SortExpression="اسم الدخول" UniqueName="UserName" ReadOnly="True">
      
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="الاسم" SortExpression="الاسم" UniqueName="FirstName">
                 
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="اللقب" SortExpression="اللقب" UniqueName="LastName">
               
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn Display="False" FilterControlAltText="Filter TemplateColumn column" UniqueName="TemplateColumnPassword" HeaderText="تعديل كلمة المرور">
                    <EditItemTemplate>

                        <asp:TextBox ID="passwordTextBox" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="confirmPasswordTextBox" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
                        <br />
                        <b><asp:CompareValidator ID="comparePasswords"
                            runat="server"
                            ControlToCompare="passwordTextBox"
                            ControlToValidate="confirmPasswordTextBox"
                            ErrorMessage="كلمتي السر غير متطابقتين"
                            Display="Dynamic" /></b>

                    </EditItemTemplate>
                </telerik:GridTemplateColumn>

                <telerik:GridButtonColumn ButtonType="ImageButton" ConfirmText="هل أنت متأكد من أنك تريد حذف هذا المستخدم"
                    ConfirmTitle="تحذير" FilterControlAltText="Filter column column" ImageUrl="/Images/Delete.png"
                    UniqueName="column" CommandName="_Delete_User_"
                    ConfirmDialogType="RadWindow">
                </telerik:GridButtonColumn>

            </Columns>
            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn column"
                    ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" UpdateText="حفظ" UniqueName="EditCommandColumn2">
                </EditColumn>
            </EditFormSettings>

            <BatchEditingSettings EditType="Cell"></BatchEditingSettings>

            <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>

        <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>

        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
    </telerik:RadGrid>

    <asp:EntityDataSource ID="EntityDataSourceModifyUsers" runat="server" ConnectionString="name=NewsDBEntities"
        DefaultContainerName="NewsDBEntities" EnableFlattening="False"
        EntitySetName="aspnet_Users" EnableUpdate="True">
    </asp:EntityDataSource>
</asp:Content>
