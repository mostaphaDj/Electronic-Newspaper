<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LastNewsH.ascx.cs" Inherits="ElMestakbal.UserControls.LastNewsH" %>
<script src="/Scripts/featurify.js" type="text/javascript"></script>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=NewsDBEntities"
    DefaultContainerName="NewsDBEntities" EnableFlattening="False" EntitySetName="ViewLastNews">
</asp:EntityDataSource>
<div style="padding: 12px 30px;">
    <div id="LastNewsH" class="LastNewsH">
        <ul>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1">
                <ItemTemplate>
                    <li><a href='<%# (String)Eval("URL") %>' style="color: #82011a">
                        <%# Eval("Title")%>
                        <%--                            <span title='<%# GetIntroduction() %>'>
                            <%# (String)Eval("Title") %></span>--%>
                        <%--                            <a target="_top" href='<%# (String)Eval("URL") %>'>
                        ...المزيد
                        </a>--%>
                    </a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {

        $("#LastNewsH").featurify({
            directionIn: -1,
            directionOut: -1,
            pause: 5000,
            transition: 700
        });
    });
</script>
