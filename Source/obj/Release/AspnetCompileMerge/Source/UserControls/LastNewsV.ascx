<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LastNewsV.ascx.cs" Inherits="ElMestakbal.UserControls.LastNewsV" %>

<style type="text/css">
    #friendsList {
        list-style: none;
    }

        #friendsList li {
            list-style: none;
        }

            #friendsList li div {
                display: block;
                padding-top: 4px;
                font-size: 17px;
                line-height: 16pt;
                /*font-family: Arabic Transparent,Arial, Helvetica, Verdana, sans-serif;*/
                border-bottom: 1px solid #ddd;
            }

                #friendsList li div:hover {
                    background-color: #ddd;
                }

        #friendsList .time {
            font-weight: bold;
            color: Red;
        }

    .LastNewsV {
        float: left;
        width: 291px;
        border: 1px solid #B9B9B9;
        box-shadow: 0 0 6px #e4e3e3;
    }

        .LastNewsV .Content {
            height: 375px;
            overflow: auto;
            padding-right: 12px;
            margin: 0;
        }

        .LastNewsV h4 {
            background-color: #eee;
            border-bottom:1px solid #B9B9B9;
            margin-bottom: 3px;
            padding: 3px 12px 4px 0;         
            color: #2a2a2a;
        }
</style>

<div class="LastNewsV">
    <h4>آخر الأخبار
    </h4>
    <div class="Content">
        <ul id="friendsList">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1">
                <ItemTemplate>
                    <li>
                        <a href='<%# (String)Eval("URL") %>'>
                            <div>
                                <span class="time">
                                    <%# GetInsertTime()%>
                                </span>
                                <%--                                <div class="title">
                                <span>Killer .NET Ninja Skills </span>
                                </div>--%>
                                <%--  <telerik:RadBinaryImage ID="RadBinaryImage2" runat="server" AlternateText='<%# (String)Eval("Title") %>'
                                Height="50px" Width="50px" ResizeMode="Crop" CropPosition="Center" DataValue='<%# GetImage()  %>'
                                ImageAlign="Left" />--%>
                                <span title='<%# GetIntroduction() %>'>
                                    <%# (String)Eval("Title") %>
                                </span>
                            </div>
                        </a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
    DefaultContainerName="NewsDBEntities" EnableFlattening="False" EntitySetName="ViewLastNews" OrderBy="it.InsertDate desc">
</asp:EntityDataSource>
