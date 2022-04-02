<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsInserModify.ascx.cs"
Inherits="ElMestakbal.Manage.News.NewsInserModify" %>
<div>
    <%--    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    <AjaxSettings>
    <telerik:AjaxSetting AjaxControlID="RadGrid1">
    <UpdatedControls>
    <telerik:AjaxUpdatedControl ControlID="DetailsView1" />
    </UpdatedControls>
    </telerik:AjaxSetting>
    <telerik:AjaxSetting AjaxControlID="DetailsView1">
    <UpdatedControls>
    <telerik:AjaxUpdatedControl ControlID="RadGrid1" />
    </UpdatedControls>
    </telerik:AjaxSetting>
    </AjaxSettings>
    </telerik:RadAjaxManager--%>
    <%--    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>--%>
    <%--    <Style>
    .RadGrid_Default .rgGroupHeader
    {
    background-color: #40A2FF;
    }

    /*        .RadGrid_Default .rgGroupHeader .rgGroupHeader
    {
    background-color: Red;
    } */
    </Style>--%>
 
    <telerik:RadGrid ID="RadGrid1" runat="server" AllowFilteringByColumn="True" AllowSorting="True"
                     CellSpacing="0" DataSourceID="EntityDataSourceModifyNews" GridLines="None" AutoGenerateColumns="False"
                     OnNeedDataSource="RadGrid1_NeedDataSource" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged"
                     ShowGroupPanel="True" OnRowDrop="RadGrid1_RowDrop" AllowMultiRowSelection="True" 
                     ShowFooter="True" ShowStatusBar="True"  >
        <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True" AllowDragToGroup="True"
                        AllowRowsDragDrop="True">
            <Selecting CellSelectionMode="None" AllowRowSelect="True" EnableDragToSelectRows="true">
            </Selecting>
        </ClientSettings>
        <MasterTableView DataKeyNames="Id" DataSourceID="EntityDataSourceModifyNews" ShowFooter="True">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column" Created="True">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridBoundColumn AutoPostBackOnFilter="True" DataField="Title" FilterControlAltText="Filter Title column"
                    HeaderText="العنوان" ShowFilterIcon="False" SortExpression="Title" UniqueName="Title" FilterControlWidth="500px">
                    <ItemStyle Width="530px" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PlaceId" FilterControlAltText="Filter Title column"
                    HeaderText="مكان العرض" ShowFilterIcon="False" SortExpression="PlaceId" UniqueName="PlaceId"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="GroupId" FilterControlAltText="Filter Title column"
                    HeaderText="القسم" ShowFilterIcon="False" SortExpression="GroupId" UniqueName="GroupId"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="OrderInGroup" FilterControlAltText="Filter Title column"
                    HeaderText="الترتيب" ShowFilterIcon="False" SortExpression="OrderInGroup" UniqueName="OrderInGroup"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Subtitle" FilterControlAltText="Filter Subtitle column"
                    HeaderText="عنوان فرعي" SortExpression="Subtitle" UniqueName="Subtitle" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Author" DataType="System.Guid" FilterControlAltText="Filter Author column"
                    HeaderText="الكاتب" SortExpression="Author" UniqueName="Author" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Introduction" FilterControlAltText="Filter Introduction column"
                    HeaderText="ملخص تمهيدي" SortExpression="Introduction" UniqueName="Introduction"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Summary" FilterControlAltText="Filter Summary column"
                    HeaderText="ملخص (لمحرك البحث)" SortExpression="Summary" UniqueName="Summary"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="KeywordsId" DataType="System.Int32" FilterControlAltText="Filter KeywordsId column"
                    HeaderText="الكلمات الدليلية" SortExpression="KeywordsId" UniqueName="KeywordsId"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Article" FilterControlAltText="Filter Article column"
                    HeaderText="المقالة" SortExpression="Article" UniqueName="Article" Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="VisitsNumber" DataType="System.Int32" FilterControlAltText="Filter VisitsNumber column"
                    HeaderText="VisitsNumber" ReadOnly="True" SortExpression="VisitsNumber" UniqueName="VisitsNumber"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Likes" DataType="System.Int32" FilterControlAltText="Filter Likes column"
                    HeaderText="Likes" ReadOnly="True" SortExpression="Likes" UniqueName="Likes"
                    Visible="False">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Dislikes" DataType="System.Int32" FilterControlAltText="Filter Dislikes column"
                    HeaderText="Dislikes" ReadOnly="True" SortExpression="Dislikes" UniqueName="Dislikes"
                    Visible="False" CurrentFilterFunction="GreaterThanOrEqualTo">
                </telerik:GridBoundColumn>
                <telerik:GridDateTimeColumn DataField="InsertDate" FilterControlAltText="Filter InsertDate column"
                    HeaderText="تاريخ الاضافة" SortExpression="InsertDate" UniqueName="InsertDate"
                    CurrentFilterFunction="GreaterThanOrEqualTo" AutoPostBackOnFilter="True"
                    ShowFilterIcon="true" DataType="System.DateTime" PickerType="DateTimePicker" 
                    ReadOnly="True" FilterControlWidth="150px">
                </telerik:GridDateTimeColumn>
                <telerik:GridDateTimeColumn DataField="PublishDate" FilterControlAltText="Filter PublishDate column"
                    HeaderText="تاريخ النشر" SortExpression="PublishDate" UniqueName="PublishDate"
                    CurrentFilterFunction="GreaterThanOrEqualTo" FilterControlWidth="130px"
                    ShowFilterIcon="true" DataType="System.DateTime" PickerType="DateTimePicker" Visible="False">
                    <ItemStyle Width="100px" />
                </telerik:GridDateTimeColumn>
                <telerik:GridDateTimeColumn DataField="EndPublishDate" FilterControlAltText="Filter EndPublishDate column"
                    HeaderText="تاريخ انتهاء النشر" SortExpression="EndPublishDate" UniqueName="EndPublishDate"
                    CurrentFilterFunction="LessThanOrEqualTo" FilterControlWidth="130px"
                    ShowFilterIcon="true" DataType="System.DateTime" PickerType="DateTimePicker" Visible="False">
                    <ItemStyle Width="100px" />
                </telerik:GridDateTimeColumn>
                <telerik:GridCheckBoxColumn DataField="Active" DataType="System.Boolean"
                    FilterControlAltText="Filter Active column" HeaderText="التفعيل" ShowFilterIcon="False"
                    SortExpression="Active" UniqueName="Active" Visible="False">
                </telerik:GridCheckBoxColumn>
            </Columns>
            <GroupByExpressions>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField FieldAlias="PlaceName" FieldName="PlaceName" HeaderText="مكان العرض"
                                                  HeaderValueSeparator=":  " />
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldAlias="PlaceId" FieldName="PlaceId" FormatString=""
                                                  HeaderText="" />
                    </GroupByFields>
                </telerik:GridGroupByExpression>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField FieldAlias="GroupName" FieldName="GroupName" FormatString=""
                                                  HeaderText="القسم" />
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldAlias="GroupId" FieldName="GroupId" FormatString=""
                                                  HeaderText="" />
                    </GroupByFields>
                </telerik:GridGroupByExpression>
            </GroupByExpressions>
            <EditFormSettings>
                <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                </EditColumn>
            </EditFormSettings>
            <GroupHeaderItemStyle BackColor="#D53151" BorderColor="#4B000F" BorderStyle="Solid"
                                  ForeColor="White" />

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>

<PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>

        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
    </telerik:RadGrid>
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:EntityDataSource ID="EntityDataSourceModifyNews" runat="server" ConnectionString="name=NewsDBEntities"
                          DefaultContainerName="NewsDBEntities" EnableDelete="True" EnableFlattening="False"
                          EnableInsert="True" EnableUpdate="True" EntitySetName="ViewNews" OrderBy="it.OrderInGroup , it.SphereId , it.GroupId , it.InsertDate">
    </asp:EntityDataSource>
<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
            <asp:Button ID="Button7" runat="server" Text="عرض الحقل المحدد" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="DDControl DDValidator" />
            <asp:DetailsView ID="DetailsView1" runat="server" Width="100%" FieldHeaderStyle-Width="150px"
                             AllowPaging="True" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="EntityDataSource1"
                             CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DetailsView1_ItemCommand"
                             OnItemInserted="DetailsView1_ItemInserted" OnItemDeleted="DetailsView1_ItemDeleted" >
                <AlternatingRowStyle BackColor="#e8e8e8" />
                <CommandRowStyle BackColor="#cccbcb" Font-Bold="True" />
                <EditRowStyle BackColor="#e8e8e8" />
                <EmptyDataTemplate>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="اضافة خبر جديد" />
                </EmptyDataTemplate>
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
