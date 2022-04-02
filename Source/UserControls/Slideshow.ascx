<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slideshow.ascx.cs" Inherits="ElMestakbal.UserControls.Slideshow" %>

<script src="../Slideshow/js/external/jquery.mousewheel.min.js"></script>
<script src="../Slideshow/js/sliderkit/addons/sliderkit.counter.1.0.pack.js"></script>
<script src="../Slideshow/js/sliderkit/jquery.sliderkit.1.9.2.pack.js"></script>
<link href="../Slideshow/css/sliderkit-core.css" rel="stylesheet" />
<link href="../Slideshow/css/sliderkit-demos.css" rel="stylesheet" />

<!-- Slider Kit launch -->
<script type="text/javascript">
    $(window).load(function () { //$(window).load() must be used instead of $(document).ready() because of Webkit compatibility

        /*---------------------------------
         *	Counter add-on, example 01
         *---------------------------------*/
        $(".photosgallery-std").sliderkit({
            //mousewheel: true,
            shownavitems: 6,
            panelbtnshover: true,
            auto: false,
            navscrollatend: false,
            counter: true
        });
    });
</script>



<asp:EntityDataSource ID="EntityDataSourceNews" runat="server" ConnectionString="name=NewsDBEntities"
    DefaultContainerName="NewsDBEntities" EntitySetName="ViewSlideshow"
    EnableFlattening="False" AutoPage="False">
</asp:EntityDataSource>
<!-- Start WOWSlider.com BODY section -->

<%--<div style="float: right; width: 491px; height: 330px">
    <div id="wowslider-container1">
        <div class="ws_bullets">
            <div>
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="EntityDataSourceNews">
                    <ItemTemplate>
                        <a target="_top" href='<%# (String)Eval("URL") %>' title='<%# Eval("Title") %>'>
                            <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                                title='<%# Eval("Title") %>' Height="90px" Width="160px" ResizeMode="Crop" CropPosition="Center"
                                DataValue='<%# GetImage()  %>' />
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="ws_images">
            <ul>
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSourceNews">
                    <ItemTemplate>
                        <li><a href='<%# (String)Eval("URL") %>' style="text-align: center;">
                            <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                                Height="321px" Width="550px" ResizeMode="Crop" CropPosition="Center" DataValue='<%# GetImage()  %>' />
                        </a><a href='<%# (String)Eval("URL") %>'>
                            <h2 style="text-decoration: nome; font-size: 11.7pt; font-family: Arabic Transparent;">
                                <%# (String)Eval("Title") %>
                            </h2>
                        </a>
                            <p style="text-align: justify;">
                                <%# GetIntroduction() %>
                                <a target="_top" href='<%# (String)Eval("URL") %>'>...المزيد </a>
                            </p>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
</div>--%>

<!-- Start example 01 -->
<div class="sliderkit photosgallery-std counter-demo1">
    <div class="sliderkit-nav">
        <div class="sliderkit-nav-clip">
            <ul>

                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="EntityDataSourceNews">
                    <ItemTemplate>
                        <li>
                            <a target="_top" href='<%# (String)Eval("URL") %>' title='<%# Eval("Title") %>'>
                                <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                                    title='<%# Eval("Title") %>' Height="50px" Width="75px" ResizeMode="Fill" CropPosition="Center"
                                    DataValue='<%# GetImage()  %>' />
                            </a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="sliderkit-btn sliderkit-nav-btn sliderkit-nav-prev"><a rel="nofollow" href="#" title="Scroll the carousel to the left"><span>Previous line</span></a></div>
        <div class="sliderkit-btn sliderkit-nav-btn sliderkit-nav-next"><a rel="nofollow" href="#" title="Scroll the carousel to the right"><span>Next line</span></a></div>
    </div>
    <div class="sliderkit-panels">
        <div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev">
            <a rel="nofollow" href="#" title="Previous">
                <span>Previous</span>
            </a>
        </div>
        <div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next">
            <a rel="nofollow" href="#" title="Next">
                <span>Next</span>
            </a>
        </div>

        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSourceNews">
            <ItemTemplate>
                <div class="sliderkit-panel">
                    <a href='<%# (String)Eval("URL") %>' style="text-align: center;">
                        <telerik:RadBinaryImage ID="RadBinaryImage1" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                            Height="339px" Width="675px" ResizeMode="Fill" CropPosition="Center" DataValue='<%# GetImage()  %>' />
                    </a>

                    <div class="sliderkit-panel-textbox">
                        <div class="sliderkit-panel-text">
                           <a href='<%# (String)Eval("URL") %>'> <h6 class="Subtitle"><%# (String)Eval("Subtitle") %></h6></a>
                           <a href='<%# (String)Eval("URL") %>'> <h5 class="Title"><%# (String)Eval("Title") %></h5></a>
                            <%--<p><%# GetIntroduction() %></p> --%>
                        </div>
                        <div class="sliderkit-panel-overlay"></div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<!-- // end of example 01 -->

<div class="clear">
</div>

