<%@ Page Title="" Language="C#" MasterPageFile="NestedMasterNewsView.master" AutoEventWireup="true" CodeBehind="NewsViewListByGroups.aspx.cs" Inherits="ElMestakbal.NewsView.NewsViewListByGroups" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SlideshowContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadListView ID="RadListView2" runat="server" DataKeyNames="Id" DataSourceID="EntityDataSource1"
                         PageSize="4" GroupItemCount="2">
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
<%--                    <asp:Label ID="SubtitleLabel" CssClass="SibTitleLabel" runat="server" Text='<%# Eval("Subtitle") %>' />
                    <br />--%>
                    <asp:Label ID="TitleLabel" CssClass="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    <%--<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />--%>
                    <asp:Panel ID="Panel1" runat="server" CssClass="Divimg" Visible='<%# IsExist() %>'>
                        <div class="Divimgabsolute DivImgBorder">
                            <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                                                    Height="250px" CssClass="abcimh ImgBorder" Width="250px" ImageAlign="Right" ResizeMode="Crop" 
                                                    CropPosition="Center" DataValue='<%# GetImage()  %>' />
                        </div>
                    </asp:Panel>
                </a>
                <p class="IntroductionLabel">
                    <%# GetIntroduction() %>
                    <a target="_top" href='<%# (String)Eval("URL") %>'>
                        ...المزيد
                    </a>
                </p>
            <%--            <asp:Label ID="SummaryLabel" runat="server" Text='<%# Eval("Summary") %>' />
            <br />
            <asp:Label ID="ArticleLabel" runat="server" Text='<%# Eval("Article") %>' />
            --%>
            </div>
        </ItemTemplate>
     
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
                          DefaultContainerName="NewsDBEntities" 
                          EnableFlattening="False" EntitySetName="News"
                          EnableDelete="True" EnableInsert="True" 
                          EnableUpdate="True" 
                          OrderBy="it.OrderInGroup" OnSelecting="EntityDataSource1_Selecting"   >
    </asp:EntityDataSource>
</asp:Content>
