<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="leftColuRibbon.ascx.cs"
    Inherits="ElMestakbal.UserControls.leftColuRibbon" %>

<%--<%@ Register Src="../Columns/Up.ascx" TagName="Up" TagPrefix="uc1" %>
<%@ Register Src="../Columns/Down.ascx" TagName="Down" TagPrefix="uc2" %>--%>
<%@ Register Src="~/UserControls/NewsPaperPDF.ascx" TagPrefix="uc1" TagName="NewsPaperPDF" %>


<style>
    .bearTrap > div {
        height: 40px;
        overflow: hidden;
        border-bottom:2px solid #EEECEC;
        -webkit-transition: all .3s ease-in-out;
        -moz-transition: all .3s ease-in-out;
        -o-transition: all .3s ease-in-out;
        -ms-transition: all .3s ease-in-out;
        transition: all .3s ease-in-out;
    }

        .bearTrap > div:hover {
            height: 252px;
        }

    .bearTrap .tab {
        display: block;
        vertical-align: middle;
        height: 30px;
        margin: 4px 0;
        padding: 3px;
        color: #333333;
        text-shadow: 1px 1px 0px rgba(0,0,0, 0.2);
        
        -webkit-box-shadow: 0px 1px 0px rgba(0, 0, 0, .1), inset 0px 1px 0px rgba(255, 255, 255, .1);
        -moz-box-shadow: 0px 1px 0px rgba(0,0,0, .1), inset 0px 1px 0px rgba(255,255,255, .1);
        box-shadow: 0px 1px 0px rgba(0,0,0, .1), inset 0px 1px 0px rgba(255,255,255, .1);
    }

        .bearTrap .tab h6 {
            font-size:0.8em;
        }
</style>

<div class="leftColuRibbon">
<%--    <div class="ColumnsContainer">
        <uc1:Up ID="Up1" runat="server" />
        <uc2:Down ID="Down1" runat="server" />
    </div>--%>
    <uc1:NewsPaperPDF runat="server" ID="NewsPaperPDF" />

    <% IsExist(); %>
    <asp:Panel ID="PanelPub" runat="server"  >
        <iframe
            class="BannerPub BannerPubV" scrolling="no" marginwidth="0" marginheight="0" frameborder="0"
            src='<%=GetPub() %>'></iframe>
        <div class="clear">
        </div>

    </asp:Panel>
    <div class="bearTrap">
        <%--كماش--%>
        <img src="/Columns/Images/bearTrap.png" width="100%" />
        <br />
        <br />
        <asp:Repeater ID="Repeater2" runat="server" DataSourceID="EntityDataSource1">
            <ItemTemplate>
                <div id="tab-1">
                    <a href="#tab-1" class="tab">
                        <h6>
                            <%# (String)Eval("Title") %></h6>
                    </a>
                    <a href='<%# (String)Eval("URL") %>'>
                        <div style="text-align: center; margin: 3px 0;" class="DivImgBorder">
                            <telerik:RadBinaryImage ID="RadBinaryImage2" runat="server" CssClass="ImgBorder" AlternateText='<%# (String)Eval("Title") %>'
                                Height="110px" Width="159px" ResizeMode="Crop" CropPosition="Center" DataValue='<%# GetImage()  %>' ImageUrl="~/Images/Empty.jpg" />
                        </div>
                    </a>
                    <p>
                        <%# GetShortIntroduction()%>
                        <a target="_top" href='<%# (String)Eval("URL") %>'>... المزيد </a>
                    </p>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
        DefaultContainerName="NewsDBEntities" EntitySetName="ViewKammash"
        EnableFlattening="False" AutoPage="False">
    </asp:EntityDataSource>
</div>