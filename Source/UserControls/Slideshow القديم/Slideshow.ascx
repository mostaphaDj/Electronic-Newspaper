<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slideshow.ascx.cs" Inherits="ElMestakbal.UserControls.Slideshow" %>
<link href="/Slideshow/style.css" rel="stylesheet" type="text/css" />
<asp:EntityDataSource ID="EntityDataSourceNews" runat="server" ConnectionString="name=NewsDBEntities"
    DefaultContainerName="NewsDBEntities" EntitySetName="ViewSlideshow"
    EnableFlattening="False" AutoPage="False"  >
</asp:EntityDataSource>
<!-- Start WOWSlider.com BODY section -->
<div style="float: right; width: 491px; height: 330px">
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
</div>
<div class="clear">
</div>
<script type="text/javascript" src="/Slideshow/wowslider.js"></script>
<script type="text/javascript" src="/Slideshow/script.js"></script>
<!-- End WOWSlider.com BODY section -->
