<%@ Control Language="C#" Inherits="ElMestakbal.EndPublishDate_EditField" CodeBehind="EndPublishDate_Edit.ascx.cs" %>
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
                        <DateInput DateFormat="dd-MM-yyyy" DisplayDateFormat="dd-MM-yyyy" EmptyMessage="غير محدد (حذف يدوي)"
                            EnableSingleInputRendering="True" LabelWidth="64px">
                        </DateInput>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDateTimePicker>

<%--                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ButtonTomorrow" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonNow" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="ButtonUnknown" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>--%>
        </td>
        <td>
                    <asp:Button ID="ButtonTomorrow" runat="server" Text="نهاية يوم غد" CausesValidation="False"
                        OnClick="ButtonTomorrow_Click" Height="26px" />
                    <asp:Button ID="ButtonNow" runat="server" Text="الآن" OnClick="ButtonNow_Click" />
                    <asp:Button ID="ButtonUnknown" runat="server" Text="غير محدد" CausesValidation="False"
                        OnClick="ButtonUnknown_Click" />
        </td>
        <td>
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="DDControl DDValidator"
                ControlToValidate="RadDateTimePicker1" Display="Static" Enabled="false" />
            <%--<asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator1" CssClass="DDControl DDValidator"
    ControlToValidate="RadDateTimePicker1" Display="Static" Enabled="false" />--%>
            <%--<asp:DynamicValidator runat="server" ID="DynamicValidator1" CssClass="DDControl DDValidator"
    ControlToValidate="RadDateTimePicker1" Display="Static" />--%>
            <%--<asp:CustomValidator runat="server" ID="DateValidator" CssClass="DDControl DDValidator"
    ControlToValidate="RadDateTimePicker1" Display="Static" EnableClientScript="false"
    Enabled="false" OnServerValidate="DateValidator_ServerValidate" />--%>
        </td>
    </tr>
</table>
