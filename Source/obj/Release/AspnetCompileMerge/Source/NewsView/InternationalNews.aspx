<%@ Page Title="" Language="C#" MasterPageFile="~/NewsView/NestedMasterNewsView.master" AutoEventWireup="true" CodeBehind="InternationalNews.aspx.cs" Inherits="ElMestakbal.NewsView.InternationalNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SlideshowContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="rightColuContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <telerik:RadListView ID="RadListView2" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1"
        PageSize="6" GroupItemCount="2">
        <LayoutTemplate>
            <h2 style="font-size: 24px; color: #191919;">
                <asp:Label ID="Label1" runat="server" Text='' />
            </h2>
            <div style="margin-bottom: 60px;">
                <asp:PlaceHolder ID="GroupPlaceholder" runat="server"></asp:PlaceHolder>
            </div>
        </LayoutTemplate>
        <GroupTemplate>
            <div>
                <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                <div class="clear">
                </div>
            </div>
        </GroupTemplate>
        <ItemTemplate>
            <div class="BoxNews">
                <a target="_top" href='<%# (String)Eval("URL") %>' title='<%# Eval("Title") %>'>
<%--                    <asp:Label ID="SubtitleLabel" runat="server" Text='<%# Eval("Subtitle") %>' />
                    <br />--%>
                    <asp:Label ID="TitleLabel" CssClass="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    <%--<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />--%>
                    <asp:Panel ID="Panel1" runat="server" CssClass="Divimg" Visible='<%# IsExist() %>'>
                        <div class="Divimgabsolute">
                            <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                                Height="250px" CssClass="abcimh" Width="250px" ImageAlign="Right" ResizeMode="Crop"
                                CropPosition="Center" DataValue='<%# GetImage()  %>' />
                        </div>
                    </asp:Panel>
                </a>
                <p class="IntroductionLabel">
                    <%# GetIntroduction() %>
                    <a target="_top" href='<%# (String)Eval("URL") %>'>...المزيد </a>
                </p>
                <%--            <asp:Label ID="SummaryLabel" runat="server" Text='<%# Eval("Summary") %>' />
            <br />
            <asp:Label ID="ArticleLabel" runat="server" Text='<%# Eval("Article") %>' />
                --%>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div class="rlvIEdit">
                <table cellspacing="0" class="rlvEditTable">
                    <tr>
                        <td>
                            <asp:Label ID="IdLabel2" runat="server" Text="Id"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="AuthorLabel2" runat="server" AssociatedControlID="AuthorTextBox" Text="Author"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="AuthorTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Author") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="TitleLabel2" runat="server" AssociatedControlID="TitleTextBox" Text="Title"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SubtitleLabel2" runat="server" AssociatedControlID="SubtitleTextBox"
                                Text="Subtitle"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SubtitleTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Subtitle") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="IntroductionLabel2" runat="server" AssociatedControlID="IntroductionTextBox"
                                Text="Introduction"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="IntroductionTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Introduction") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SummaryLabel2" runat="server" AssociatedControlID="SummaryTextBox"
                                Text="Summary"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SummaryTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Summary") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ArticleLabel2" runat="server" AssociatedControlID="ArticleTextBox"
                                Text="Article"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ArticleTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Article") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ImageLabel2" runat="server" AssociatedControlID="ImageTextBox" Text="Image"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Image") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="VisitsNumberLabel2" runat="server" AssociatedControlID="VisitsNumberTextBox"
                                Text="VisitsNumber"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="VisitsNumberTextBox" runat="server" DataType="Int32"
                                DbValue='<%# Bind("VisitsNumber") %>' NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LikesLabel2" runat="server" AssociatedControlID="LikesTextBox" Text="Likes"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="LikesTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Likes") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="DislikesLabel2" runat="server" AssociatedControlID="DislikesTextBox"
                                Text="Dislikes"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="DislikesTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Dislikes") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="PublishDateLabel2" runat="server" AssociatedControlID="PublishDateTextBox"
                                Text="PublishDate"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDateTimePicker ID="PublishDateTextBox" runat="server" DbSelectedDate='<%# Bind("PublishDate") %>'
                                MinDate="<%#new DateTime(1900, 1, 1) %>" SharedCalendarID='<%# Container.OwnerListView.FindControl("rlvSharedCalendar").UniqueID %>'
                                SharedTimeViewID='<%# Container.OwnerListView.FindControl("rlvSharedTimeView").UniqueID %>'
                                Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--                                <asp:Label ID="InsertDateLabel2" runat="server" AssociatedControlID="InsertDateTextBox"
                        Text="InsertDate"></asp:Label>--%>
                        </td>
                        <td>
                            <%--                                <telerik:RadDateTimePicker ID="InsertDateTextBox" runat="server" DbSelectedDate='<%# Bind("InsertDate") %>'
                        MinDate="<%#new DateTime(1900, 1, 1) %>" SharedCalendarID='<%# Container.OwnerListView.FindControl("rlvSharedCalendar").UniqueID %>'
                        SharedTimeViewID='<%# Container.OwnerListView.FindControl("rlvSharedTimeView").UniqueID %>'
                        Skin="<%#Container.OwnerListView.Skin %>" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ActiveLabel2" runat="server" AssociatedControlID="ActiveCheckBox"
                                Text="Active"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="GroupIdLabel2" runat="server" AssociatedControlID="GroupIdTextBox"
                                Text="GroupId"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="GroupIdTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("GroupId") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SphereIdLabel2" runat="server" AssociatedControlID="SphereIdTextBox"
                                Text="SphereId"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="SphereIdTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("SphereId") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="TypeLabel2" runat="server" AssociatedControlID="TypeCheckBox" Text="Type"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="TypeCheckBox" runat="server" Checked='<%# Bind("Type") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="OrderInGroupLabel2" runat="server" AssociatedControlID="OrderInGroupTextBox"
                                Text="OrderInGroup"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="OrderInGroupTextBox" runat="server" DataType="Byte"
                                DbValue='<%# Bind("OrderInGroup") %>' NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="KeywordsLabel2" runat="server" AssociatedControlID="KeywordsTextBox"
                                Text="Keywords"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="KeywordsTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Keywords") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="aspnet_UsersLabel2" runat="server" AssociatedControlID="aspnet_UsersTextBox"
                                Text="aspnet_Users"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="aspnet_UsersTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("aspnet_Users") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="GroupsLabel2" runat="server" AssociatedControlID="GroupsTextBox" Text="Groups"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="GroupsTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Groups") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SpheresLabel2" runat="server" AssociatedControlID="SpheresTextBox"
                                Text="Spheres"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SpheresTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Spheres") %>' />
                        </td>
                    </tr>
                </table>
            </div>
        </EditItemTemplate>
        <InsertItemTemplate>
            <div class="rlvIEdit">
                <table cellspacing="0" class="rlvEditTable">
                    <tr>
                        <td>
                            <asp:Label ID="IdLabel2" runat="server" Text="Id"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="IdTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Id") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="AuthorLabel2" runat="server" AssociatedControlID="AuthorTextBox" Text="Author"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="AuthorTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Author") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="TitleLabel2" runat="server" AssociatedControlID="TitleTextBox" Text="Title"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SubtitleLabel2" runat="server" AssociatedControlID="SubtitleTextBox"
                                Text="Subtitle"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SubtitleTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Subtitle") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="IntroductionLabel2" runat="server" AssociatedControlID="IntroductionTextBox"
                                Text="Introduction"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="IntroductionTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Introduction") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SummaryLabel2" runat="server" AssociatedControlID="SummaryTextBox"
                                Text="Summary"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SummaryTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Summary") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ArticleLabel2" runat="server" AssociatedControlID="ArticleTextBox"
                                Text="Article"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ArticleTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Article") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ImageLabel2" runat="server" AssociatedControlID="ImageTextBox" Text="Image"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="ImageTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Image") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="VisitsNumberLabel2" runat="server" AssociatedControlID="VisitsNumberTextBox"
                                Text="VisitsNumber"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="VisitsNumberTextBox" runat="server" DataType="Int32"
                                DbValue='<%# Bind("VisitsNumber") %>' NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="LikesLabel2" runat="server" AssociatedControlID="LikesTextBox" Text="Likes"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="LikesTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Likes") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="DislikesLabel2" runat="server" AssociatedControlID="DislikesTextBox"
                                Text="Dislikes"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="DislikesTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("Dislikes") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="PublishDateLabel2" runat="server" AssociatedControlID="PublishDateTextBox"
                                Text="PublishDate"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadDateTimePicker ID="PublishDateTextBox" runat="server" DbSelectedDate='<%# Bind("PublishDate") %>'
                                MinDate="<%#new DateTime(1900, 1, 1) %>" SharedCalendarID='<%# Container.OwnerListView.FindControl("rlvSharedCalendar").UniqueID %>'
                                SharedTimeViewID='<%# Container.OwnerListView.FindControl("rlvSharedTimeView").UniqueID %>'
                                Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <%--         <asp:Label ID="InsertDateLabel2" runat="server" AssociatedControlID="InsertDateTextBox"
                        Text="InsertDate"></asp:Label>--%>
                        </td>
                        <td>
                            <%--                                <telerik:RadDateTimePicker ID="InsertDateTextBox" runat="server" DbSelectedDate='<%# Bind("InsertDate") %>'
                        MinDate="<%#new DateTime(1900, 1, 1) %>" SharedCalendarID='<%# Container.OwnerListView.FindControl("rlvSharedCalendar").UniqueID %>'
                        SharedTimeViewID='<%# Container.OwnerListView.FindControl("rlvSharedTimeView").UniqueID %>'
                        Skin="<%#Container.OwnerListView.Skin %>" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="ActiveLabel2" runat="server" AssociatedControlID="ActiveCheckBox"
                                Text="Active"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="GroupIdLabel2" runat="server" AssociatedControlID="GroupIdTextBox"
                                Text="GroupId"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="GroupIdTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("GroupId") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SphereIdLabel2" runat="server" AssociatedControlID="SphereIdTextBox"
                                Text="SphereId"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="SphereIdTextBox" runat="server" DataType="Int32" DbValue='<%# Bind("SphereId") %>'
                                NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="TypeLabel2" runat="server" AssociatedControlID="TypeCheckBox" Text="Type"></asp:Label>
                        </td>
                        <td>
                            <asp:CheckBox ID="TypeCheckBox" runat="server" Checked='<%# Bind("Type") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="OrderInGroupLabel2" runat="server" AssociatedControlID="OrderInGroupTextBox"
                                Text="OrderInGroup"></asp:Label>
                        </td>
                        <td>
                            <telerik:RadNumericTextBox ID="OrderInGroupTextBox" runat="server" DataType="Byte"
                                DbValue='<%# Bind("OrderInGroup") %>' NumberFormat-DecimalDigits="0" Skin="<%#Container.OwnerListView.Skin %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="KeywordsLabel2" runat="server" AssociatedControlID="KeywordsTextBox"
                                Text="Keywords"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="KeywordsTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Keywords") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="aspnet_UsersLabel2" runat="server" AssociatedControlID="aspnet_UsersTextBox"
                                Text="aspnet_Users"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="aspnet_UsersTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("aspnet_Users") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="GroupsLabel2" runat="server" AssociatedControlID="GroupsTextBox" Text="Groups"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="GroupsTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Groups") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="SpheresLabel2" runat="server" AssociatedControlID="SpheresTextBox"
                                Text="Spheres"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="SpheresTextBox" runat="server" CssClass="rlvInput" Text='<%# Bind("Spheres") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="PerformInsertButton" runat="server" CommandName="PerformInsert" CssClass="rlvBAdd"
                                Text=" " ToolTip="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                CssClass="rlvBCancel" Text=" " ToolTip="Cancel" />
                        </td>
                    </tr>
                </table>
            </div>
        </InsertItemTemplate>
        <EmptyDataTemplate>
            <%--<div class="RadListView RadListView_Default">
        <div class="rlvEmpty">
        There are no items to be displayed.</div>
        </div>--%>
            صفحة غير متوفرة
        </EmptyDataTemplate>
    </telerik:RadListView>
<script type="text/javascript">
    $(".BoxNews .Divimg img").height(105).width(150);
    //$(".BoxNews .Divimg a img").animate({ height: "90", width: "90" });
</script>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
        DefaultContainerName="NewsDBEntities" EnableFlattening="False" EntitySetName="News"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.OrderInGroup" OnSelecting="EntityDataSource1_Selecting" >
    </asp:EntityDataSource>
</asp:Content>
