<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopContentPlace.ascx.cs" Inherits="ElMestakbal.UserControls.TopContentPlace" %>

<link href="../Carousel/owlcarousel/owl.carousel.css" rel="stylesheet" />
<link href="../Carousel/owlcarousel/owl.theme.css" rel="stylesheet" />

<style>
    .carousel {
        margin: 10px 0 10px;
        background: #0184d6;
        border:1px solid #0096f3;
        padding: 5px;
        color: #fff;
    }

    .owl-carousel {
    }

    .heading-section {
        line-height: 100%;
        padding: 6px 6px 8px;
        color: #000000;
    }

    .owl-carousel .BoxNews .img {
        width: 100%;
    }

    .owl-carousel .BoxNews .TitleLabel {
        color: #fff;
    }

    .owl-carousel .BoxNews .SibTitleLabel {
        color: #EBE9E9;
    }

    .TopContentPlace .carousel .owl-carousel .BoxNews p {
        color: #EBE9E9;
    }

    .owl-carousel .BoxNews .Divimg {
        /*position: absolute;*/
        z-index: 0;
        width: auto;
    }

    .owl-carousel .BoxNews .Divimg .Divimg img {
        position: absolute; /*border: 7px solid #FFFFFF;     -webkit-box-shadow: 0 0 11px #000;     -moz-box-shadow: 0 0 11px #000;     box-shadow: 0 0 11px #000;*/
        /*border: 6px solid #fff;
        -moz-box-shadow: 1px 1px 5px #000;
        -webkit-box-shadow: 1px 1px 5px #000;
        box-shadow: 1px 1px 5px #000;*/
    }
</style>

<div class="TopContentPlace">
    <telerik:RadListView ID="RadListView2" runat="server" DataKeyNames="Id"
        PageSize="4" GroupItemCount="2" DataSourceID="EntityDataSourceTopPlace">
        <LayoutTemplate>
            <div class="carousel">
                <h1 class="heading-section">العنوان</h1>
                <div class="owl-carousel">
                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                </div>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="BoxNews">
                <a target="_top" href='<%# (String)Eval("URL") %>' title='<%# Eval("Title") %>'>
                    <asp:Panel ID="Panel2" runat="server" Visible='<%# IsExist() %>'>
                        <div class="Divimg">
                            <telerik:RadBinaryImage ID="RadBinaryImage2" runat="server" AlternateText=""
                                Height="210px" Width="300px" ResizeMode="Crop"
                                CropPosition="Center" DataValue='<%# GetImage()  %>' />
                        </div>
                    </asp:Panel>
                </a>
                <a target="_top" href='<%# (String)Eval("URL") %>' title='<%# Eval("Title") %>'>
                    <asp:Label ID="Label1" CssClass="SibTitleLabel" runat="server" Text='<%# Eval("Subtitle") %>' />
                </a>
                <br />
                <a target="_top" href='<%# (String)Eval("URL") %>' title='<%# Eval("Title") %>'>
                    <asp:Label ID="Label2" CssClass="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </a>
                <%--<asp:Label ID="AuthorLabel" runat="server" Text='<%# Eval("Author") %>' />--%>
                <div class="clear">
                </div>

<%--                <p class="IntroductionLabel">
                    <%# GetIntroduction() %>
                    <a target="_top" href='<%# (String)Eval("URL") %>'>...المزيد </a>
                </p>--%>
            </div>
        </ItemTemplate>

        <EmptyDataTemplate>
            <%--<div class="RadListView RadListView_Default">
            <div class="rlvEmpty">
            There are no items to be displayed.</div>
            </div>--%>
        </EmptyDataTemplate>
    </telerik:RadListView>
</div>

<script src="../Carousel/owlcarousel/owl.carousel.js"></script>
<script src="../Carousel/assets/js/jquery.mousewheel.js"></script>

<script>
    jQuery(document).ready(function ($) {

        var owl = $('.owl-carousel');

        owl.owlCarousel({
            loop: true,
            //nav: true,
            rtl: true,
            margin: 20,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                960: {
                    items: 3
                },
                1200: {
                    items: 4
                }
            }
        });

        //owl.on('mousewheel', function (e) {
        //    if (e.deltaY > 0) {
        //        owl.trigger('prev.owl');
        //    } else {
        //        owl.trigger('next.owl');
        //    }
        //    e.preventDefault();
        //});
    });
</script>

<asp:EntityDataSource ID="EntityDataSourceTopPlace" runat="server" ConnectionString="name=NewsDBEntities"
    DefaultContainerName="NewsDBEntities" EnableFlattening="False" EntitySetName="ViewCarousel">
</asp:EntityDataSource>
