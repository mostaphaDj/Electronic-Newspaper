<%@ Control Language="C#" Inherits="ElMestakbal.PublishDate_EditField" CodeBehind="PublishDate_Edit.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<table>
    <tr>
        <td>
<%--            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>--%>
                    <telerik:RadDateTimePicker ID="RadDateTimePicker1" runat="server" Culture="ar-DZ">
                        <TimeView CellSpacing="-1" Columns="4" Culture="ar-DZ" RenderDirection="Vertical">
                        </TimeView>
                        <TimePopupButton HoverImageUrl="" ImageUrl="" />
                        <Calendar UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False" ViewSelectorText="x">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDateTimePicker>

<%--                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ButtonBegin" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonEnd" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </td>
        <td>
            <asp:Button ID="ButtonBegin" runat="server" Text="الآن" CausesValidation="False"
                        OnClick="ButtonBegin_Click" />
            <asp:Button ID="ButtonEnd" runat="server" Text="بداية يوم غد" CausesValidation="False"
                        OnClick="ButtonEnd_Click" />
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator"
                                        ControlToValidate="RadDateTimePicker1" Display="Static" Enabled="false" />
        <%--<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator"
        ControlToValidate="RadDateTimePicker1" Display="Static" Enabled="false" />
        <asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator"
        ControlToValidate="RadDateTimePicker1" Display="Static" />--%>
        <%--<asp:CustomValidator runat="server" ID="DateValidator" CssClass="DDControl DDValidator"
        ControlToValidate="RadDateTimePicker1" Display="Static" EnableClientScript="false"
        Enabled="false" OnServerValidate="DateValidator_ServerValidate" />--%>
        </td>
    </tr>
</table>
